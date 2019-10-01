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
  ///
  /// [tags]: The tag key-value pairs to add to the on-premises instances.
  ///
  /// Keys and values are both required. Keys cannot be null or empty strings.
  /// Value-only tags are not allowed.
  ///
  /// [instanceNames]: The names of the on-premises instances to which to add
  /// tags.
  Future<void> addTagsToOnPremisesInstances(
      {@required List<Tag> tags, @required List<String> instanceNames}) async {}

  /// Gets information about one or more application revisions. The maximum
  /// number of application revisions that can be returned is 25.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application about which
  /// to get revision information.
  ///
  /// [revisions]: An array of `RevisionLocation` objects that specify
  /// information to get about the application revisions, including type and
  /// location. The maximum number of `RevisionLocation` objects you can specify
  /// is 25.
  Future<BatchGetApplicationRevisionsOutput> batchGetApplicationRevisions(
      {@required String applicationName,
      @required List<RevisionLocation> revisions}) async {
    return BatchGetApplicationRevisionsOutput.fromJson({});
  }

  /// Gets information about one or more applications. The maximum number of
  /// applications that can be returned is 25.
  ///
  /// [applicationNames]: A list of application names separated by spaces. The
  /// maximum number of application names you can specify is 25.
  Future<BatchGetApplicationsOutput> batchGetApplications(
      List<String> applicationNames) async {
    return BatchGetApplicationsOutput.fromJson({});
  }

  /// Gets information about one or more deployment groups.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the applicable IAM user or AWS account.
  ///
  /// [deploymentGroupNames]: The names of the deployment groups.
  Future<BatchGetDeploymentGroupsOutput> batchGetDeploymentGroups(
      {@required String applicationName,
      @required List<String> deploymentGroupNames}) async {
    return BatchGetDeploymentGroupsOutput.fromJson({});
  }

  ///  This method works, but is deprecated. Use `BatchGetDeploymentTargets`
  /// instead.
  ///
  ///  Returns an array of one or more instances associated with a deployment.
  /// This method works with EC2/On-premises and AWS Lambda compute platforms.
  /// The newer `BatchGetDeploymentTargets` works with all compute platforms.
  /// The maximum number of instances that can be returned is 25.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [instanceIds]: The unique IDs of instances used in the deployment. The
  /// maximum number of instance IDs you can specify is 25.
  Future<BatchGetDeploymentInstancesOutput> batchGetDeploymentInstances(
      {@required String deploymentId,
      @required List<String> instanceIds}) async {
    return BatchGetDeploymentInstancesOutput.fromJson({});
  }

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
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [targetIds]:  The unique IDs of the deployment targets. The compute
  /// platform of the deployment determines the type of the targets and their
  /// formats. The maximum number of deployment target IDs you can specify is
  /// 25.
  ///
  /// *    For deployments that use the EC2/On-premises compute platform, the
  /// target IDs are EC2 or on-premises instances IDs, and their target type is
  /// `instanceTarget`.
  ///
  /// *    For deployments that use the AWS Lambda compute platform, the target
  /// IDs are the names of Lambda functions, and their target type is
  /// `instanceTarget`.
  ///
  /// *    For deployments that use the Amazon ECS compute platform, the target
  /// IDs are pairs of Amazon ECS clusters and services specified using the
  /// format `<clustername>:<servicename>`. Their target type is `ecsTarget`.
  Future<BatchGetDeploymentTargetsOutput> batchGetDeploymentTargets(
      {String deploymentId, List<String> targetIds}) async {
    return BatchGetDeploymentTargetsOutput.fromJson({});
  }

  /// Gets information about one or more deployments. The maximum number of
  /// deployments that can be returned is 25.
  ///
  /// [deploymentIds]:  A list of deployment IDs, separated by spaces. The
  /// maximum number of deployment IDs you can specify is 25.
  Future<BatchGetDeploymentsOutput> batchGetDeployments(
      List<String> deploymentIds) async {
    return BatchGetDeploymentsOutput.fromJson({});
  }

  /// Gets information about one or more on-premises instances. The maximum
  /// number of on-premises instances that can be returned is 25.
  ///
  /// [instanceNames]: The names of the on-premises instances about which to get
  /// information. The maximum number of instance names you can specify is 25.
  Future<BatchGetOnPremisesInstancesOutput> batchGetOnPremisesInstances(
      List<String> instanceNames) async {
    return BatchGetOnPremisesInstancesOutput.fromJson({});
  }

  /// For a blue/green deployment, starts the process of rerouting traffic from
  /// instances in the original environment to instances in the replacement
  /// environment without waiting for a specified wait time to elapse. (Traffic
  /// rerouting, which is achieved by registering instances in the replacement
  /// environment with the load balancer, can start as soon as all instances
  /// have a status of Ready.)
  ///
  /// [deploymentId]:  The unique ID of a blue/green deployment for which you
  /// want to start rerouting traffic to the replacement environment.
  ///
  /// [deploymentWaitType]:  The status of the deployment's waiting period.
  /// READY\_WAIT indicates the deployment is ready to start shifting traffic.
  /// TERMINATION\_WAIT indicates the traffic is shifted, but the original
  /// target is not terminated.
  Future<void> continueDeployment(
      {String deploymentId, String deploymentWaitType}) async {}

  /// Creates an application.
  ///
  /// [applicationName]: The name of the application. This name must be unique
  /// with the applicable IAM user or AWS account.
  ///
  /// [computePlatform]:  The destination platform type for the deployment
  /// (`Lambda`, `Server`, or `ECS`).
  ///
  /// [tags]:  The metadata that you apply to CodeDeploy applications to help
  /// you organize and categorize them. Each tag consists of a key and an
  /// optional value, both of which you define.
  Future<CreateApplicationOutput> createApplication(String applicationName,
      {String computePlatform, List<Tag> tags}) async {
    return CreateApplicationOutput.fromJson({});
  }

  /// Deploys an application revision through the specified deployment group.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [deploymentGroupName]: The name of the deployment group.
  ///
  /// [revision]:  The type and location of the revision to deploy.
  ///
  /// [deploymentConfigName]: The name of a deployment configuration associated
  /// with the IAM user or AWS account.
  ///
  /// If not specified, the value configured in the deployment group is used as
  /// the default. If the deployment group does not have a deployment
  /// configuration associated with it, CodeDeployDefault.OneAtATime is used by
  /// default.
  ///
  /// [description]: A comment about the deployment.
  ///
  /// [ignoreApplicationStopFailures]:  If true, then if an ApplicationStop,
  /// BeforeBlockTraffic, or AfterBlockTraffic deployment lifecycle event to an
  /// instance fails, then the deployment continues to the next deployment
  /// lifecycle event. For example, if ApplicationStop fails, the deployment
  /// continues with DownloadBundle. If BeforeBlockTraffic fails, the deployment
  /// continues with BlockTraffic. If AfterBlockTraffic fails, the deployment
  /// continues with ApplicationStop.
  ///
  ///  If false or not specified, then if a lifecycle event fails during a
  /// deployment to an instance, that deployment fails. If deployment to that
  /// instance is part of an overall deployment and the number of healthy hosts
  /// is not less than the minimum number of healthy hosts, then a deployment to
  /// the next instance is attempted.
  ///
  ///  During a deployment, the AWS CodeDeploy agent runs the scripts specified
  /// for ApplicationStop, BeforeBlockTraffic, and AfterBlockTraffic in the
  /// AppSpec file from the previous successful deployment. (All other scripts
  /// are run from the AppSpec file in the current deployment.) If one of these
  /// scripts contains an error and does not run successfully, the deployment
  /// can fail.
  ///
  ///  If the cause of the failure is a script from the last successful
  /// deployment that will never run successfully, create a new deployment and
  /// use `ignoreApplicationStopFailures` to specify that the ApplicationStop,
  /// BeforeBlockTraffic, and AfterBlockTraffic failures should be ignored.
  ///
  /// [targetInstances]:  Information about the instances that belong to the
  /// replacement environment in a blue/green deployment.
  ///
  /// [autoRollbackConfiguration]: Configuration information for an automatic
  /// rollback that is added when a deployment is created.
  ///
  /// [updateOutdatedInstancesOnly]:  Indicates whether to deploy to all
  /// instances or only to instances that are not running the latest application
  /// revision.
  ///
  /// [fileExistsBehavior]: Information about how AWS CodeDeploy handles files
  /// that already exist in a deployment target location but weren't part of the
  /// previous successful deployment.
  ///
  /// The fileExistsBehavior parameter takes any of the following values:
  ///
  /// *   DISALLOW: The deployment fails. This is also the default behavior if
  /// no option is specified.
  ///
  /// *   OVERWRITE: The version of the file from the application revision
  /// currently being deployed replaces the version already on the instance.
  ///
  /// *   RETAIN: The version of the file already on the instance is kept and
  /// used as part of the new deployment.
  Future<CreateDeploymentOutput> createDeployment(String applicationName,
      {String deploymentGroupName,
      RevisionLocation revision,
      String deploymentConfigName,
      String description,
      bool ignoreApplicationStopFailures,
      TargetInstances targetInstances,
      AutoRollbackConfiguration autoRollbackConfiguration,
      bool updateOutdatedInstancesOnly,
      String fileExistsBehavior}) async {
    return CreateDeploymentOutput.fromJson({});
  }

  ///  Creates a deployment configuration.
  ///
  /// [deploymentConfigName]: The name of the deployment configuration to
  /// create.
  ///
  /// [minimumHealthyHosts]: The minimum number of healthy instances that should
  /// be available at any time during the deployment. There are two parameters
  /// expected in the input: type and value.
  ///
  /// The type parameter takes either of the following values:
  ///
  /// *   HOST_COUNT: The value parameter represents the minimum number of
  /// healthy instances as an absolute value.
  ///
  /// *   FLEET\_PERCENT: The value parameter represents the minimum number of
  /// healthy instances as a percentage of the total number of instances in the
  /// deployment. If you specify FLEET\_PERCENT, at the start of the deployment,
  /// AWS CodeDeploy converts the percentage to the equivalent number of
  /// instance and rounds up fractional instances.
  ///
  ///
  /// The value parameter takes an integer.
  ///
  /// For example, to set a minimum of 95% healthy instance, specify a type of
  /// FLEET_PERCENT and a value of 95.
  ///
  /// [trafficRoutingConfig]: The configuration that specifies how the
  /// deployment traffic is routed.
  ///
  /// [computePlatform]: The destination platform type for the deployment
  /// (`Lambda`, `Server`, or `ECS`).
  Future<CreateDeploymentConfigOutput> createDeploymentConfig(
      String deploymentConfigName,
      {MinimumHealthyHosts minimumHealthyHosts,
      TrafficRoutingConfig trafficRoutingConfig,
      String computePlatform}) async {
    return CreateDeploymentConfigOutput.fromJson({});
  }

  /// Creates a deployment group to which application revisions are deployed.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [deploymentGroupName]: The name of a new deployment group for the
  /// specified application.
  ///
  /// [deploymentConfigName]: If specified, the deployment configuration name
  /// can be either one of the predefined configurations provided with AWS
  /// CodeDeploy or a custom deployment configuration that you create by calling
  /// the create deployment configuration operation.
  ///
  /// CodeDeployDefault.OneAtATime is the default deployment configuration. It
  /// is used if a configuration isn't specified for the deployment or
  /// deployment group.
  ///
  /// For more information about the predefined deployment configurations in AWS
  /// CodeDeploy, see [Working with Deployment Groups in AWS
  /// CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html)
  /// in the AWS CodeDeploy User Guide.
  ///
  /// [ec2TagFilters]: The Amazon EC2 tags on which to filter. The deployment
  /// group includes EC2 instances with any of the specified tags. Cannot be
  /// used in the same call as ec2TagSet.
  ///
  /// [onPremisesInstanceTagFilters]: The on-premises instance tags on which to
  /// filter. The deployment group includes on-premises instances with any of
  /// the specified tags. Cannot be used in the same call as OnPremisesTagSet.
  ///
  /// [autoScalingGroups]: A list of associated Amazon EC2 Auto Scaling groups.
  ///
  /// [serviceRoleArn]: A service role ARN that allows AWS CodeDeploy to act on
  /// the user's behalf when interacting with AWS services.
  ///
  /// [triggerConfigurations]: Information about triggers to create when the
  /// deployment group is created. For examples, see [Create a Trigger for an
  /// AWS CodeDeploy
  /// Event](https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-sns.html)
  /// in the AWS CodeDeploy User Guide.
  ///
  /// [alarmConfiguration]: Information to add about Amazon CloudWatch alarms
  /// when the deployment group is created.
  ///
  /// [autoRollbackConfiguration]: Configuration information for an automatic
  /// rollback that is added when a deployment group is created.
  ///
  /// [deploymentStyle]: Information about the type of deployment, in-place or
  /// blue/green, that you want to run and whether to route deployment traffic
  /// behind a load balancer.
  ///
  /// [blueGreenDeploymentConfiguration]: Information about blue/green
  /// deployment options for a deployment group.
  ///
  /// [loadBalancerInfo]: Information about the load balancer used in a
  /// deployment.
  ///
  /// [ec2TagSet]: Information about groups of tags applied to EC2 instances.
  /// The deployment group includes only EC2 instances identified by all the tag
  /// groups. Cannot be used in the same call as ec2TagFilters.
  ///
  /// [ecsServices]:  The target Amazon ECS services in the deployment group.
  /// This applies only to deployment groups that use the Amazon ECS compute
  /// platform. A target Amazon ECS service is specified as an Amazon ECS
  /// cluster and service name pair using the format
  /// `<clustername>:<servicename>`.
  ///
  /// [onPremisesTagSet]: Information about groups of tags applied to
  /// on-premises instances. The deployment group includes only on-premises
  /// instances identified by all of the tag groups. Cannot be used in the same
  /// call as onPremisesInstanceTagFilters.
  ///
  /// [tags]:  The metadata that you apply to CodeDeploy deployment groups to
  /// help you organize and categorize them. Each tag consists of a key and an
  /// optional value, both of which you define.
  Future<CreateDeploymentGroupOutput> createDeploymentGroup(
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
      List<Tag> tags}) async {
    return CreateDeploymentGroupOutput.fromJson({});
  }

  /// Deletes an application.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  Future<void> deleteApplication(String applicationName) async {}

  /// Deletes a deployment configuration.
  ///
  ///
  ///
  /// A deployment configuration cannot be deleted if it is currently in use.
  /// Predefined configurations cannot be deleted.
  ///
  /// [deploymentConfigName]: The name of a deployment configuration associated
  /// with the IAM user or AWS account.
  Future<void> deleteDeploymentConfig(String deploymentConfigName) async {}

  /// Deletes a deployment group.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [deploymentGroupName]: The name of a deployment group for the specified
  /// application.
  Future<DeleteDeploymentGroupOutput> deleteDeploymentGroup(
      {@required String applicationName,
      @required String deploymentGroupName}) async {
    return DeleteDeploymentGroupOutput.fromJson({});
  }

  /// Deletes a GitHub account connection.
  ///
  /// [tokenName]: The name of the GitHub account connection to delete.
  Future<DeleteGitHubAccountTokenOutput> deleteGitHubAccountToken(
      {String tokenName}) async {
    return DeleteGitHubAccountTokenOutput.fromJson({});
  }

  /// Deregisters an on-premises instance.
  ///
  /// [instanceName]: The name of the on-premises instance to deregister.
  Future<void> deregisterOnPremisesInstance(String instanceName) async {}

  /// Gets information about an application.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  Future<GetApplicationOutput> getApplication(String applicationName) async {
    return GetApplicationOutput.fromJson({});
  }

  /// Gets information about an application revision.
  ///
  /// [applicationName]: The name of the application that corresponds to the
  /// revision.
  ///
  /// [revision]: Information about the application revision to get, including
  /// type and location.
  Future<GetApplicationRevisionOutput> getApplicationRevision(
      {@required String applicationName,
      @required RevisionLocation revision}) async {
    return GetApplicationRevisionOutput.fromJson({});
  }

  /// Gets information about a deployment.
  ///
  ///   The `content` property of the `appSpecContent` object in the returned
  /// revision is always null. Use `GetApplicationRevision` and the `sha256`
  /// property of the returned `appSpecContent` object to get the content of the
  /// deployment’s AppSpec file.
  ///
  /// [deploymentId]:  The unique ID of a deployment associated with the IAM
  /// user or AWS account.
  Future<GetDeploymentOutput> getDeployment(String deploymentId) async {
    return GetDeploymentOutput.fromJson({});
  }

  /// Gets information about a deployment configuration.
  ///
  /// [deploymentConfigName]: The name of a deployment configuration associated
  /// with the IAM user or AWS account.
  Future<GetDeploymentConfigOutput> getDeploymentConfig(
      String deploymentConfigName) async {
    return GetDeploymentConfigOutput.fromJson({});
  }

  /// Gets information about a deployment group.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [deploymentGroupName]: The name of a deployment group for the specified
  /// application.
  Future<GetDeploymentGroupOutput> getDeploymentGroup(
      {@required String applicationName,
      @required String deploymentGroupName}) async {
    return GetDeploymentGroupOutput.fromJson({});
  }

  /// Gets information about an instance as part of a deployment.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [instanceId]:  The unique ID of an instance in the deployment group.
  Future<GetDeploymentInstanceOutput> getDeploymentInstance(
      {@required String deploymentId, @required String instanceId}) async {
    return GetDeploymentInstanceOutput.fromJson({});
  }

  ///  Returns information about a deployment target.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [targetId]:  The unique ID of a deployment target.
  Future<GetDeploymentTargetOutput> getDeploymentTarget(
      {String deploymentId, String targetId}) async {
    return GetDeploymentTargetOutput.fromJson({});
  }

  ///  Gets information about an on-premises instance.
  ///
  /// [instanceName]:  The name of the on-premises instance about which to get
  /// information.
  Future<GetOnPremisesInstanceOutput> getOnPremisesInstance(
      String instanceName) async {
    return GetOnPremisesInstanceOutput.fromJson({});
  }

  /// Lists information about revisions for an application.
  ///
  /// [applicationName]:  The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [sortBy]: The column name to use to sort the list results:
  ///
  /// *   registerTime: Sort by the time the revisions were registered with AWS
  /// CodeDeploy.
  ///
  /// *   firstUsedTime: Sort by the time the revisions were first used in a
  /// deployment.
  ///
  /// *   lastUsedTime: Sort by the time the revisions were last used in a
  /// deployment.
  ///
  ///
  ///  If not specified or set to null, the results are returned in an arbitrary
  /// order.
  ///
  /// [sortOrder]:  The order in which to sort the list results:
  ///
  /// *   ascending: ascending order.
  ///
  /// *   descending: descending order.
  ///
  ///
  /// If not specified, the results are sorted in ascending order.
  ///
  /// If set to null, the results are sorted in an arbitrary order.
  ///
  /// [s3Bucket]:  An Amazon S3 bucket name to limit the search for revisions.
  ///
  ///  If set to null, all of the user's buckets are searched.
  ///
  /// [s3KeyPrefix]:  A key prefix for the set of Amazon S3 objects to limit the
  /// search for revisions.
  ///
  /// [deployed]:  Whether to list revisions based on whether the revision is
  /// the target revision of an deployment group:
  ///
  /// *   include: List revisions that are target revisions of a deployment
  /// group.
  ///
  /// *   exclude: Do not list revisions that are target revisions of a
  /// deployment group.
  ///
  /// *   ignore: List all revisions.
  ///
  /// [nextToken]: An identifier returned from the previous
  /// `ListApplicationRevisions` call. It can be used to return the next set of
  /// applications in the list.
  Future<ListApplicationRevisionsOutput> listApplicationRevisions(
      String applicationName,
      {String sortBy,
      String sortOrder,
      String s3Bucket,
      String s3KeyPrefix,
      String deployed,
      String nextToken}) async {
    return ListApplicationRevisionsOutput.fromJson({});
  }

  /// Lists the applications registered with the IAM user or AWS account.
  ///
  /// [nextToken]: An identifier returned from the previous list applications
  /// call. It can be used to return the next set of applications in the list.
  Future<ListApplicationsOutput> listApplications({String nextToken}) async {
    return ListApplicationsOutput.fromJson({});
  }

  /// Lists the deployment configurations with the IAM user or AWS account.
  ///
  /// [nextToken]: An identifier returned from the previous
  /// `ListDeploymentConfigs` call. It can be used to return the next set of
  /// deployment configurations in the list.
  Future<ListDeploymentConfigsOutput> listDeploymentConfigs(
      {String nextToken}) async {
    return ListDeploymentConfigsOutput.fromJson({});
  }

  /// Lists the deployment groups for an application registered with the IAM
  /// user or AWS account.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [nextToken]: An identifier returned from the previous list deployment
  /// groups call. It can be used to return the next set of deployment groups in
  /// the list.
  Future<ListDeploymentGroupsOutput> listDeploymentGroups(
      String applicationName,
      {String nextToken}) async {
    return ListDeploymentGroupsOutput.fromJson({});
  }

  ///  The newer BatchGetDeploymentTargets should be used instead because it
  /// works with all compute types. `ListDeploymentInstances` throws an
  /// exception if it is used with a compute platform other than EC2/On-premises
  /// or AWS Lambda.
  ///
  ///  Lists the instance for a deployment associated with the IAM user or AWS
  /// account.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [nextToken]: An identifier returned from the previous list deployment
  /// instances call. It can be used to return the next set of deployment
  /// instances in the list.
  ///
  /// [instanceStatusFilter]: A subset of instances to list by status:
  ///
  /// *   Pending: Include those instances with pending deployments.
  ///
  /// *   InProgress: Include those instances where deployments are still in
  /// progress.
  ///
  /// *   Succeeded: Include those instances with successful deployments.
  ///
  /// *   Failed: Include those instances with failed deployments.
  ///
  /// *   Skipped: Include those instances with skipped deployments.
  ///
  /// *   Unknown: Include those instances with deployments in an unknown state.
  ///
  /// [instanceTypeFilter]: The set of instances in a blue/green deployment,
  /// either those in the original environment ("BLUE") or those in the
  /// replacement environment ("GREEN"), for which you want to view instance
  /// information.
  Future<ListDeploymentInstancesOutput> listDeploymentInstances(
      String deploymentId,
      {String nextToken,
      List<String> instanceStatusFilter,
      List<String> instanceTypeFilter}) async {
    return ListDeploymentInstancesOutput.fromJson({});
  }

  ///  Returns an array of target IDs that are associated a deployment.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [nextToken]:  A token identifier returned from the previous
  /// `ListDeploymentTargets` call. It can be used to return the next set of
  /// deployment targets in the list.
  ///
  /// [targetFilters]:  A key used to filter the returned targets. The two valid
  /// values are:
  ///
  /// *    `TargetStatus` \- A `TargetStatus` filter string can be `Failed`,
  /// `InProgress`, `Pending`, `Ready`, `Skipped`, `Succeeded`, or `Unknown`.
  ///
  /// *    `ServerInstanceLabel` \- A `ServerInstanceLabel` filter string can be
  /// `Blue` or `Green`.
  Future<ListDeploymentTargetsOutput> listDeploymentTargets(
      {String deploymentId,
      String nextToken,
      Map<String, List<String>> targetFilters}) async {
    return ListDeploymentTargetsOutput.fromJson({});
  }

  /// Lists the deployments in a deployment group for an application registered
  /// with the IAM user or AWS account.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  ///
  ///
  /// If `applicationName` is specified, then `deploymentGroupName` must be
  /// specified. If it is not specified, then `deploymentGroupName` must not be
  /// specified.
  ///
  /// [deploymentGroupName]: The name of a deployment group for the specified
  /// application.
  ///
  ///
  ///
  /// If `deploymentGroupName` is specified, then `applicationName` must be
  /// specified. If it is not specified, then `applicationName` must not be
  /// specified.
  ///
  /// [includeOnlyStatuses]: A subset of deployments to list by status:
  ///
  /// *   Created: Include created deployments in the resulting list.
  ///
  /// *   Queued: Include queued deployments in the resulting list.
  ///
  /// *   In Progress: Include in-progress deployments in the resulting list.
  ///
  /// *   Succeeded: Include successful deployments in the resulting list.
  ///
  /// *   Failed: Include failed deployments in the resulting list.
  ///
  /// *   Stopped: Include stopped deployments in the resulting list.
  ///
  /// [createTimeRange]: A time range (start and end) for returning a subset of
  /// the list of deployments.
  ///
  /// [nextToken]: An identifier returned from the previous list deployments
  /// call. It can be used to return the next set of deployments in the list.
  Future<ListDeploymentsOutput> listDeployments(
      {String applicationName,
      String deploymentGroupName,
      List<String> includeOnlyStatuses,
      TimeRange createTimeRange,
      String nextToken}) async {
    return ListDeploymentsOutput.fromJson({});
  }

  /// Lists the names of stored connections to GitHub accounts.
  ///
  /// [nextToken]: An identifier returned from the previous
  /// ListGitHubAccountTokenNames call. It can be used to return the next set of
  /// names in the list.
  Future<ListGitHubAccountTokenNamesOutput> listGitHubAccountTokenNames(
      {String nextToken}) async {
    return ListGitHubAccountTokenNamesOutput.fromJson({});
  }

  /// Gets a list of names for one or more on-premises instances.
  ///
  /// Unless otherwise specified, both registered and deregistered on-premises
  /// instance names are listed. To list only registered or deregistered
  /// on-premises instance names, use the registration status parameter.
  ///
  /// [registrationStatus]: The registration status of the on-premises
  /// instances:
  ///
  /// *   Deregistered: Include deregistered on-premises instances in the
  /// resulting list.
  ///
  /// *   Registered: Include registered on-premises instances in the resulting
  /// list.
  ///
  /// [tagFilters]: The on-premises instance tags that are used to restrict the
  /// on-premises instance names returned.
  ///
  /// [nextToken]: An identifier returned from the previous list on-premises
  /// instances call. It can be used to return the next set of on-premises
  /// instances in the list.
  Future<ListOnPremisesInstancesOutput> listOnPremisesInstances(
      {String registrationStatus,
      List<TagFilter> tagFilters,
      String nextToken}) async {
    return ListOnPremisesInstancesOutput.fromJson({});
  }

  ///  Returns a list of tags for the resource identified by a specified ARN.
  /// Tags are used to organize and categorize your CodeDeploy resources.
  ///
  /// [resourceArn]:  The ARN of a CodeDeploy resource. `ListTagsForResource`
  /// returns all the tags associated with the resource that is identified by
  /// the `ResourceArn`.
  ///
  /// [nextToken]: An identifier returned from the previous
  /// `ListTagsForResource` call. It can be used to return the next set of
  /// applications in the list.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {String nextToken}) async {
    return ListTagsForResourceOutput.fromJson({});
  }

  ///  Sets the result of a Lambda validation function. The function validates
  /// one or both lifecycle events (`BeforeAllowTraffic` and
  /// `AfterAllowTraffic`) and returns `Succeeded` or `Failed`.
  ///
  /// [deploymentId]:  The unique ID of a deployment. Pass this ID to a Lambda
  /// function that validates a deployment lifecycle event.
  ///
  /// [lifecycleEventHookExecutionId]:  The execution ID of a deployment's
  /// lifecycle hook. A deployment lifecycle hook is specified in the `hooks`
  /// section of the AppSpec file.
  ///
  /// [status]: The result of a Lambda function that validates a deployment
  /// lifecycle event (`Succeeded` or `Failed`).
  Future<PutLifecycleEventHookExecutionStatusOutput>
      putLifecycleEventHookExecutionStatus(
          {String deploymentId,
          String lifecycleEventHookExecutionId,
          String status}) async {
    return PutLifecycleEventHookExecutionStatusOutput.fromJson({});
  }

  /// Registers with AWS CodeDeploy a revision for the specified application.
  ///
  /// [applicationName]: The name of an AWS CodeDeploy application associated
  /// with the IAM user or AWS account.
  ///
  /// [description]: A comment about the revision.
  ///
  /// [revision]: Information about the application revision to register,
  /// including type and location.
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
  ///
  /// [instanceName]: The name of the on-premises instance to register.
  ///
  /// [iamSessionArn]: The ARN of the IAM session to associate with the
  /// on-premises instance.
  ///
  /// [iamUserArn]: The ARN of the IAM user to associate with the on-premises
  /// instance.
  Future<void> registerOnPremisesInstance(String instanceName,
      {String iamSessionArn, String iamUserArn}) async {}

  /// Removes one or more tags from one or more on-premises instances.
  ///
  /// [tags]: The tag key-value pairs to remove from the on-premises instances.
  ///
  /// [instanceNames]: The names of the on-premises instances from which to
  /// remove tags.
  Future<void> removeTagsFromOnPremisesInstances(
      {@required List<Tag> tags, @required List<String> instanceNames}) async {}

  /// In a blue/green deployment, overrides any specified wait time and starts
  /// terminating instances immediately after the traffic routing is complete.
  ///
  /// [deploymentId]:  The unique ID of a blue/green deployment for which you
  /// want to skip the instance termination wait time.
  Future<void> skipWaitTimeForInstanceTermination(
      {String deploymentId}) async {}

  /// Attempts to stop an ongoing deployment.
  ///
  /// [deploymentId]:  The unique ID of a deployment.
  ///
  /// [autoRollbackEnabled]:  Indicates, when a deployment is stopped, whether
  /// instances that have been updated should be rolled back to the previous
  /// version of the application revision.
  Future<StopDeploymentOutput> stopDeployment(String deploymentId,
      {bool autoRollbackEnabled}) async {
    return StopDeploymentOutput.fromJson({});
  }

  ///  Associates the list of tags in the input `Tags` parameter with the
  /// resource identified by the `ResourceArn` input parameter.
  ///
  /// [resourceArn]:  The ARN of a resource, such as a CodeDeploy application or
  /// deployment group.
  ///
  /// [tags]:  A list of tags that `TagResource` associates with a resource. The
  /// resource is identified by the `ResourceArn` input parameter.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceOutput.fromJson({});
  }

  ///  Disassociates a resource from a list of tags. The resource is identified
  /// by the `ResourceArn` input parameter. The tags are identfied by the list
  /// of keys in the `TagKeys` input parameter.
  ///
  /// [resourceArn]:  The ARN that specifies from which resource to disassociate
  /// the tags with the keys in the `TagKeys` input paramter.
  ///
  /// [tagKeys]:  A list of keys of `Tag` objects. The `Tag` objects identified
  /// by the keys are disassociated from the resource specified by the
  /// `ResourceArn` input parameter.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceOutput.fromJson({});
  }

  /// Changes the name of an application.
  ///
  /// [applicationName]: The current name of the application you want to change.
  ///
  /// [newApplicationName]: The new name to give the application.
  Future<void> updateApplication(
      {String applicationName, String newApplicationName}) async {}

  /// Changes information about a deployment group.
  ///
  /// [applicationName]: The application name that corresponds to the deployment
  /// group to update.
  ///
  /// [currentDeploymentGroupName]: The current name of the deployment group.
  ///
  /// [newDeploymentGroupName]: The new name of the deployment group, if you
  /// want to change it.
  ///
  /// [deploymentConfigName]: The replacement deployment configuration name to
  /// use, if you want to change it.
  ///
  /// [ec2TagFilters]: The replacement set of Amazon EC2 tags on which to
  /// filter, if you want to change them. To keep the existing tags, enter their
  /// names. To remove tags, do not enter any tag names.
  ///
  /// [onPremisesInstanceTagFilters]: The replacement set of on-premises
  /// instance tags on which to filter, if you want to change them. To keep the
  /// existing tags, enter their names. To remove tags, do not enter any tag
  /// names.
  ///
  /// [autoScalingGroups]: The replacement list of Auto Scaling groups to be
  /// included in the deployment group, if you want to change them. To keep the
  /// Auto Scaling groups, enter their names. To remove Auto Scaling groups, do
  /// not enter any Auto Scaling group names.
  ///
  /// [serviceRoleArn]: A replacement ARN for the service role, if you want to
  /// change it.
  ///
  /// [triggerConfigurations]: Information about triggers to change when the
  /// deployment group is updated. For examples, see [Modify Triggers in an AWS
  /// CodeDeploy Deployment
  /// Group](https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-edit.html)
  /// in the AWS CodeDeploy User Guide.
  ///
  /// [alarmConfiguration]: Information to add or change about Amazon CloudWatch
  /// alarms when the deployment group is updated.
  ///
  /// [autoRollbackConfiguration]: Information for an automatic rollback
  /// configuration that is added or changed when a deployment group is updated.
  ///
  /// [deploymentStyle]: Information about the type of deployment, either
  /// in-place or blue/green, you want to run and whether to route deployment
  /// traffic behind a load balancer.
  ///
  /// [blueGreenDeploymentConfiguration]: Information about blue/green
  /// deployment options for a deployment group.
  ///
  /// [loadBalancerInfo]: Information about the load balancer used in a
  /// deployment.
  ///
  /// [ec2TagSet]: Information about groups of tags applied to on-premises
  /// instances. The deployment group includes only EC2 instances identified by
  /// all the tag groups.
  ///
  /// [ecsServices]:  The target Amazon ECS services in the deployment group.
  /// This applies only to deployment groups that use the Amazon ECS compute
  /// platform. A target Amazon ECS service is specified as an Amazon ECS
  /// cluster and service name pair using the format
  /// `<clustername>:<servicename>`.
  ///
  /// [onPremisesTagSet]: Information about an on-premises instance tag set. The
  /// deployment group includes only on-premises instances identified by all the
  /// tag groups.
  Future<UpdateDeploymentGroupOutput> updateDeploymentGroup(
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
      OnPremisesTagSet onPremisesTagSet}) async {
    return UpdateDeploymentGroupOutput.fromJson({});
  }
}

