import 'package:meta/meta.dart';

/// AWS CodeDeploy
///
/// AWS CodeDeploy is a deployment service that automates application
/// deployments to Amazon EC2 instances, on-premises instances running in your
/// own facility, serverless AWS Lambda functions, or applications in an Amazon
/// ECS service.
///
/// You can deploy a nearly unlimited variety of application content, such as an
/// updated Lambda function, updated applications in an Amazon ECS service,
/// code, web and configuration files, executables, packages, scripts,
/// multimedia files, and so on. AWS CodeDeploy can deploy application content
/// stored in Amazon S3 buckets, GitHub repositories, or Bitbucket repositories.
/// You do not need to make changes to your existing code before you can use AWS
/// CodeDeploy.
///
/// AWS CodeDeploy makes it easier for you to rapidly release new features,
/// helps you avoid downtime during application deployment, and handles the
/// complexity of updating your applications, without many of the risks
/// associated with error-prone manual deployments.
///
///  **AWS CodeDeploy Components**
///
/// Use the information in this guide to help you work with the following AWS
/// CodeDeploy components:
///
/// *    **Application**: A name that uniquely identifies the application you
/// want to deploy. AWS CodeDeploy uses this name, which functions as a
/// container, to ensure the correct combination of revision, deployment
/// configuration, and deployment group are referenced during a deployment.
///
/// *    **Deployment group**: A set of individual instances, CodeDeploy Lambda
/// deployment configuration settings, or an Amazon ECS service and network
/// details. A Lambda deployment group specifies how to route traffic to a new
/// version of a Lambda function. An Amazon ECS deployment group specifies the
/// service created in Amazon ECS to deploy, a load balancer, and a listener to
/// reroute production traffic to an updated containerized application. An
/// EC2/On-premises deployment group contains individually tagged instances,
/// Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both. All
/// deployment groups can specify optional trigger, alarm, and rollback
/// settings.
///
/// *    **Deployment configuration**: A set of deployment rules and deployment
/// success and failure conditions used by AWS CodeDeploy during a deployment.
///
/// *    **Deployment**: The process and the components used when updating a
/// Lambda function, a containerized application in an Amazon ECS service, or of
/// installing content on one or more instances.
///
/// *    **Application revisions**: For an AWS Lambda deployment, this is an
/// AppSpec file that specifies the Lambda function to be updated and one or
/// more functions to validate deployment lifecycle events. For an Amazon ECS
/// deployment, this is an AppSpec file that specifies the Amazon ECS task
/// definition, container, and port where production traffic is rerouted. For an
/// EC2/On-premises deployment, this is an archive file that contains source
/// content—source code, webpages, executable files, and deployment
/// scripts—along with an AppSpec file. Revisions are stored in Amazon S3
/// buckets or GitHub repositories. For Amazon S3, a revision is uniquely
/// identified by its Amazon S3 object key and its ETag, version, or both. For
/// GitHub, a revision is uniquely identified by its commit ID.
///
///
/// This guide also contains information to help you get details about the
/// instances in your deployments, to make on-premises instances available for
/// AWS CodeDeploy deployments, to get details about a Lambda function
/// deployment, and to get details about Amazon ECS service deployments.
///
///  **AWS CodeDeploy Information Resources**
///
/// *    [AWS CodeDeploy User
/// Guide](https://docs.aws.amazon.com/codedeploy/latest/userguide)
///
/// *    [AWS CodeDeploy API Reference
/// Guide](https://docs.aws.amazon.com/codedeploy/latest/APIReference/)
///
/// *    [AWS CLI Reference for AWS
/// CodeDeploy](https://docs.aws.amazon.com/cli/latest/reference/deploy/index.html)
///
/// *    [AWS CodeDeploy Developer
/// Forum](https://forums.aws.amazon.com/forum.jspa?forumID=179)
class CodeDeployApi {
  /// Adds tags to on-premises instances.
  Future<void> addTagsToOnPremisesInstances(
      {@required List<Tag> tags, @required List<String> instanceNames}) async {}

  /// Gets information about one or more application revisions. The maximum
  /// number of application revisions that can be returned is 25.
  Future<void> batchGetApplicationRevisions(
      {@required String applicationName,
      @required List<RevisionLocation> revisions}) async {}

  /// Gets information about one or more applications. The maximum number of
  /// applications that can be returned is 25.
  Future<void> batchGetApplications(List<String> applicationNames) async {}

  /// Gets information about one or more deployment groups.
  Future<void> batchGetDeploymentGroups(
      {@required String applicationName,
      @required List<String> deploymentGroupNames}) async {}