class Alarm {
  /// The name of the alarm. Maximum length is 255 characters. Each alarm name
  /// can be used only once in a list of alarms.
  final String name;

  Alarm({
    this.name,
  });
  static Alarm fromJson(Map<String, dynamic> json) => Alarm();
}

class AlarmConfiguration {
  /// Indicates whether the alarm configuration is enabled.
  final bool enabled;

  /// Indicates whether a deployment should continue if information about the
  /// current state of alarms cannot be retrieved from Amazon CloudWatch. The
  /// default value is false.
  ///
  /// *   true: The deployment proceeds even if alarm status information can't
  /// be retrieved from Amazon CloudWatch.
  ///
  /// *   false: The deployment stops if alarm status information can't be
  /// retrieved from Amazon CloudWatch.
  final bool ignorePollAlarmFailure;

  /// A list of alarms configured for the deployment group. A maximum of 10
  /// alarms can be added to a deployment group.
  final List<Alarm> alarms;

  AlarmConfiguration({
    this.enabled,
    this.ignorePollAlarmFailure,
    this.alarms,
  });
  static AlarmConfiguration fromJson(Map<String, dynamic> json) =>
      AlarmConfiguration();
}

class AppSpecContent {
  ///  The YAML-formatted or JSON-formatted revision string.
  ///
  ///  For an AWS Lambda deployment, the content includes a Lambda function
  /// name, the alias for its original version, and the alias for its
  /// replacement version. The deployment shifts traffic from the original
  /// version of the Lambda function to the replacement version.
  ///
  ///  For an Amazon ECS deployment, the content includes the task name,
  /// information about the load balancer that serves traffic to the container,
  /// and more.
  ///
  ///  For both types of deployments, the content can specify Lambda functions
  /// that run at specified hooks, such as `BeforeInstall`, during a deployment.
  final String content;

  ///  The SHA256 hash value of the revision content.
  final String sha256;

  AppSpecContent({
    this.content,
    this.sha256,
  });
  static AppSpecContent fromJson(Map<String, dynamic> json) => AppSpecContent();
}

class ApplicationInfo {
  /// The application ID.
  final String applicationId;

  /// The application name.
  final String applicationName;

  /// The time at which the application was created.
  final DateTime createTime;

  /// True if the user has authenticated with GitHub for the specified
  /// application. Otherwise, false.
  final bool linkedToGitHub;

  /// The name for a connection to a GitHub account.
  final String gitHubAccountName;

  /// The destination platform type for deployment of the application (`Lambda`
  /// or `Server`).
  final String computePlatform;

  ApplicationInfo({
    this.applicationId,
    this.applicationName,
    this.createTime,
    this.linkedToGitHub,
    this.gitHubAccountName,
    this.computePlatform,
  });
  static ApplicationInfo fromJson(Map<String, dynamic> json) =>
      ApplicationInfo();
}

class AutoRollbackConfiguration {
  /// Indicates whether a defined automatic rollback configuration is currently
  /// enabled.
  final bool enabled;

  /// The event type or types that trigger a rollback.
  final List<String> events;

  AutoRollbackConfiguration({
    this.enabled,
    this.events,
  });
  static AutoRollbackConfiguration fromJson(Map<String, dynamic> json) =>
      AutoRollbackConfiguration();
}