  ///  This method works, but is deprecated. Use `BatchGetDeploymentTargets`
  /// instead.
  ///
  ///  Returns an array of one or more instances associated with a deployment.
  /// This method works with EC2/On-premises and AWS Lambda compute platforms.
  /// The newer `BatchGetDeploymentTargets` works with all compute platforms.
  /// The maximum number of instances that can be returned is 25.
  Future<void> batchGetDeploymentInstances(
      {@required String deploymentId,
      @required List<String> instanceIds}) async {}

  ///  Returns an array of one or more targets associated with a deployment.
  /// This method works with all compute types and should be used instead of the
  /// deprecated `BatchGetDeploymentInstances`. The maximum number of targets
  /// that can be returned is 25.
  ///
  ///  The type of targets returned depends on the deployment's compute
  /// platform:
  ///
  /// *    **EC2/On-premises**: Information about EC2 instance targets.
  ///
  /// *    **AWS Lambda**: Information about Lambda functions targets.
  ///
  /// *    **Amazon ECS**: Information about Amazon ECS service targets.
  Future<void> batchGetDeploymentTargets(
      {String deploymentId, List<String> targetIds}) async {}

  /// Gets information about one or more deployments. The maximum number of
  /// deployments that can be returned is 25.
  Future<void> batchGetDeployments(List<String> deploymentIds) async {}

  /// Gets information about one or more on-premises instances. The maximum
  /// number of on-premises instances that can be returned is 25.
  Future<void> batchGetOnPremisesInstances(List<String> instanceNames) async {}

  /// For a blue/green deployment, starts the process of rerouting traffic from
  /// instances in the original environment to instances in the replacement
  /// environment without waiting for a specified wait time to elapse. (Traffic
  /// rerouting, which is achieved by registering instances in the replacement
  /// environment with the load balancer, can start as soon as all instances
  /// have a status of Ready.)
  Future<void> continueDeployment(
      {String deploymentId, String deploymentWaitType}) async {}

  /// Creates an application.
  Future<void> createApplication(String applicationName,
      {String computePlatform, List<Tag> tags}) async {}

  /// Deploys an application revision through the specified deployment group.
  Future<void> createDeployment(String applicationName,
      {String deploymentGroupName,
      RevisionLocation revision,
      String deploymentConfigName,
      String description,
      bool ignoreApplicationStopFailures,
      TargetInstances targetInstances,
      AutoRollbackConfiguration autoRollbackConfiguration,
      bool updateOutdatedInstancesOnly,
      String fileExistsBehavior}) async {}

  ///  Creates a deployment configuration.
  Future<void> createDeploymentConfig(String deploymentConfigName,
      {MinimumHealthyHosts minimumHealthyHosts,
      TrafficRoutingConfig trafficRoutingConfig,
      String computePlatform}) async {}

  /// Creates a deployment group to which application revisions are deployed.
  Future<void> createDeploymentGroup(
      {@required String applicationName,
      @required String deploymentGroupName,
      String deploymentConfigName,
      List<Ec2TagFilter> ec2TagFilters,
      List<TagFilter> onPremisesInstanceTagFilters,
      List<String> autoScalingGroups,
      @required String serviceRoleArn,
      List<TriggerConfig> triggerConfigurations,
      AlarmConfiguration alarmConfiguration,
      AutoRollbackConfiguration autoRollbackConfiguration,
      DeploymentStyle deploymentStyle,
      BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration,
      LoadBalancerInfo loadBalancerInfo,
      Ec2TagSet ec2TagSet,
      List<EcsService> ecsServices,
      OnPremisesTagSet onPremisesTagSet,
      List<Tag> tags}) async {}

  /// Deletes an application.
  Future<void> deleteApplication(String applicationName) async {}

  /// Deletes a deployment configuration.
  ///
  ///
  ///
  /// A deployment configuration cannot be deleted if it is currently in use.
  /// Predefined configurations cannot be deleted.
  Future<void> deleteDeploymentConfig(String deploymentConfigName) async {}

  /// Deletes a deployment group.
  Future<void> deleteDeploymentGroup(
      {@required String applicationName,
      @required String deploymentGroupName}) async {}

  /// Deletes a GitHub account connection.
  Future<void> deleteGitHubAccountToken({String tokenName}) async {}

  /// Deregisters an on-premises instance.
  Future<void> deregisterOnPremisesInstance(String instanceName) async {}

  /// Gets information about an application.
  Future<void> getApplication(String applicationName) async {}

  /// Gets information about an application revision.
  Future<void> getApplicationRevision(
      {@required String applicationName,
      @required RevisionLocation revision}) async {}