class AutoScalingGroup {
  /// The Auto Scaling group name.
  final String name;

  /// An Auto Scaling lifecycle event hook name.
  final String hook;

  AutoScalingGroup({
    this.name,
    this.hook,
  });
  static AutoScalingGroup fromJson(Map<String, dynamic> json) =>
      AutoScalingGroup();
}

class BatchGetApplicationRevisionsOutput {
  /// The name of the application that corresponds to the revisions.
  final String applicationName;

  /// Information about errors that might have occurred during the API call.
  final String errorMessage;

  /// Additional information about the revisions, including the type and
  /// location.
  final List<RevisionInfo> revisions;

  BatchGetApplicationRevisionsOutput({
    this.applicationName,
    this.errorMessage,
    this.revisions,
  });
  static BatchGetApplicationRevisionsOutput fromJson(
          Map<String, dynamic> json) =>
      BatchGetApplicationRevisionsOutput();
}

class BatchGetApplicationsOutput {
  /// Information about the applications.
  final List<ApplicationInfo> applicationsInfo;

  BatchGetApplicationsOutput({
    this.applicationsInfo,
  });
  static BatchGetApplicationsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetApplicationsOutput();
}

class BatchGetDeploymentGroupsOutput {
  /// Information about the deployment groups.
  final List<DeploymentGroupInfo> deploymentGroupsInfo;

  /// Information about errors that might have occurred during the API call.
  final String errorMessage;

  BatchGetDeploymentGroupsOutput({
    this.deploymentGroupsInfo,
    this.errorMessage,
  });
  static BatchGetDeploymentGroupsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetDeploymentGroupsOutput();
}

class BatchGetDeploymentInstancesOutput {
  /// Information about the instance.
  final List<InstanceSummary> instancesSummary;

  /// Information about errors that might have occurred during the API call.
  final String errorMessage;

  BatchGetDeploymentInstancesOutput({
    this.instancesSummary,
    this.errorMessage,
  });
  static BatchGetDeploymentInstancesOutput fromJson(
          Map<String, dynamic> json) =>
      BatchGetDeploymentInstancesOutput();
}

class BatchGetDeploymentTargetsOutput {
  ///  A list of target objects for a deployment. Each target object contains
  /// details about the target, such as its status and lifecycle events. The
  /// type of the target objects depends on the deployment' compute platform.
  ///
  /// *    **EC2/On-premises**: Each target object is an EC2 or on-premises
  /// instance.
  ///
  /// *    **AWS Lambda**: The target object is a specific version of an AWS
  /// Lambda function.
  ///
  /// *    **Amazon ECS**: The target object is an Amazon ECS service.
  final List<DeploymentTarget> deploymentTargets;

  BatchGetDeploymentTargetsOutput({
    this.deploymentTargets,
  });
  static BatchGetDeploymentTargetsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetDeploymentTargetsOutput();
}

class BatchGetDeploymentsOutput {
  ///  Information about the deployments.
  final List<DeploymentInfo> deploymentsInfo;

  BatchGetDeploymentsOutput({
    this.deploymentsInfo,
  });
  static BatchGetDeploymentsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetDeploymentsOutput();
}

class BatchGetOnPremisesInstancesOutput {
  /// Information about the on-premises instances.
  final List<InstanceInfo> instanceInfos;

  BatchGetOnPremisesInstancesOutput({
    this.instanceInfos,
  });
  static BatchGetOnPremisesInstancesOutput fromJson(
          Map<String, dynamic> json) =>
      BatchGetOnPremisesInstancesOutput();
}

class BlueGreenDeploymentConfiguration {
  /// Information about whether to terminate instances in the original fleet
  /// during a blue/green deployment.
  final BlueInstanceTerminationOption terminateBlueInstancesOnDeploymentSuccess;

  /// Information about the action to take when newly provisioned instances are
  /// ready to receive traffic in a blue/green deployment.
  final DeploymentReadyOption deploymentReadyOption;

  /// Information about how instances are provisioned for a replacement
  /// environment in a blue/green deployment.
  final GreenFleetProvisioningOption greenFleetProvisioningOption;

  BlueGreenDeploymentConfiguration({
    this.terminateBlueInstancesOnDeploymentSuccess,
    this.deploymentReadyOption,
    this.greenFleetProvisioningOption,
  });
  static BlueGreenDeploymentConfiguration fromJson(Map<String, dynamic> json) =>
      BlueGreenDeploymentConfiguration();
}

class BlueInstanceTerminationOption {
  /// The action to take on instances in the original environment after a
  /// successful blue/green deployment.
  ///
  /// *   TERMINATE: Instances are terminated after a specified wait time.
  ///
  /// *   KEEP_ALIVE: Instances are left running after they are deregistered
  /// from the load balancer and removed from the deployment group.
  final String action;

  /// For an Amazon EC2 deployment, the number of minutes to wait after a
  /// successful blue/green deployment before terminating instances from the
  /// original environment.
  ///
  ///  For an Amazon ECS deployment, the number of minutes before deleting the
  /// original (blue) task set. During an Amazon ECS deployment, CodeDeploy
  /// shifts traffic from the original (blue) task set to a replacement (green)
  /// task set.
  ///
  ///  The maximum setting is 2880 minutes (2 days).
  final int terminationWaitTimeInMinutes;

  BlueInstanceTerminationOption({
    this.action,
    this.terminationWaitTimeInMinutes,
  });
  static BlueInstanceTerminationOption fromJson(Map<String, dynamic> json) =>
      BlueInstanceTerminationOption();
}

class CreateApplicationOutput {
  /// A unique application ID.
  final String applicationId;

  CreateApplicationOutput({
    this.applicationId,
  });
  static CreateApplicationOutput fromJson(Map<String, dynamic> json) =>
      CreateApplicationOutput();
}

class CreateDeploymentConfigOutput {
  /// A unique deployment configuration ID.
  final String deploymentConfigId;

  CreateDeploymentConfigOutput({
    this.deploymentConfigId,
  });
  static CreateDeploymentConfigOutput fromJson(Map<String, dynamic> json) =>
      CreateDeploymentConfigOutput();
}

class CreateDeploymentGroupOutput {
  /// A unique deployment group ID.
  final String deploymentGroupId;

  CreateDeploymentGroupOutput({
    this.deploymentGroupId,
  });
  static CreateDeploymentGroupOutput fromJson(Map<String, dynamic> json) =>
      CreateDeploymentGroupOutput();
}

class CreateDeploymentOutput {
  ///  The unique ID of a deployment.
  final String deploymentId;

  CreateDeploymentOutput({
    this.deploymentId,
  });
  static CreateDeploymentOutput fromJson(Map<String, dynamic> json) =>
      CreateDeploymentOutput();
}

class DeleteDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, AWS CodeDeploy successfully
  /// removed all corresponding Auto Scaling lifecycle event hooks from the
  /// Amazon EC2 instances in the Auto Scaling group. If the output contains
  /// data, AWS CodeDeploy could not remove some Auto Scaling lifecycle event
  /// hooks from the Amazon EC2 instances in the Auto Scaling group.
  final List<AutoScalingGroup> hooksNotCleanedUp;

  DeleteDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });
  static DeleteDeploymentGroupOutput fromJson(Map<String, dynamic> json) =>
      DeleteDeploymentGroupOutput();
}

class DeleteGitHubAccountTokenOutput {
  /// The name of the GitHub account connection that was deleted.
  final String tokenName;

  DeleteGitHubAccountTokenOutput({
    this.tokenName,
  });
  static DeleteGitHubAccountTokenOutput fromJson(Map<String, dynamic> json) =>
      DeleteGitHubAccountTokenOutput();
}

class DeploymentConfigInfo {
  /// The deployment configuration ID.
  final String deploymentConfigId;

  /// The deployment configuration name.
  final String deploymentConfigName;

  /// Information about the number or percentage of minimum healthy instance.
  final MinimumHealthyHosts minimumHealthyHosts;

  /// The time at which the deployment configuration was created.
  final DateTime createTime;

  /// The destination platform type for the deployment (`Lambda`, `Server`, or
  /// `ECS`).
  final String computePlatform;

  /// The configuration that specifies how the deployment traffic is routed.
  /// Only deployments with a Lambda compute platform can specify this.
  final TrafficRoutingConfig trafficRoutingConfig;

  DeploymentConfigInfo({
    this.deploymentConfigId,
    this.deploymentConfigName,
    this.minimumHealthyHosts,
    this.createTime,
    this.computePlatform,
    this.trafficRoutingConfig,
  });
  static DeploymentConfigInfo fromJson(Map<String, dynamic> json) =>
      DeploymentConfigInfo();
}

class DeploymentGroupInfo {
  /// The application name.
  final String applicationName;

  /// The deployment group ID.
  final String deploymentGroupId;

  /// The deployment group name.
  final String deploymentGroupName;

  /// The deployment configuration name.
  final String deploymentConfigName;

  /// The Amazon EC2 tags on which to filter. The deployment group includes EC2
  /// instances with any of the specified tags.
  final List<Ec2TagFilter> ec2TagFilters;

  /// The on-premises instance tags on which to filter. The deployment group
  /// includes on-premises instances with any of the specified tags.
  final List<TagFilter> onPremisesInstanceTagFilters;

  /// A list of associated Auto Scaling groups.
  final List<AutoScalingGroup> autoScalingGroups;

  /// A service role Amazon Resource Name (ARN) that grants CodeDeploy
  /// permission to make calls to AWS services on your behalf. For more
  /// information, see [Create a Service Role for AWS
  /// CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html)
  /// in the _AWS CodeDeploy User Guide_.
  final String serviceRoleArn;

  /// Information about the deployment group's target revision, including type
  /// and location.
  final RevisionLocation targetRevision;

  /// Information about triggers associated with the deployment group.
  final List<TriggerConfig> triggerConfigurations;

  /// A list of alarms associated with the deployment group.
  final AlarmConfiguration alarmConfiguration;

  /// Information about the automatic rollback configuration associated with the
  /// deployment group.
  final AutoRollbackConfiguration autoRollbackConfiguration;

  /// Information about the type of deployment, either in-place or blue/green,
  /// you want to run and whether to route deployment traffic behind a load
  /// balancer.
  final DeploymentStyle deploymentStyle;

  /// Information about blue/green deployment options for a deployment group.
  final BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration;

  /// Information about the load balancer to use in a deployment.
  final LoadBalancerInfo loadBalancerInfo;

  /// Information about the most recent successful deployment to the deployment
  /// group.
  final LastDeploymentInfo lastSuccessfulDeployment;

  /// Information about the most recent attempted deployment to the deployment
  /// group.
  final LastDeploymentInfo lastAttemptedDeployment;

  /// Information about groups of tags applied to an EC2 instance. The
  /// deployment group includes only EC2 instances identified by all of the tag
  /// groups. Cannot be used in the same call as ec2TagFilters.
  final Ec2TagSet ec2TagSet;

  /// Information about groups of tags applied to an on-premises instance. The
  /// deployment group includes only on-premises instances identified by all the
  /// tag groups. Cannot be used in the same call as
  /// onPremisesInstanceTagFilters.
  final OnPremisesTagSet onPremisesTagSet;

  /// The destination platform type for the deployment (`Lambda`, `Server`, or
  /// `ECS`).
  final String computePlatform;

  ///  The target Amazon ECS services in the deployment group. This applies only
  /// to deployment groups that use the Amazon ECS compute platform. A target
  /// Amazon ECS service is specified as an Amazon ECS cluster and service name
  /// pair using the format `<clustername>:<servicename>`.
  final List<EcsService> ecsServices;

  DeploymentGroupInfo({
    this.applicationName,
    this.deploymentGroupId,
    this.deploymentGroupName,
    this.deploymentConfigName,
    this.ec2TagFilters,
    this.onPremisesInstanceTagFilters,
    this.autoScalingGroups,
    this.serviceRoleArn,
    this.targetRevision,
    this.triggerConfigurations,
    this.alarmConfiguration,
    this.autoRollbackConfiguration,
    this.deploymentStyle,
    this.blueGreenDeploymentConfiguration,
    this.loadBalancerInfo,
    this.lastSuccessfulDeployment,
    this.lastAttemptedDeployment,
    this.ec2TagSet,
    this.onPremisesTagSet,
    this.computePlatform,
    this.ecsServices,
  });
  static DeploymentGroupInfo fromJson(Map<String, dynamic> json) =>
      DeploymentGroupInfo();
}

class DeploymentInfo {
  /// The application name.
  final String applicationName;

  ///  The deployment group name.
  final String deploymentGroupName;

  ///  The deployment configuration name.
  final String deploymentConfigName;

  ///  The unique ID of a deployment.
  final String deploymentId;

  /// Information about the application revision that was deployed to the
  /// deployment group before the most recent successful deployment.
  final RevisionLocation previousRevision;

  /// Information about the location of stored application artifacts and the
  /// service from which to retrieve them.
  final RevisionLocation revision;

  /// The current state of the deployment as a whole.
  final String status;

  /// Information about any error associated with this deployment.
  final ErrorInformation errorInformation;

  /// A timestamp that indicates when the deployment was created.
  final DateTime createTime;

  /// A timestamp that indicates when the deployment was deployed to the
  /// deployment group.
  ///
  /// In some cases, the reported value of the start time might be later than
  /// the complete time. This is due to differences in the clock settings of
  /// backend servers that participate in the deployment process.
  final DateTime startTime;

  /// A timestamp that indicates when the deployment was complete.
  final DateTime completeTime;

  /// A summary of the deployment status of the instances in the deployment.
  final DeploymentOverview deploymentOverview;

  /// A comment about the deployment.
  final String description;

  /// The means by which the deployment was created:
  ///
  /// *   user: A user created the deployment.
  ///
  /// *   autoscaling: Amazon EC2 Auto Scaling created the deployment.
  ///
  /// *   codeDeployRollback: A rollback process created the deployment.
  final String creator;

  ///  If true, then if an `ApplicationStop`, `BeforeBlockTraffic`, or
  /// `AfterBlockTraffic` deployment lifecycle event to an instance fails, then
  /// the deployment continues to the next deployment lifecycle event. For
  /// example, if `ApplicationStop` fails, the deployment continues with
  /// DownloadBundle. If `BeforeBlockTraffic` fails, the deployment continues
  /// with `BlockTraffic`. If `AfterBlockTraffic` fails, the deployment
  /// continues with `ApplicationStop`.
  ///
  ///  If false or not specified, then if a lifecycle event fails during a
  /// deployment to an instance, that deployment fails. If deployment to that
  /// instance is part of an overall deployment and the number of healthy hosts
  /// is not less than the minimum number of healthy hosts, then a deployment to
  /// the next instance is attempted.
  ///
  ///  During a deployment, the AWS CodeDeploy agent runs the scripts specified
  /// for `ApplicationStop`, `BeforeBlockTraffic`, and `AfterBlockTraffic` in
  /// the AppSpec file from the previous successful deployment. (All other
  /// scripts are run from the AppSpec file in the current deployment.) If one
  /// of these scripts contains an error and does not run successfully, the
  /// deployment can fail.
  ///
  ///  If the cause of the failure is a script from the last successful
  /// deployment that will never run successfully, create a new deployment and
  /// use `ignoreApplicationStopFailures` to specify that the `ApplicationStop`,
  /// `BeforeBlockTraffic`, and `AfterBlockTraffic` failures should be ignored.
  final bool ignoreApplicationStopFailures;

  /// Information about the automatic rollback configuration associated with the
  /// deployment.
  final AutoRollbackConfiguration autoRollbackConfiguration;

  /// Indicates whether only instances that are not running the latest
  /// application revision are to be deployed to.
  final bool updateOutdatedInstancesOnly;

  /// Information about a deployment rollback.
  final RollbackInfo rollbackInfo;

  /// Information about the type of deployment, either in-place or blue/green,
  /// you want to run and whether to route deployment traffic behind a load
  /// balancer.
  final DeploymentStyle deploymentStyle;

  /// Information about the instances that belong to the replacement environment
  /// in a blue/green deployment.
  final TargetInstances targetInstances;

  /// Indicates whether the wait period set for the termination of instances in
  /// the original environment has started. Status is 'false' if the KEEP_ALIVE
  /// option is specified. Otherwise, 'true' as soon as the termination wait
  /// period starts.
  final bool instanceTerminationWaitTimeStarted;

  /// Information about blue/green deployment options for this deployment.
  final BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration;

  /// Information about the load balancer used in the deployment.
  final LoadBalancerInfo loadBalancerInfo;

  /// Provides information about the results of a deployment, such as whether
  /// instances in the original environment in a blue/green deployment were not
  /// terminated.
  final String additionalDeploymentStatusInfo;

  /// Information about how AWS CodeDeploy handles files that already exist in a
  /// deployment target location but weren't part of the previous successful
  /// deployment.
  ///
  /// *   DISALLOW: The deployment fails. This is also the default behavior if
  /// no option is specified.
  ///
  /// *   OVERWRITE: The version of the file from the application revision
  /// currently being deployed replaces the version already on the instance.
  ///
  /// *   RETAIN: The version of the file already on the instance is kept and
  /// used as part of the new deployment.
  final String fileExistsBehavior;

  /// Messages that contain information about the status of a deployment.
  final List<String> deploymentStatusMessages;

  /// The destination platform type for the deployment (`Lambda`, `Server`, or
  /// `ECS`).
  final String computePlatform;

  DeploymentInfo({
    this.applicationName,
    this.deploymentGroupName,
    this.deploymentConfigName,
    this.deploymentId,
    this.previousRevision,
    this.revision,
    this.status,
    this.errorInformation,
    this.createTime,
    this.startTime,
    this.completeTime,
    this.deploymentOverview,
    this.description,
    this.creator,
    this.ignoreApplicationStopFailures,
    this.autoRollbackConfiguration,
    this.updateOutdatedInstancesOnly,
    this.rollbackInfo,
    this.deploymentStyle,
    this.targetInstances,
    this.instanceTerminationWaitTimeStarted,
    this.blueGreenDeploymentConfiguration,
    this.loadBalancerInfo,
    this.additionalDeploymentStatusInfo,
    this.fileExistsBehavior,
    this.deploymentStatusMessages,
    this.computePlatform,
  });
  static DeploymentInfo fromJson(Map<String, dynamic> json) => DeploymentInfo();
}

class DeploymentOverview {
  /// The number of instances in the deployment in a pending state.
  final BigInt pending;

  /// The number of instances in which the deployment is in progress.
  final BigInt inProgress;

  /// The number of instances in the deployment to which revisions have been
  /// successfully deployed.
  final BigInt succeeded;

  /// The number of instances in the deployment in a failed state.
  final BigInt failed;

  /// The number of instances in the deployment in a skipped state.
  final BigInt skipped;

  /// The number of instances in a replacement environment ready to receive
  /// traffic in a blue/green deployment.
  final BigInt ready;

  DeploymentOverview({
    this.pending,
    this.inProgress,
    this.succeeded,
    this.failed,
    this.skipped,
    this.ready,
  });
  static DeploymentOverview fromJson(Map<String, dynamic> json) =>
      DeploymentOverview();
}

class DeploymentReadyOption {
  /// Information about when to reroute traffic from an original environment to
  /// a replacement environment in a blue/green deployment.
  ///
  /// *   CONTINUE_DEPLOYMENT: Register new instances with the load balancer
  /// immediately after the new application revision is installed on the
  /// instances in the replacement environment.
  ///
  /// *   STOP_DEPLOYMENT: Do not register new instances with a load balancer
  /// unless traffic rerouting is started using ContinueDeployment. If traffic
  /// rerouting is not started before the end of the specified wait period, the
  /// deployment status is changed to Stopped.
  final String actionOnTimeout;

  /// The number of minutes to wait before the status of a blue/green deployment
  /// is changed to Stopped if rerouting is not started manually. Applies only
  /// to the STOP_DEPLOYMENT option for actionOnTimeout
  final int waitTimeInMinutes;

  DeploymentReadyOption({
    this.actionOnTimeout,
    this.waitTimeInMinutes,
  });
  static DeploymentReadyOption fromJson(Map<String, dynamic> json) =>
      DeploymentReadyOption();
}

class DeploymentStyle {
  /// Indicates whether to run an in-place deployment or a blue/green
  /// deployment.
  final String deploymentType;

  /// Indicates whether to route deployment traffic behind a load balancer.
  final String deploymentOption;

  DeploymentStyle({
    this.deploymentType,
    this.deploymentOption,
  });
  static DeploymentStyle fromJson(Map<String, dynamic> json) =>
      DeploymentStyle();
}

class DeploymentTarget {
  ///  The deployment type that is specific to the deployment's compute
  /// platform.
  final String deploymentTargetType;

  ///  Information about the target for a deployment that uses the
  /// EC2/On-premises compute platform.
  final InstanceTarget instanceTarget;

  ///  Information about the target for a deployment that uses the AWS Lambda
  /// compute platform.
  final LambdaTarget lambdaTarget;

  ///  Information about the target for a deployment that uses the Amazon ECS
  /// compute platform.
  final EcsTarget ecsTarget;

  DeploymentTarget({
    this.deploymentTargetType,
    this.instanceTarget,
    this.lambdaTarget,
    this.ecsTarget,
  });
  static DeploymentTarget fromJson(Map<String, dynamic> json) =>
      DeploymentTarget();
}

class Diagnostics {
  /// The associated error code:
  ///
  /// *   Success: The specified script ran.
  ///
  /// *   ScriptMissing: The specified script was not found in the specified
  /// location.
  ///
  /// *   ScriptNotExecutable: The specified script is not a recognized
  /// executable file type.
  ///
  /// *   ScriptTimedOut: The specified script did not finish running in the
  /// specified time period.
  ///
  /// *   ScriptFailed: The specified script failed to run as expected.
  ///
  /// *   UnknownError: The specified script did not run for an unknown reason.
  final String errorCode;

  /// The name of the script.
  final String scriptName;

  /// The message associated with the error.
  final String message;

  /// The last portion of the diagnostic log.
  ///
  /// If available, AWS CodeDeploy returns up to the last 4 KB of the diagnostic
  /// log.
  final String logTail;

  Diagnostics({
    this.errorCode,
    this.scriptName,
    this.message,
    this.logTail,
  });
  static Diagnostics fromJson(Map<String, dynamic> json) => Diagnostics();
}

class Ec2TagFilter {
  /// The tag filter key.
  final String key;

  /// The tag filter value.
  final String value;

  /// The tag filter type:
  ///
  /// *   KEY_ONLY: Key only.
  ///
  /// *   VALUE_ONLY: Value only.
  ///
  /// *   KEY\_AND\_VALUE: Key and value.
  final String type;

  Ec2TagFilter({
    this.key,
    this.value,
    this.type,
  });
  static Ec2TagFilter fromJson(Map<String, dynamic> json) => Ec2TagFilter();
}