  /// Gets information about a deployment.
  ///
  ///   The `content` property of the `appSpecContent` object in the returned
  /// revision is always null. Use `GetApplicationRevision` and the `sha256`
  /// property of the returned `appSpecContent` object to get the content of the
  /// deployment’s AppSpec file.
  Future<void> getDeployment(String deploymentId) async {}

  /// Gets information about a deployment configuration.
  Future<void> getDeploymentConfig(String deploymentConfigName) async {}

  /// Gets information about a deployment group.
  Future<void> getDeploymentGroup(
      {@required String applicationName,
      @required String deploymentGroupName}) async {}

  /// Gets information about an instance as part of a deployment.
  Future<void> getDeploymentInstance(
      {@required String deploymentId, @required String instanceId}) async {}

  ///  Returns information about a deployment target.
  Future<void> getDeploymentTarget(
      {String deploymentId, String targetId}) async {}

  ///  Gets information about an on-premises instance.
  Future<void> getOnPremisesInstance(String instanceName) async {}

  /// Lists information about revisions for an application.
  Future<void> listApplicationRevisions(String applicationName,
      {String sortBy,
      String sortOrder,
      String s3Bucket,
      String s3KeyPrefix,
      String deployed,
      String nextToken}) async {}

  /// Lists the applications registered with the IAM user or AWS account.
  Future<void> listApplications({String nextToken}) async {}

  /// Lists the deployment configurations with the IAM user or AWS account.
  Future<void> listDeploymentConfigs({String nextToken}) async {}

  /// Lists the deployment groups for an application registered with the IAM
  /// user or AWS account.
  Future<void> listDeploymentGroups(String applicationName,
      {String nextToken}) async {}

  ///  The newer BatchGetDeploymentTargets should be used instead because it
  /// works with all compute types. `ListDeploymentInstances` throws an
  /// exception if it is used with a compute platform other than EC2/On-premises
  /// or AWS Lambda.
  ///
  ///  Lists the instance for a deployment associated with the IAM user or AWS
  /// account.
  Future<void> listDeploymentInstances(String deploymentId,
      {String nextToken,
      List<String> instanceStatusFilter,
      List<String> instanceTypeFilter}) async {}

  ///  Returns an array of target IDs that are associated a deployment.
  Future<void> listDeploymentTargets(
      {String deploymentId,
      String nextToken,
      Map<String, List<String>> targetFilters}) async {}

  /// Lists the deployments in a deployment group for an application registered
  /// with the IAM user or AWS account.
  Future<void> listDeployments(
      {String applicationName,
      String deploymentGroupName,
      List<String> includeOnlyStatuses,
      TimeRange createTimeRange,
      String nextToken}) async {}

  /// Lists the names of stored connections to GitHub accounts.
  Future<void> listGitHubAccountTokenNames({String nextToken}) async {}

  /// Gets a list of names for one or more on-premises instances.
  ///
  /// Unless otherwise specified, both registered and deregistered on-premises
  /// instance names are listed. To list only registered or deregistered
  /// on-premises instance names, use the registration status parameter.
  Future<void> listOnPremisesInstances(
      {String registrationStatus,
      List<TagFilter> tagFilters,
      String nextToken}) async {}

  ///  Returns a list of tags for the resource identified by a specified ARN.
  /// Tags are used to organize and categorize your CodeDeploy resources.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken}) async {}

  ///  Sets the result of a Lambda validation function. The function validates
  /// one or both lifecycle events (`BeforeAllowTraffic` and
  /// `AfterAllowTraffic`) and returns `Succeeded` or `Failed`.
  Future<void> putLifecycleEventHookExecutionStatus(
      {String deploymentId,
      String lifecycleEventHookExecutionId,
      String status}) async {}

  /// Registers with AWS CodeDeploy a revision for the specified application.
  Future<void> registerApplicationRevision(
      {@required String applicationName,
      String description,
      @required RevisionLocation revision}) async {}

  /// Registers an on-premises instance.
  ///
  ///
  ///
  /// Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the
  /// request. You cannot use both.
  Future<void> registerOnPremisesInstance(String instanceName,
      {String iamSessionArn, String iamUserArn}) async {}

  /// Removes one or more tags from one or more on-premises instances.
  Future<void> removeTagsFromOnPremisesInstances(
      {@required List<Tag> tags, @required List<String> instanceNames}) async {}

  /// In a blue/green deployment, overrides any specified wait time and starts
  /// terminating instances immediately after the traffic routing is complete.
  Future<void> skipWaitTimeForInstanceTermination(
      {String deploymentId}) async {}