class Ec2TagSet {
  /// A list that contains other lists of EC2 instance tag groups. For an
  /// instance to be included in the deployment group, it must be identified by
  /// all of the tag groups in the list.
  final List<List<Ec2TagFilter>> ec2TagSetList;

  Ec2TagSet({
    this.ec2TagSetList,
  });
  static Ec2TagSet fromJson(Map<String, dynamic> json) => Ec2TagSet();
}

class EcsService {
  ///  The name of the target Amazon ECS service.
  final String serviceName;

  ///  The name of the cluster that the Amazon ECS service is associated with.
  final String clusterName;

  EcsService({
    this.serviceName,
    this.clusterName,
  });
  static EcsService fromJson(Map<String, dynamic> json) => EcsService();
}

class EcsTarget {
  ///  The unique ID of a deployment.
  final String deploymentId;

  ///  The unique ID of a deployment target that has a type of `ecsTarget`.
  final String targetId;

  ///  The ARN of the target.
  final String targetArn;

  ///  The date and time when the target Amazon ECS application was updated by a
  /// deployment.
  final DateTime lastUpdatedAt;

  ///  The lifecycle events of the deployment to this target Amazon ECS
  /// application.
  final List<LifecycleEvent> lifecycleEvents;

  ///  The status an Amazon ECS deployment's target ECS application.
  final String status;

  ///  The `ECSTaskSet` objects associated with the ECS target.
  final List<EcsTaskSet> taskSetsInfo;

  EcsTarget({
    this.deploymentId,
    this.targetId,
    this.targetArn,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.taskSetsInfo,
  });
  static EcsTarget fromJson(Map<String, dynamic> json) => EcsTarget();
}

class EcsTaskSet {
  ///  A unique ID of an `ECSTaskSet`.
  final String identifer;

  ///  The number of tasks in a task set. During a deployment that uses the
  /// Amazon ECS compute type, CodeDeploy instructs Amazon ECS to create a new
  /// task set and uses this value to determine how many tasks to create. After
  /// the updated task set is created, CodeDeploy shifts traffic to the new task
  /// set.
  final BigInt desiredCount;

  ///  The number of tasks in the task set that are in the `PENDING` status
  /// during an Amazon ECS deployment. A task in the `PENDING` state is
  /// preparing to enter the `RUNNING` state. A task set enters the `PENDING`
  /// status when it launches for the first time, or when it is restarted after
  /// being in the `STOPPED` state.
  final BigInt pendingCount;

  ///  The number of tasks in the task set that are in the `RUNNING` status
  /// during an Amazon ECS deployment. A task in the `RUNNING` state is running
  /// and ready for use.
  final BigInt runningCount;

  ///  The status of the task set. There are three valid task set statuses:
  ///
  /// *    `PRIMARY`: Indicates the task set is serving production traffic.
  ///
  /// *    `ACTIVE`: Indicates the task set is not serving production traffic.
  ///
  /// *    `DRAINING`: Indicates the tasks in the task set are being stopped and
  /// their corresponding targets are being deregistered from their target
  /// group.
  final String status;

  ///  The percentage of traffic served by this task set.
  final double trafficWeight;

  ///  The target group associated with the task set. The target group is used
  /// by AWS CodeDeploy to manage traffic to a task set.
  final TargetGroupInfo targetGroup;

  ///  A label that identifies whether the ECS task set is an original target
  /// (`BLUE`) or a replacement target (`GREEN`).
  final String taskSetLabel;

  EcsTaskSet({
    this.identifer,
    this.desiredCount,
    this.pendingCount,
    this.runningCount,
    this.status,
    this.trafficWeight,
    this.targetGroup,
    this.taskSetLabel,
  });
  static EcsTaskSet fromJson(Map<String, dynamic> json) => EcsTaskSet();
}

class ElbInfo {
  /// For blue/green deployments, the name of the load balancer that is used to
  /// route traffic from original instances to replacement instances in a
  /// blue/green deployment. For in-place deployments, the name of the load
  /// balancer that instances are deregistered from so they are not serving
  /// traffic during a deployment, and then re-registered with after the
  /// deployment is complete.
  final String name;

  ElbInfo({
    this.name,
  });
  static ElbInfo fromJson(Map<String, dynamic> json) => ElbInfo();
}

class ErrorInformation {
  /// For more information, see [Error Codes for AWS
  /// CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/error-codes.html)
  /// in the [AWS CodeDeploy User
  /// Guide](https://docs.aws.amazon.com/codedeploy/latest/userguide).
  ///
  /// The error code:
  ///
  /// *   APPLICATION_MISSING: The application was missing. This error code is
  /// most likely raised if the application is deleted after the deployment is
  /// created, but before it is started.
  ///
  /// *   DEPLOYMENT\_GROUP\_MISSING: The deployment group was missing. This
  /// error code is most likely raised if the deployment group is deleted after
  /// the deployment is created, but before it is started.
  ///
  /// *   HEALTH_CONSTRAINTS: The deployment failed on too many instances to be
  /// successfully deployed within the instance health constraints specified.
  ///
  /// *   HEALTH\_CONSTRAINTS\_INVALID: The revision cannot be successfully
  /// deployed within the instance health constraints specified.
  ///
  /// *   IAM\_ROLE\_MISSING: The service role cannot be accessed.
  ///
  /// *   IAM\_ROLE\_PERMISSIONS: The service role does not have the correct
  /// permissions.
  ///
  /// *   INTERNAL_ERROR: There was an internal error.
  ///
  /// *   NO\_EC2\_SUBSCRIPTION: The calling account is not subscribed to Amazon
  /// EC2.
  ///
  /// *   NO_INSTANCES: No instances were specified, or no instances can be
  /// found.
  ///
  /// *   OVER\_MAX\_INSTANCES: The maximum number of instances was exceeded.
  ///
  /// *   THROTTLED: The operation was throttled because the calling account
  /// exceeded the throttling limits of one or more AWS services.
  ///
  /// *   TIMEOUT: The deployment has timed out.
  ///
  /// *   REVISION_MISSING: The revision ID was missing. This error code is most
  /// likely raised if the revision is deleted after the deployment is created,
  /// but before it is started.
  final String code;

  /// An accompanying error message.
  final String message;

  ErrorInformation({
    this.code,
    this.message,
  });
  static ErrorInformation fromJson(Map<String, dynamic> json) =>
      ErrorInformation();
}

class GenericRevisionInfo {
  /// A comment about the revision.
  final String description;

  /// The deployment groups for which this is the current target revision.
  final List<String> deploymentGroups;

  /// When the revision was first used by AWS CodeDeploy.
  final DateTime firstUsedTime;

  /// When the revision was last used by AWS CodeDeploy.
  final DateTime lastUsedTime;

  /// When the revision was registered with AWS CodeDeploy.
  final DateTime registerTime;

  GenericRevisionInfo({
    this.description,
    this.deploymentGroups,
    this.firstUsedTime,
    this.lastUsedTime,
    this.registerTime,
  });
  static GenericRevisionInfo fromJson(Map<String, dynamic> json) =>
      GenericRevisionInfo();
}

class GetApplicationOutput {
  /// Information about the application.
  final ApplicationInfo application;

  GetApplicationOutput({
    this.application,
  });
  static GetApplicationOutput fromJson(Map<String, dynamic> json) =>
      GetApplicationOutput();
}

class GetApplicationRevisionOutput {
  /// The name of the application that corresponds to the revision.
  final String applicationName;

  /// Additional information about the revision, including type and location.
  final RevisionLocation revision;

  /// General information about the revision.
  final GenericRevisionInfo revisionInfo;

  GetApplicationRevisionOutput({
    this.applicationName,
    this.revision,
    this.revisionInfo,
  });
  static GetApplicationRevisionOutput fromJson(Map<String, dynamic> json) =>
      GetApplicationRevisionOutput();
}

class GetDeploymentConfigOutput {
  /// Information about the deployment configuration.
  final DeploymentConfigInfo deploymentConfigInfo;

  GetDeploymentConfigOutput({
    this.deploymentConfigInfo,
  });
  static GetDeploymentConfigOutput fromJson(Map<String, dynamic> json) =>
      GetDeploymentConfigOutput();
}

class GetDeploymentGroupOutput {
  /// Information about the deployment group.
  final DeploymentGroupInfo deploymentGroupInfo;

  GetDeploymentGroupOutput({
    this.deploymentGroupInfo,
  });
  static GetDeploymentGroupOutput fromJson(Map<String, dynamic> json) =>
      GetDeploymentGroupOutput();
}

class GetDeploymentInstanceOutput {
  ///  Information about the instance.
  final InstanceSummary instanceSummary;

  GetDeploymentInstanceOutput({
    this.instanceSummary,
  });
  static GetDeploymentInstanceOutput fromJson(Map<String, dynamic> json) =>
      GetDeploymentInstanceOutput();
}

class GetDeploymentOutput {
  /// Information about the deployment.
  final DeploymentInfo deploymentInfo;

  GetDeploymentOutput({
    this.deploymentInfo,
  });
  static GetDeploymentOutput fromJson(Map<String, dynamic> json) =>
      GetDeploymentOutput();
}

class GetDeploymentTargetOutput {
  ///  A deployment target that contains information about a deployment such as
  /// its status, lifecyle events, and when it was last updated. It also
  /// contains metadata about the deployment target. The deployment target
  /// metadata depends on the deployment target's type (`instanceTarget`,
  /// `lambdaTarget`, or `ecsTarget`).
  final DeploymentTarget deploymentTarget;

  GetDeploymentTargetOutput({
    this.deploymentTarget,
  });
  static GetDeploymentTargetOutput fromJson(Map<String, dynamic> json) =>
      GetDeploymentTargetOutput();
}

class GetOnPremisesInstanceOutput {
  ///  Information about the on-premises instance.
  final InstanceInfo instanceInfo;

  GetOnPremisesInstanceOutput({
    this.instanceInfo,
  });
  static GetOnPremisesInstanceOutput fromJson(Map<String, dynamic> json) =>
      GetOnPremisesInstanceOutput();
}

class GitHubLocation {
  /// The GitHub account and repository pair that stores a reference to the
  /// commit that represents the bundled artifacts for the application revision.
  ///
  /// Specified as account/repository.
  final String repository;

  /// The SHA1 commit ID of the GitHub commit that represents the bundled
  /// artifacts for the application revision.
  final String commitId;

  GitHubLocation({
    this.repository,
    this.commitId,
  });
  static GitHubLocation fromJson(Map<String, dynamic> json) => GitHubLocation();
}

class GreenFleetProvisioningOption {
  /// The method used to add instances to a replacement environment.
  ///
  /// *   DISCOVER_EXISTING: Use instances that already exist or will be created
  /// manually.
  ///
  /// *   COPY\_AUTO\_SCALING_GROUP: Use settings from a specified Auto Scaling
  /// group to define and create instances in a new Auto Scaling group.
  final String action;

  GreenFleetProvisioningOption({
    this.action,
  });
  static GreenFleetProvisioningOption fromJson(Map<String, dynamic> json) =>
      GreenFleetProvisioningOption();
}

class InstanceInfo {
  /// The name of the on-premises instance.
  final String instanceName;

  /// The ARN of the IAM session associated with the on-premises instance.
  final String iamSessionArn;

  /// The IAM user ARN associated with the on-premises instance.
  final String iamUserArn;

  /// The ARN of the on-premises instance.
  final String instanceArn;

  /// The time at which the on-premises instance was registered.
  final DateTime registerTime;

  /// If the on-premises instance was deregistered, the time at which the
  /// on-premises instance was deregistered.
  final DateTime deregisterTime;

  /// The tags currently associated with the on-premises instance.
  final List<Tag> tags;

  InstanceInfo({
    this.instanceName,
    this.iamSessionArn,
    this.iamUserArn,
    this.instanceArn,
    this.registerTime,
    this.deregisterTime,
    this.tags,
  });
  static InstanceInfo fromJson(Map<String, dynamic> json) => InstanceInfo();
}

class InstanceSummary {
  ///  The unique ID of a deployment.
  final String deploymentId;

  /// The instance ID.
  final String instanceId;

  /// The deployment status for this instance:
  ///
  /// *   Pending: The deployment is pending for this instance.
  ///
  /// *   In Progress: The deployment is in progress for this instance.
  ///
  /// *   Succeeded: The deployment has succeeded for this instance.
  ///
  /// *   Failed: The deployment has failed for this instance.
  ///
  /// *   Skipped: The deployment has been skipped for this instance.
  ///
  /// *   Unknown: The deployment status is unknown for this instance.
  final String status;

  /// A timestamp that indicaties when the instance information was last
  /// updated.
  final DateTime lastUpdatedAt;

  /// A list of lifecycle events for this instance.
  final List<LifecycleEvent> lifecycleEvents;

  /// Information about which environment an instance belongs to in a blue/green
  /// deployment.
  ///
  /// *   BLUE: The instance is part of the original environment.
  ///
  /// *   GREEN: The instance is part of the replacement environment.
  final String instanceType;

  InstanceSummary({
    this.deploymentId,
    this.instanceId,
    this.status,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.instanceType,
  });
  static InstanceSummary fromJson(Map<String, dynamic> json) =>
      InstanceSummary();
}

class InstanceTarget {
  ///  The unique ID of a deployment.
  final String deploymentId;

  ///  The unique ID of a deployment target that has a type of `instanceTarget`.
  final String targetId;

  ///  The ARN of the target.
  final String targetArn;

  ///  The status an EC2/On-premises deployment's target instance.
  final String status;

  ///  The date and time when the target instance was updated by a deployment.
  final DateTime lastUpdatedAt;

  ///  The lifecycle events of the deployment to this target instance.
  final List<LifecycleEvent> lifecycleEvents;

  ///  A label that identifies whether the instance is an original target
  /// (`BLUE`) or a replacement target (`GREEN`).
  final String instanceLabel;

  InstanceTarget({
    this.deploymentId,
    this.targetId,
    this.targetArn,
    this.status,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.instanceLabel,
  });
  static InstanceTarget fromJson(Map<String, dynamic> json) => InstanceTarget();
}

class LambdaFunctionInfo {
  ///  The name of a Lambda function.
  final String functionName;

  ///  The alias of a Lambda function. For more information, see [Introduction
  /// to AWS Lambda
  /// Aliases](https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html).
  final String functionAlias;

  ///  The version of a Lambda function that production traffic points to.
  final String currentVersion;

  ///  The version of a Lambda function that production traffic points to after
  /// the Lambda function is deployed.
  final String targetVersion;

  ///  The percentage of production traffic that the target version of a Lambda
  /// function receives.
  final double targetVersionWeight;

  LambdaFunctionInfo({
    this.functionName,
    this.functionAlias,
    this.currentVersion,
    this.targetVersion,
    this.targetVersionWeight,
  });
  static LambdaFunctionInfo fromJson(Map<String, dynamic> json) =>
      LambdaFunctionInfo();
}

class LambdaTarget {
  ///  The unique ID of a deployment.
  final String deploymentId;

  ///  The unique ID of a deployment target that has a type of `lambdaTarget`.
  final String targetId;

  ///  The ARN of the target.
  final String targetArn;

  ///  The status an AWS Lambda deployment's target Lambda function.
  final String status;

  ///  The date and time when the target Lambda function was updated by a
  /// deployment.
  final DateTime lastUpdatedAt;

  ///  The lifecycle events of the deployment to this target Lambda function.
  final List<LifecycleEvent> lifecycleEvents;

  ///  A `LambdaFunctionInfo` object that describes a target Lambda function.
  final LambdaFunctionInfo lambdaFunctionInfo;

  LambdaTarget({
    this.deploymentId,
    this.targetId,
    this.targetArn,
    this.status,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.lambdaFunctionInfo,
  });
  static LambdaTarget fromJson(Map<String, dynamic> json) => LambdaTarget();
}

class LastDeploymentInfo {
  ///  The unique ID of a deployment.
  final String deploymentId;

  /// The status of the most recent deployment.
  final String status;

  /// A timestamp that indicates when the most recent deployment to the
  /// deployment group was complete.
  final DateTime endTime;

  /// A timestamp that indicates when the most recent deployment to the
  /// deployment group started.
  final DateTime createTime;

  LastDeploymentInfo({
    this.deploymentId,
    this.status,
    this.endTime,
    this.createTime,
  });
  static LastDeploymentInfo fromJson(Map<String, dynamic> json) =>
      LastDeploymentInfo();
}

class LifecycleEvent {
  /// The deployment lifecycle event name, such as ApplicationStop,
  /// BeforeInstall, AfterInstall, ApplicationStart, or ValidateService.
  final String lifecycleEventName;

  /// Diagnostic information about the deployment lifecycle event.
  final Diagnostics diagnostics;

  /// A timestamp that indicates when the deployment lifecycle event started.
  final DateTime startTime;

  /// A timestamp that indicates when the deployment lifecycle event ended.
  final DateTime endTime;

  /// The deployment lifecycle event status:
  ///
  /// *   Pending: The deployment lifecycle event is pending.
  ///
  /// *   InProgress: The deployment lifecycle event is in progress.
  ///
  /// *   Succeeded: The deployment lifecycle event ran successfully.
  ///
  /// *   Failed: The deployment lifecycle event has failed.
  ///
  /// *   Skipped: The deployment lifecycle event has been skipped.
  ///
  /// *   Unknown: The deployment lifecycle event is unknown.
  final String status;

  LifecycleEvent({
    this.lifecycleEventName,
    this.diagnostics,
    this.startTime,
    this.endTime,
    this.status,
  });
  static LifecycleEvent fromJson(Map<String, dynamic> json) => LifecycleEvent();
}

class ListApplicationRevisionsOutput {
  /// A list of locations that contain the matching revisions.
  final List<RevisionLocation> revisions;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call
  /// to return the next set of application revisions in the list.
  final String nextToken;

  ListApplicationRevisionsOutput({
    this.revisions,
    this.nextToken,
  });
  static ListApplicationRevisionsOutput fromJson(Map<String, dynamic> json) =>
      ListApplicationRevisionsOutput();
}

class ListApplicationsOutput {
  /// A list of application names.
  final List<String> applications;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list applications call to return
  /// the next set of applications in the list.
  final String nextToken;

  ListApplicationsOutput({
    this.applications,
    this.nextToken,
  });
  static ListApplicationsOutput fromJson(Map<String, dynamic> json) =>
      ListApplicationsOutput();
}

class ListDeploymentConfigsOutput {
  /// A list of deployment configurations, including built-in configurations
  /// such as CodeDeployDefault.OneAtATime.
  final List<String> deploymentConfigsList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment configurations
  /// call to return the next set of deployment configurations in the list.
  final String nextToken;

  ListDeploymentConfigsOutput({
    this.deploymentConfigsList,
    this.nextToken,
  });
  static ListDeploymentConfigsOutput fromJson(Map<String, dynamic> json) =>
      ListDeploymentConfigsOutput();
}

class ListDeploymentGroupsOutput {
  /// The application name.
  final String applicationName;

  /// A list of deployment group names.
  final List<String> deploymentGroups;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment groups call to
  /// return the next set of deployment groups in the list.
  final String nextToken;

  ListDeploymentGroupsOutput({
    this.applicationName,
    this.deploymentGroups,
    this.nextToken,
  });
  static ListDeploymentGroupsOutput fromJson(Map<String, dynamic> json) =>
      ListDeploymentGroupsOutput();
}

class ListDeploymentInstancesOutput {
  /// A list of instance IDs.
  final List<String> instancesList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment instances call to
  /// return the next set of deployment instances in the list.
  final String nextToken;

  ListDeploymentInstancesOutput({
    this.instancesList,
    this.nextToken,
  });
  static ListDeploymentInstancesOutput fromJson(Map<String, dynamic> json) =>
      ListDeploymentInstancesOutput();
}

class ListDeploymentTargetsOutput {
  ///  The unique IDs of deployment targets.
  final List<String> targetIds;

  ///  If a large amount of information is returned, a token identifier is also
  /// returned. It can be used in a subsequent `ListDeploymentTargets` call to
  /// return the next set of deployment targets in the list.
  final String nextToken;

  ListDeploymentTargetsOutput({
    this.targetIds,
    this.nextToken,
  });
  static ListDeploymentTargetsOutput fromJson(Map<String, dynamic> json) =>
      ListDeploymentTargetsOutput();
}

class ListDeploymentsOutput {
  /// A list of deployment IDs.
  final List<String> deployments;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployments call to return
  /// the next set of deployments in the list.
  final String nextToken;

  ListDeploymentsOutput({
    this.deployments,
    this.nextToken,
  });
  static ListDeploymentsOutput fromJson(Map<String, dynamic> json) =>
      ListDeploymentsOutput();
}

class ListGitHubAccountTokenNamesOutput {
  /// A list of names of connections to GitHub accounts.
  final List<String> tokenNameList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent ListGitHubAccountTokenNames call
  /// to return the next set of names in the list.
  final String nextToken;

  ListGitHubAccountTokenNamesOutput({
    this.tokenNameList,
    this.nextToken,
  });
  static ListGitHubAccountTokenNamesOutput fromJson(
          Map<String, dynamic> json) =>
      ListGitHubAccountTokenNamesOutput();
}

class ListOnPremisesInstancesOutput {
  /// The list of matching on-premises instance names.
  final List<String> instanceNames;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list on-premises instances call
  /// to return the next set of on-premises instances in the list.
  final String nextToken;

  ListOnPremisesInstancesOutput({
    this.instanceNames,
    this.nextToken,
  });
  static ListOnPremisesInstancesOutput fromJson(Map<String, dynamic> json) =>
      ListOnPremisesInstancesOutput();
}

class ListTagsForResourceOutput {
  ///  A list of tags returned by `ListTagsForResource`. The tags are associated
  /// with the resource identified by the input `ResourceArn` parameter.
  final List<Tag> tags;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call
  /// to return the next set of application revisions in the list.
  final String nextToken;

  ListTagsForResourceOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput();
}

class LoadBalancerInfo {
  /// An array that contains information about the load balancer to use for load
  /// balancing in a deployment. In Elastic Load Balancing, load balancers are
  /// used with Classic Load Balancers.
  ///
  ///   Adding more than one load balancer to the array is not supported.
  final List<ElbInfo> elbInfoList;

  /// An array that contains information about the target group to use for load
  /// balancing in a deployment. In Elastic Load Balancing, target groups are
  /// used with Application Load Balancers.
  ///
  ///   Adding more than one target group to the array is not supported.
  final List<TargetGroupInfo> targetGroupInfoList;

  ///  The target group pair information. This is an array of
  /// `TargeGroupPairInfo` objects with a maximum size of one.
  final List<TargetGroupPairInfo> targetGroupPairInfoList;

  LoadBalancerInfo({
    this.elbInfoList,
    this.targetGroupInfoList,
    this.targetGroupPairInfoList,
  });
  static LoadBalancerInfo fromJson(Map<String, dynamic> json) =>
      LoadBalancerInfo();
}

class MinimumHealthyHosts {
  /// The minimum healthy instance value.
  final int value;

  /// The minimum healthy instance type:
  ///
  /// *   HOST_COUNT: The minimum number of healthy instance as an absolute
  /// value.
  ///
  /// *   FLEET_PERCENT: The minimum number of healthy instance as a percentage
  /// of the total number of instance in the deployment.
  ///
  ///
  /// In an example of nine instance, if a HOST\_COUNT of six is specified,
  /// deploy to up to three instances at a time. The deployment is successful if
  /// six or more instances are deployed to successfully. Otherwise, the
  /// deployment fails. If a FLEET\_PERCENT of 40 is specified, deploy to up to
  /// five instance at a time. The deployment is successful if four or more
  /// instance are deployed to successfully. Otherwise, the deployment fails.
  ///
  ///  In a call to the `GetDeploymentConfig`, CodeDeployDefault.OneAtATime
  /// returns a minimum healthy instance type of MOST\_CONCURRENCY and a value
  /// of 1. This means a deployment to only one instance at a time. (You cannot
  /// set the type to MOST\_CONCURRENCY, only to HOST\_COUNT or FLEET\_PERCENT.)
  /// In addition, with CodeDeployDefault.OneAtATime, AWS CodeDeploy attempts to
  /// ensure that all instances but one are kept in a healthy state during the
  /// deployment. Although this allows one instance at a time to be taken
  /// offline for a new deployment, it also means that if the deployment to the
  /// last instance fails, the overall deployment is still successful.
  ///
  /// For more information, see [AWS CodeDeploy Instance
  /// Health](https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html)
  /// in the _AWS CodeDeploy User Guide_.
  final String type;