  /// Attempts to stop an ongoing deployment.
  Future<void> stopDeployment(String deploymentId,
      {bool autoRollbackEnabled}) async {}

  ///  Associates the list of tags in the input `Tags` parameter with the
  /// resource identified by the `ResourceArn` input parameter.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  ///  Disassociates a resource from a list of tags. The resource is identified
  /// by the `ResourceArn` input parameter. The tags are identfied by the list
  /// of keys in the `TagKeys` input parameter.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Changes the name of an application.
  Future<void> updateApplication(
      {String applicationName, String newApplicationName}) async {}

  /// Changes information about a deployment group.
  Future<void> updateDeploymentGroup(
      {@required String applicationName,
      @required String currentDeploymentGroupName,
      String newDeploymentGroupName,
      String deploymentConfigName,
      List<Ec2TagFilter> ec2TagFilters,
      List<TagFilter> onPremisesInstanceTagFilters,
      List<String> autoScalingGroups,
      String serviceRoleArn,
      List<TriggerConfig> triggerConfigurations,
      AlarmConfiguration alarmConfiguration,
      AutoRollbackConfiguration autoRollbackConfiguration,
      DeploymentStyle deploymentStyle,
      BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration,
      LoadBalancerInfo loadBalancerInfo,
      Ec2TagSet ec2TagSet,
      List<EcsService> ecsServices,
      OnPremisesTagSet onPremisesTagSet}) async {}
}

class Alarm {}

class AlarmConfiguration {}

class AppSpecContent {}

class ApplicationInfo {}

class AutoRollbackConfiguration {}

class AutoScalingGroup {}

class BatchGetApplicationRevisionsOutput {}

class BatchGetApplicationsOutput {}

class BatchGetDeploymentGroupsOutput {}

class BatchGetDeploymentInstancesOutput {}

class BatchGetDeploymentTargetsOutput {}

class BatchGetDeploymentsOutput {}

class BatchGetOnPremisesInstancesOutput {}

class BlueGreenDeploymentConfiguration {}

class BlueInstanceTerminationOption {}

class CreateApplicationOutput {}

class CreateDeploymentConfigOutput {}

class CreateDeploymentGroupOutput {}

class CreateDeploymentOutput {}

class DeleteDeploymentGroupOutput {}

class DeleteGitHubAccountTokenOutput {}

class DeploymentConfigInfo {}

class DeploymentGroupInfo {}

class DeploymentInfo {}

class DeploymentOverview {}

class DeploymentReadyOption {}

class DeploymentStyle {}

class DeploymentTarget {}

class Diagnostics {}

class Ec2TagFilter {}

class Ec2TagSet {}

class EcsService {}

class EcsTarget {}

class EcsTaskSet {}

class ElbInfo {}

class ErrorInformation {}

class GenericRevisionInfo {}

class GetApplicationOutput {}

class GetApplicationRevisionOutput {}

class GetDeploymentConfigOutput {}

class GetDeploymentGroupOutput {}

class GetDeploymentInstanceOutput {}

class GetDeploymentOutput {}

class GetDeploymentTargetOutput {}

class GetOnPremisesInstanceOutput {}

class GitHubLocation {}

class GreenFleetProvisioningOption {}

class InstanceInfo {}

class InstanceSummary {}

class InstanceTarget {}

class LambdaFunctionInfo {}

class LambdaTarget {}

class LastDeploymentInfo {}

class LifecycleEvent {}

class ListApplicationRevisionsOutput {}

class ListApplicationsOutput {}

class ListDeploymentConfigsOutput {}

class ListDeploymentGroupsOutput {}

class ListDeploymentInstancesOutput {}

class ListDeploymentTargetsOutput {}

class ListDeploymentsOutput {}

class ListGitHubAccountTokenNamesOutput {}

class ListOnPremisesInstancesOutput {}

class ListTagsForResourceOutput {}

class LoadBalancerInfo {}

class MinimumHealthyHosts {}

class OnPremisesTagSet {}

class PutLifecycleEventHookExecutionStatusOutput {}

class RawString {}

class RevisionInfo {}

class RevisionLocation {}

class RollbackInfo {}

class S3Location {}

class StopDeploymentOutput {}

class Tag {}

class TagFilter {}

class TagResourceOutput {}

class TargetGroupInfo {}

class TargetGroupPairInfo {}

class TargetInstances {}

class TimeBasedCanary {}

class TimeBasedLinear {}

class TimeRange {}

class TrafficRoute {}

class TrafficRoutingConfig {}

class TriggerConfig {}

class UntagResourceOutput {}

class UpdateDeploymentGroupOutput {}