  MinimumHealthyHosts({
    this.value,
    this.type,
  });
  static MinimumHealthyHosts fromJson(Map<String, dynamic> json) =>
      MinimumHealthyHosts();
}

class OnPremisesTagSet {
  /// A list that contains other lists of on-premises instance tag groups. For
  /// an instance to be included in the deployment group, it must be identified
  /// by all of the tag groups in the list.
  final List<List<TagFilter>> onPremisesTagSetList;

  OnPremisesTagSet({
    this.onPremisesTagSetList,
  });
  static OnPremisesTagSet fromJson(Map<String, dynamic> json) =>
      OnPremisesTagSet();
}

class PutLifecycleEventHookExecutionStatusOutput {
  /// The execution ID of the lifecycle event hook. A hook is specified in the
  /// `hooks` section of the deployment's AppSpec file.
  final String lifecycleEventHookExecutionId;

  PutLifecycleEventHookExecutionStatusOutput({
    this.lifecycleEventHookExecutionId,
  });
  static PutLifecycleEventHookExecutionStatusOutput fromJson(
          Map<String, dynamic> json) =>
      PutLifecycleEventHookExecutionStatusOutput();
}

class RawString {
  /// The YAML-formatted or JSON-formatted revision string. It includes
  /// information about which Lambda function to update and optional Lambda
  /// functions that validate deployment lifecycle events.
  final String content;

  /// The SHA256 hash value of the revision content.
  final String sha256;

  RawString({
    this.content,
    this.sha256,
  });
  static RawString fromJson(Map<String, dynamic> json) => RawString();
}

class RevisionInfo {
  /// Information about the location and type of an application revision.
  final RevisionLocation revisionLocation;

  /// Information about an application revision, including usage details and
  /// associated deployment groups.
  final GenericRevisionInfo genericRevisionInfo;

  RevisionInfo({
    this.revisionLocation,
    this.genericRevisionInfo,
  });
  static RevisionInfo fromJson(Map<String, dynamic> json) => RevisionInfo();
}

class RevisionLocation {
  /// The type of application revision:
  ///
  /// *   S3: An application revision stored in Amazon S3.
  ///
  /// *   GitHub: An application revision stored in GitHub (EC2/On-premises
  /// deployments only).
  ///
  /// *   String: A YAML-formatted or JSON-formatted string (AWS Lambda
  /// deployments only).
  final String revisionType;

  /// Information about the location of a revision stored in Amazon S3.
  final S3Location s3Location;

  /// Information about the location of application artifacts stored in GitHub.
  final GitHubLocation gitHubLocation;

  /// Information about the location of an AWS Lambda deployment revision stored
  /// as a RawString.
  final RawString string;

  ///  The content of an AppSpec file for an AWS Lambda or Amazon ECS
  /// deployment. The content is formatted as JSON or YAML and stored as a
  /// RawString.
  final AppSpecContent appSpecContent;

  RevisionLocation({
    this.revisionType,
    this.s3Location,
    this.gitHubLocation,
    this.string,
    this.appSpecContent,
  });
  static RevisionLocation fromJson(Map<String, dynamic> json) =>
      RevisionLocation();
}

class RollbackInfo {
  /// The ID of the deployment rollback.
  final String rollbackDeploymentId;

  /// The deployment ID of the deployment that was underway and triggered a
  /// rollback deployment because it failed or was stopped.
  final String rollbackTriggeringDeploymentId;

  /// Information that describes the status of a deployment rollback (for
  /// example, whether the deployment can't be rolled back, is in progress,
  /// failed, or succeeded).
  final String rollbackMessage;

  RollbackInfo({
    this.rollbackDeploymentId,
    this.rollbackTriggeringDeploymentId,
    this.rollbackMessage,
  });
  static RollbackInfo fromJson(Map<String, dynamic> json) => RollbackInfo();
}

class S3Location {
  /// The name of the Amazon S3 bucket where the application revision is stored.
  final String bucket;

  /// The name of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  final String key;

  /// The file type of the application revision. Must be one of the following:
  ///
  /// *   tar: A tar archive file.
  ///
  /// *   tgz: A compressed tar archive file.
  ///
  /// *   zip: A zip archive file.
  final String bundleType;

  /// A specific version of the Amazon S3 object that represents the bundled
  /// artifacts for the application revision.
  ///
  /// If the version is not specified, the system uses the most recent version
  /// by default.
  final String version;

  /// The ETag of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  ///
  /// If the ETag is not specified as an input parameter, ETag validation of the
  /// object is skipped.
  final String eTag;

  S3Location({
    this.bucket,
    this.key,
    this.bundleType,
    this.version,
    this.eTag,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location();
}

class StopDeploymentOutput {
  /// The status of the stop deployment operation:
  ///
  /// *   Pending: The stop operation is pending.
  ///
  /// *   Succeeded: The stop operation was successful.
  final String status;

  /// An accompanying status message.
  final String statusMessage;

  StopDeploymentOutput({
    this.status,
    this.statusMessage,
  });
  static StopDeploymentOutput fromJson(Map<String, dynamic> json) =>
      StopDeploymentOutput();
}

class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagFilter {
  /// The on-premises instance tag filter key.
  final String key;

  /// The on-premises instance tag filter value.
  final String value;

  /// The on-premises instance tag filter type:
  ///
  /// *   KEY_ONLY: Key only.
  ///
  /// *   VALUE_ONLY: Value only.
  ///
  /// *   KEY\_AND\_VALUE: Key and value.
  final String type;

  TagFilter({
    this.key,
    this.value,
    this.type,
  });
  static TagFilter fromJson(Map<String, dynamic> json) => TagFilter();
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

class TargetGroupInfo {
  /// For blue/green deployments, the name of the target group that instances in
  /// the original environment are deregistered from, and instances in the
  /// replacement environment are registered with. For in-place deployments, the
  /// name of the target group that instances are deregistered from, so they are
  /// not serving traffic during a deployment, and then re-registered with after
  /// the deployment is complete.
  final String name;

  TargetGroupInfo({
    this.name,
  });
  static TargetGroupInfo fromJson(Map<String, dynamic> json) =>
      TargetGroupInfo();
}

class TargetGroupPairInfo {
  ///  One pair of target groups. One is associated with the original task set.
  /// The second is associated with the task set that serves traffic after the
  /// deployment is complete.
  final List<TargetGroupInfo> targetGroups;

  ///  The path used by a load balancer to route production traffic when an
  /// Amazon ECS deployment is complete.
  final TrafficRoute prodTrafficRoute;

  ///  An optional path used by a load balancer to route test traffic after an
  /// Amazon ECS deployment. Validation can occur while test traffic is served
  /// during a deployment.
  final TrafficRoute testTrafficRoute;

  TargetGroupPairInfo({
    this.targetGroups,
    this.prodTrafficRoute,
    this.testTrafficRoute,
  });
  static TargetGroupPairInfo fromJson(Map<String, dynamic> json) =>
      TargetGroupPairInfo();
}

class TargetInstances {
  /// The tag filter key, type, and value used to identify Amazon EC2 instances
  /// in a replacement environment for a blue/green deployment. Cannot be used
  /// in the same call as ec2TagSet.
  final List<Ec2TagFilter> tagFilters;

  /// The names of one or more Auto Scaling groups to identify a replacement
  /// environment for a blue/green deployment.
  final List<String> autoScalingGroups;

  /// Information about the groups of EC2 instance tags that an instance must be
  /// identified by in order for it to be included in the replacement
  /// environment for a blue/green deployment. Cannot be used in the same call
  /// as tagFilters.
  final Ec2TagSet ec2TagSet;

  TargetInstances({
    this.tagFilters,
    this.autoScalingGroups,
    this.ec2TagSet,
  });
  static TargetInstances fromJson(Map<String, dynamic> json) =>
      TargetInstances();
}

class TimeBasedCanary {
  /// The percentage of traffic to shift in the first increment of a
  /// `TimeBasedCanary` deployment.
  final int canaryPercentage;

  /// The number of minutes between the first and second traffic shifts of a
  /// `TimeBasedCanary` deployment.
  final int canaryInterval;

  TimeBasedCanary({
    this.canaryPercentage,
    this.canaryInterval,
  });
  static TimeBasedCanary fromJson(Map<String, dynamic> json) =>
      TimeBasedCanary();
}

class TimeBasedLinear {
  /// The percentage of traffic that is shifted at the start of each increment
  /// of a `TimeBasedLinear` deployment.
  final int linearPercentage;

  /// The number of minutes between each incremental traffic shift of a
  /// `TimeBasedLinear` deployment.
  final int linearInterval;

  TimeBasedLinear({
    this.linearPercentage,
    this.linearInterval,
  });
  static TimeBasedLinear fromJson(Map<String, dynamic> json) =>
      TimeBasedLinear();
}

class TimeRange {
  /// The start time of the time range.
  ///
  ///
  ///
  /// Specify null to leave the start time open-ended.
  final DateTime start;

  /// The end time of the time range.
  ///
  ///
  ///
  /// Specify null to leave the end time open-ended.
  final DateTime end;

  TimeRange({
    this.start,
    this.end,
  });
}

class TrafficRoute {
  ///  The ARN of one listener. The listener identifies the route between a
  /// target group and a load balancer. This is an array of strings with a
  /// maximum size of one.
  final List<String> listenerArns;

  TrafficRoute({
    this.listenerArns,
  });
  static TrafficRoute fromJson(Map<String, dynamic> json) => TrafficRoute();
}

class TrafficRoutingConfig {
  /// The type of traffic shifting (`TimeBasedCanary` or `TimeBasedLinear`) used
  /// by a deployment configuration .
  final String type;

  /// A configuration that shifts traffic from one version of a Lambda function
  /// to another in two increments. The original and target Lambda function
  /// versions are specified in the deployment's AppSpec file.
  final TimeBasedCanary timeBasedCanary;

  /// A configuration that shifts traffic from one version of a Lambda function
  /// to another in equal increments, with an equal number of minutes between
  /// each increment. The original and target Lambda function versions are
  /// specified in the deployment's AppSpec file.
  final TimeBasedLinear timeBasedLinear;

  TrafficRoutingConfig({
    this.type,
    this.timeBasedCanary,
    this.timeBasedLinear,
  });
  static TrafficRoutingConfig fromJson(Map<String, dynamic> json) =>
      TrafficRoutingConfig();
}

class TriggerConfig {
  /// The name of the notification trigger.
  final String triggerName;

  /// The ARN of the Amazon Simple Notification Service topic through which
  /// notifications about deployment or instance events are sent.
  final String triggerTargetArn;

  /// The event type or types for which notifications are triggered.
  final List<String> triggerEvents;

  TriggerConfig({
    this.triggerName,
    this.triggerTargetArn,
    this.triggerEvents,
  });
  static TriggerConfig fromJson(Map<String, dynamic> json) => TriggerConfig();
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}

class UpdateDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, AWS CodeDeploy successfully
  /// removed all corresponding Auto Scaling lifecycle event hooks from the AWS
  /// account. If the output contains data, AWS CodeDeploy could not remove some
  /// Auto Scaling lifecycle event hooks from the AWS account.
  final List<AutoScalingGroup> hooksNotCleanedUp;

  UpdateDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });
  static UpdateDeploymentGroupOutput fromJson(Map<String, dynamic> json) =>
      UpdateDeploymentGroupOutput();
}
