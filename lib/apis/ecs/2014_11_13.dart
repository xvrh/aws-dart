import 'package:meta/meta.dart';

/// Amazon Elastic Container Service
///
/// Amazon Elastic Container Service (Amazon ECS) is a highly scalable, fast,
/// container management service that makes it easy to run, stop, and manage
/// Docker containers on a cluster. You can host your cluster on a serverless
/// infrastructure that is managed by Amazon ECS by launching your services or
/// tasks using the Fargate launch type. For more control, you can host your
/// tasks on a cluster of Amazon Elastic Compute Cloud (Amazon EC2) instances
/// that you manage by using the EC2 launch type. For more information about
/// launch types, see [Amazon ECS Launch
/// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html).
///
/// Amazon ECS lets you launch and stop container-based applications with simple
/// API calls, allows you to get the state of your cluster from a centralized
/// service, and gives you access to many familiar Amazon EC2 features.
///
/// You can use Amazon ECS to schedule the placement of containers across your
/// cluster based on your resource needs, isolation policies, and availability
/// requirements. Amazon ECS eliminates the need for you to operate your own
/// cluster management and configuration management systems or worry about
/// scaling your management infrastructure.
class EcsApi {
  /// Creates a new Amazon ECS cluster. By default, your account receives a
  /// `default` cluster when you launch your first container instance. However,
  /// you can create your own cluster with a unique name with the
  /// `CreateCluster` action.
  ///
  ///
  ///
  /// When you call the CreateCluster API operation, Amazon ECS attempts to
  /// create the service-linked role for your account so that required resources
  /// in other AWS services can be managed on your behalf. However, if the IAM
  /// user that makes the call does not have permissions to create the
  /// service-linked role, it is not created. For more information, see [Using
  /// Service-Linked Roles for Amazon
  /// ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> createCluster(
      {String clusterName,
      List<Tag> tags,
      List<ClusterSetting> settings}) async {}

  /// Runs and maintains a desired number of tasks from a specified task
  /// definition. If the number of tasks running in a service drops below the
  /// `desiredCount`, Amazon ECS runs another copy of the task in the specified
  /// cluster. To update an existing service, see UpdateService.
  ///
  /// In addition to maintaining the desired count of tasks in your service, you
  /// can optionally run your service behind one or more load balancers. The
  /// load balancers distribute traffic across the tasks that are associated
  /// with the service. For more information, see [Service Load
  /// Balancing](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// Tasks for services that _do not_ use a load balancer are considered
  /// healthy if they're in the `RUNNING` state. Tasks for services that _do_
  /// use a load balancer are considered healthy if they're in the `RUNNING`
  /// state and the container instance that they're hosted on is reported as
  /// healthy by the load balancer.
  ///
  /// There are two service scheduler strategies available:
  ///
  /// *    `REPLICA` \- The replica scheduling strategy places and maintains the
  /// desired number of tasks across your cluster. By default, the service
  /// scheduler spreads tasks across Availability Zones. You can use task
  /// placement strategies and constraints to customize task placement
  /// decisions. For more information, see [Service Scheduler
  /// Concepts](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// *    `DAEMON` \- The daemon scheduling strategy deploys exactly one task
  /// on each active container instance that meets all of the task placement
  /// constraints that you specify in your cluster. When using this strategy,
  /// you don't need to specify a desired number of tasks, a task placement
  /// strategy, or use Service Auto Scaling policies. For more information, see
  /// [Service Scheduler
  /// Concepts](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  ///
  /// You can optionally specify a deployment configuration for your service.
  /// The deployment is triggered by changing properties, such as the task
  /// definition or the desired count of a service, with an UpdateService
  /// operation. The default value for a replica service for
  /// `minimumHealthyPercent` is 100%. The default value for a daemon service
  /// for `minimumHealthyPercent` is 0%.
  ///
  /// If a service is using the `ECS` deployment controller, the minimum healthy
  /// percent represents a lower limit on the number of tasks in a service that
  /// must remain in the `RUNNING` state during a deployment, as a percentage of
  /// the desired number of tasks (rounded up to the nearest integer), and while
  /// any container instances are in the `DRAINING` state if the service
  /// contains tasks using the EC2 launch type. This parameter enables you to
  /// deploy without using additional cluster capacity. For example, if your
  /// service has a desired number of four tasks and a minimum healthy percent
  /// of 50%, the scheduler might stop two existing tasks to free up cluster
  /// capacity before starting two new tasks. Tasks for services that _do not_
  /// use a load balancer are considered healthy if they're in the `RUNNING`
  /// state. Tasks for services that _do_ use a load balancer are considered
  /// healthy if they're in the `RUNNING` state and they're reported as healthy
  /// by the load balancer. The default value for minimum healthy percent is
  /// 100%.
  ///
  /// If a service is using the `ECS` deployment controller, the **maximum
  /// percent** parameter represents an upper limit on the number of tasks in a
  /// service that are allowed in the `RUNNING` or `PENDING` state during a
  /// deployment, as a percentage of the desired number of tasks (rounded down
  /// to the nearest integer), and while any container instances are in the
  /// `DRAINING` state if the service contains tasks using the EC2 launch type.
  /// This parameter enables you to define the deployment batch size. For
  /// example, if your service has a desired number of four tasks and a maximum
  /// percent value of 200%, the scheduler may start four new tasks before
  /// stopping the four older tasks (provided that the cluster resources
  /// required to do this are available). The default value for maximum percent
  /// is 200%.
  ///
  /// If a service is using either the `CODE_DEPLOY` or `EXTERNAL` deployment
  /// controller types and tasks that use the EC2 launch type, the **minimum
  /// healthy percent** and **maximum percent** values are used only to define
  /// the lower and upper limit on the number of the tasks in the service that
  /// remain in the `RUNNING` state while the container instances are in the
  /// `DRAINING` state. If the tasks in the service use the Fargate launch type,
  /// the minimum healthy percent and maximum percent values aren't used,
  /// although they're currently visible when describing your service.
  ///
  /// When creating a service that uses the `EXTERNAL` deployment controller,
  /// you can specify only parameters that aren't controlled at the task set
  /// level. The only required parameter is the service name. You control your
  /// services using the CreateTaskSet operation. For more information, see
  /// [Amazon ECS Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement in your cluster using the following logic:
  ///
  /// *   Determine which of the container instances in your cluster can support
  /// your service's task definition (for example, they have the required CPU,
  /// memory, ports, and container instance attributes).
  ///
  /// *   By default, the service scheduler attempts to balance tasks across
  /// Availability Zones in this manner (although you can choose a different
  /// placement strategy) with the `placementStrategy` parameter):
  ///
  ///     *   Sort the valid container instances, giving priority to instances
  /// that have the fewest number of running tasks for this service in their
  /// respective Availability Zone. For example, if zone A has one running
  /// service task and zones B and C each have zero, valid container instances
  /// in either zone B or C are considered optimal for placement.
  ///
  ///     *   Place the new service task on a valid container instance in an
  /// optimal Availability Zone (based on the previous steps), favoring
  /// container instances with the fewest number of running tasks for this
  /// service.
  Future<void> createService(String serviceName,
      {String cluster,
      String taskDefinition,
      List<LoadBalancer> loadBalancers,
      List<ServiceRegistry> serviceRegistries,
      int desiredCount,
      String clientToken,
      String launchType,
      String platformVersion,
      String role,
      DeploymentConfiguration deploymentConfiguration,
      List<PlacementConstraint> placementConstraints,
      List<PlacementStrategy> placementStrategy,
      NetworkConfiguration networkConfiguration,
      int healthCheckGracePeriodSeconds,
      String schedulingStrategy,
      DeploymentController deploymentController,
      List<Tag> tags,
      bool enableEcsManagedTags,
      String propagateTags}) async {}

  /// Create a task set in the specified cluster and service. This is used when
  /// a service uses the `EXTERNAL` deployment controller type. For more
  /// information, see [Amazon ECS Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> createTaskSet(
      {@required String service,
      @required String cluster,
      String externalId,
      @required String taskDefinition,
      NetworkConfiguration networkConfiguration,
      List<LoadBalancer> loadBalancers,
      List<ServiceRegistry> serviceRegistries,
      String launchType,
      String platformVersion,
      Scale scale,
      String clientToken}) async {}

  /// Disables an account setting for a specified IAM user, IAM role, or the
  /// root user for an account.
  Future<void> deleteAccountSetting(String name, {String principalArn}) async {}

  /// Deletes one or more custom attributes from an Amazon ECS resource.
  Future<void> deleteAttributes(List<Attribute> attributes,
      {String cluster}) async {}

  /// Deletes the specified cluster. You must deregister all container instances
  /// from this cluster before you may delete it. You can list the container
  /// instances in a cluster with ListContainerInstances and deregister them
  /// with DeregisterContainerInstance.
  Future<void> deleteCluster(String cluster) async {}

  /// Deletes a specified service within a cluster. You can delete a service if
  /// you have no running tasks in it and the desired task count is zero. If the
  /// service is actively maintaining tasks, you cannot delete it, and you must
  /// update the service to a desired task count of zero. For more information,
  /// see UpdateService.
  ///
  ///  When you delete a service, if there are still running tasks that require
  /// cleanup, the service status moves from `ACTIVE` to `DRAINING`, and the
  /// service is no longer visible in the console or in the ListServices API
  /// operation. After all tasks have transitioned to either `STOPPING` or
  /// `STOPPED` status, the service status moves from `DRAINING` to `INACTIVE`.
  /// Services in the `DRAINING` or `INACTIVE` status can still be viewed with
  /// the DescribeServices API operation. However, in the future, `INACTIVE`
  /// services may be cleaned up and purged from Amazon ECS record keeping, and
  /// DescribeServices calls on those services return a
  /// `ServiceNotFoundException` error.
  ///
  /// If you attempt to create a new service with the same name as an existing
  /// service in either `ACTIVE` or `DRAINING` status, you receive an error.
  Future<void> deleteService(String service,
      {String cluster, bool force}) async {}

  /// Deletes a specified task set within a service. This is used when a service
  /// uses the `EXTERNAL` deployment controller type. For more information, see
  /// [Amazon ECS Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> deleteTaskSet(
      {@required String cluster,
      @required String service,
      @required String taskSet,
      bool force}) async {}

  /// Deregisters an Amazon ECS container instance from the specified cluster.
  /// This instance is no longer available to run tasks.
  ///
  /// If you intend to use the container instance for some other purpose after
  /// deregistration, you should stop all of the tasks running on the container
  /// instance before deregistration. That prevents any orphaned tasks from
  /// consuming resources.
  ///
  /// Deregistering a container instance removes the instance from a cluster,
  /// but it does not terminate the EC2 instance. If you are finished using the
  /// instance, be sure to terminate it in the Amazon EC2 console to stop
  /// billing.
  ///
  ///
  ///
  /// If you terminate a running container instance, Amazon ECS automatically
  /// deregisters the instance from your cluster (stopped container instances or
  /// instances with disconnected agents are not automatically deregistered when
  /// terminated).
  Future<void> deregisterContainerInstance(String containerInstance,
      {String cluster, bool force}) async {}

  /// Deregisters the specified task definition by family and revision. Upon
  /// deregistration, the task definition is marked as `INACTIVE`. Existing
  /// tasks and services that reference an `INACTIVE` task definition continue
  /// to run without disruption. Existing services that reference an `INACTIVE`
  /// task definition can still scale up or down by modifying the service's
  /// desired count.
  ///
  /// You cannot use an `INACTIVE` task definition to run new tasks or create
  /// new services, and you cannot update an existing service to reference an
  /// `INACTIVE` task definition. However, there may be up to a 10-minute window
  /// following deregistration where these restrictions have not yet taken
  /// effect.
  ///
  ///
  ///
  /// At this time, `INACTIVE` task definitions remain discoverable in your
  /// account indefinitely. However, this behavior is subject to change in the
  /// future, so you should not rely on `INACTIVE` task definitions persisting
  /// beyond the lifecycle of any associated tasks and services.
  Future<void> deregisterTaskDefinition(String taskDefinition) async {}

  /// Describes one or more of your clusters.
  Future<void> describeClusters(
      {List<String> clusters, List<String> include}) async {}

  /// Describes Amazon Elastic Container Service container instances. Returns
  /// metadata about registered and remaining resources on each container
  /// instance requested.
  Future<void> describeContainerInstances(List<String> containerInstances,
      {String cluster, List<String> include}) async {}

  /// Describes the specified services running in your cluster.
  Future<void> describeServices(List<String> services,
      {String cluster, List<String> include}) async {}

  /// Describes a task definition. You can specify a `family` and `revision` to
  /// find information about a specific task definition, or you can simply
  /// specify the family to find the latest `ACTIVE` revision in that family.
  ///
  ///
  ///
  /// You can only describe `INACTIVE` task definitions while an active task or
  /// service references them.
  Future<void> describeTaskDefinition(String taskDefinition,
      {List<String> include}) async {}

  /// Describes the task sets in the specified cluster and service. This is used
  /// when a service uses the `EXTERNAL` deployment controller type. For more
  /// information, see [Amazon ECS Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> describeTaskSets(
      {@required String cluster,
      @required String service,
      List<String> taskSets}) async {}

  /// Describes a specified task or tasks.
  Future<void> describeTasks(List<String> tasks,
      {String cluster, List<String> include}) async {}

  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  ///
  /// Returns an endpoint for the Amazon ECS agent to poll for updates.
  Future<void> discoverPollEndpoint(
      {String containerInstance, String cluster}) async {}

  /// Lists the account settings for a specified principal.
  Future<void> listAccountSettings(
      {String name,
      String value,
      String principalArn,
      bool effectiveSettings,
      String nextToken,
      int maxResults}) async {}

  /// Lists the attributes for Amazon ECS resources within a specified target
  /// type and cluster. When you specify a target type and cluster,
  /// `ListAttributes` returns a list of attribute objects, one for each
  /// attribute on each resource. You can filter the list of results to a single
  /// attribute name to only return results that have that name. You can also
  /// filter the results by attribute name and value, for example, to see which
  /// container instances in a cluster are running a Linux AMI
  /// (`ecs.os-type=linux`).
  Future<void> listAttributes(String targetType,
      {String cluster,
      String attributeName,
      String attributeValue,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of existing clusters.
  Future<void> listClusters({String nextToken, int maxResults}) async {}

  /// Returns a list of container instances in a specified cluster. You can
  /// filter the results of a `ListContainerInstances` operation with cluster
  /// query language statements inside the `filter` parameter. For more
  /// information, see [Cluster Query
  /// Language](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> listContainerInstances(
      {String cluster,
      String filter,
      String nextToken,
      int maxResults,
      String status}) async {}

  /// Lists the services that are running in a specified cluster.
  Future<void> listServices(
      {String cluster,
      String nextToken,
      int maxResults,
      String launchType,
      String schedulingStrategy}) async {}

  /// List the tags for an Amazon ECS resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Returns a list of task definition families that are registered to your
  /// account (which may include task definition families that no longer have
  /// any `ACTIVE` task definition revisions).
  ///
  /// You can filter out task definition families that do not contain any
  /// `ACTIVE` task definition revisions by setting the `status` parameter to
  /// `ACTIVE`. You can also filter the results with the `familyPrefix`
  /// parameter.
  Future<void> listTaskDefinitionFamilies(
      {String familyPrefix,
      String status,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of task definitions that are registered to your account.
  /// You can filter the results by family name with the `familyPrefix`
  /// parameter or by status with the `status` parameter.
  Future<void> listTaskDefinitions(
      {String familyPrefix,
      String status,
      String sort,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of tasks for a specified cluster. You can filter the
  /// results by family name, by a particular container instance, or by the
  /// desired status of the task with the `family`, `containerInstance`, and
  /// `desiredStatus` parameters.
  ///
  /// Recently stopped tasks might appear in the returned results. Currently,
  /// stopped tasks appear in the returned results for at least one hour.
  Future<void> listTasks(
      {String cluster,
      String containerInstance,
      String family,
      String nextToken,
      int maxResults,
      String startedBy,
      String serviceName,
      String desiredStatus,
      String launchType}) async {}

  /// Modifies an account setting. Account settings are set on a per-Region
  /// basis.
  ///
  /// If you change the account setting for the root user, the default settings
  /// for all of the IAM users and roles for which no individual account setting
  /// has been specified are reset. For more information, see [Account
  /// Settings](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// When `serviceLongArnFormat`, `taskLongArnFormat`, or
  /// `containerInstanceLongArnFormat` are specified, the Amazon Resource Name
  /// (ARN) and resource ID format of the resource type for a specified IAM
  /// user, IAM role, or the root user for an account is affected. The opt-in
  /// and opt-out account setting must be set for each Amazon ECS resource
  /// separately. The ARN and resource ID format of a resource will be defined
  /// by the opt-in status of the IAM user or role that created the resource.
  /// You must enable this setting to use Amazon ECS features such as resource
  /// tagging.
  ///
  /// When `awsvpcTrunking` is specified, the elastic network interface (ENI)
  /// limit for any new container instances that support the feature is changed.
  /// If `awsvpcTrunking` is enabled, any new container instances that support
  /// the feature are launched have the increased ENI limits available to them.
  /// For more information, see [Elastic Network Interface
  /// Trunking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// When `containerInsights` is specified, the default setting indicating
  /// whether CloudWatch Container Insights is enabled for your clusters is
  /// changed. If `containerInsights` is enabled, any new clusters that are
  /// created will have Container Insights enabled unless you disable it during
  /// cluster creation. For more information, see [CloudWatch Container
  /// Insights](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> putAccountSetting(
      {@required String name,
      @required String value,
      String principalArn}) async {}

  /// Modifies an account setting for all IAM users on an account for whom no
  /// individual account setting has been specified. Account settings are set on
  /// a per-Region basis.
  Future<void> putAccountSettingDefault(
      {@required String name, @required String value}) async {}

  /// Create or update an attribute on an Amazon ECS resource. If the attribute
  /// does not exist, it is created. If the attribute exists, its value is
  /// replaced with the specified value. To delete an attribute, use
  /// DeleteAttributes. For more information, see
  /// [Attributes](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> putAttributes(List<Attribute> attributes,
      {String cluster}) async {}

  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  ///
  /// Registers an EC2 instance into the specified cluster. This instance
  /// becomes available to place containers on.
  Future<void> registerContainerInstance(
      {String cluster,
      String instanceIdentityDocument,
      String instanceIdentityDocumentSignature,
      List<Resource> totalResources,
      VersionInfo versionInfo,
      String containerInstanceArn,
      List<Attribute> attributes,
      List<PlatformDevice> platformDevices,
      List<Tag> tags}) async {}

  /// Registers a new task definition from the supplied `family` and
  /// `containerDefinitions`. Optionally, you can add data volumes to your
  /// containers with the `volumes` parameter. For more information about task
  /// definition parameters and defaults, see [Amazon ECS Task
  /// Definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// You can specify an IAM role for your task with the `taskRoleArn`
  /// parameter. When you specify an IAM role for a task, its containers can
  /// then use the latest versions of the AWS CLI or SDKs to make API requests
  /// to the AWS services that are specified in the IAM policy associated with
  /// the role. For more information, see [IAM Roles for
  /// Tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// You can specify a Docker networking mode for the containers in your task
  /// definition with the `networkMode` parameter. The available network modes
  /// correspond to those described in [Network
  /// settings](https://docs.docker.com/engine/reference/run/#/network-settings)
  /// in the Docker run reference. If you specify the `awsvpc` network mode, the
  /// task is allocated an elastic network interface, and you must specify a
  /// NetworkConfiguration when you create a service or run a task with the task
  /// definition. For more information, see [Task
  /// Networking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> registerTaskDefinition(
      {@required String family,
      String taskRoleArn,
      String executionRoleArn,
      String networkMode,
      @required List<ContainerDefinition> containerDefinitions,
      List<Volume> volumes,
      List<TaskDefinitionPlacementConstraint> placementConstraints,
      List<String> requiresCompatibilities,
      String cpu,
      String memory,
      List<Tag> tags,
      String pidMode,
      String ipcMode,
      ProxyConfiguration proxyConfiguration,
      List<InferenceAccelerator> inferenceAccelerators}) async {}

  /// Starts a new task using the specified task definition.
  ///
  /// You can allow Amazon ECS to place tasks for you, or you can customize how
  /// Amazon ECS places tasks using placement constraints and placement
  /// strategies. For more information, see [Scheduling
  /// Tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  /// Alternatively, you can use StartTask to use your own scheduler or place
  /// tasks manually on specific container instances.
  ///
  /// The Amazon ECS API follows an eventual consistency model, due to the
  /// distributed nature of the system supporting the API. This means that the
  /// result of an API command you run that affects your Amazon ECS resources
  /// might not be immediately visible to all subsequent commands you run. Keep
  /// this in mind when you carry out an API command that immediately follows a
  /// previous API command.
  ///
  /// To manage eventual consistency, you can do the following:
  ///
  /// *   Confirm the state of the resource before you run a command to modify
  /// it. Run the DescribeTasks command using an exponential backoff algorithm
  /// to ensure that you allow enough time for the previous command to propagate
  /// through the system. To do this, run the DescribeTasks command repeatedly,
  /// starting with a couple of seconds of wait time and increasing gradually up
  /// to five minutes of wait time.
  ///
  /// *   Add wait time between subsequent commands, even if the DescribeTasks
  /// command returns an accurate response. Apply an exponential backoff
  /// algorithm starting with a couple of seconds of wait time, and increase
  /// gradually up to about five minutes of wait time.
  Future<void> runTask(String taskDefinition,
      {String cluster,
      TaskOverride overrides,
      int count,
      String startedBy,
      String group,
      List<PlacementConstraint> placementConstraints,
      List<PlacementStrategy> placementStrategy,
      String launchType,
      String platformVersion,
      NetworkConfiguration networkConfiguration,
      List<Tag> tags,
      bool enableEcsManagedTags,
      String propagateTags}) async {}

  /// Starts a new task from the specified task definition on the specified
  /// container instance or instances.
  ///
  /// Alternatively, you can use RunTask to place tasks for you. For more
  /// information, see [Scheduling
  /// Tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> startTask(
      {String cluster,
      @required String taskDefinition,
      TaskOverride overrides,
      @required List<String> containerInstances,
      String startedBy,
      String group,
      NetworkConfiguration networkConfiguration,
      List<Tag> tags,
      bool enableEcsManagedTags,
      String propagateTags}) async {}

  /// Stops a running task. Any tags associated with the task will be deleted.
  ///
  /// When StopTask is called on a task, the equivalent of `docker stop` is
  /// issued to the containers running in the task. This results in a `SIGTERM`
  /// value and a default 30-second timeout, after which the `SIGKILL` value is
  /// sent and the containers are forcibly stopped. If the container handles the
  /// `SIGTERM` value gracefully and exits within 30 seconds from receiving it,
  /// no `SIGKILL` value is sent.
  ///
  ///
  ///
  /// The default 30-second timeout can be configured on the Amazon ECS
  /// container agent with the `ECS\_CONTAINER\_STOP_TIMEOUT` variable. For more
  /// information, see [Amazon ECS Container Agent
  /// Configuration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> stopTask(String task, {String cluster, String reason}) async {}

  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  ///
  /// Sent to acknowledge that an attachment changed states.
  Future<void> submitAttachmentStateChanges(
      List<AttachmentStateChange> attachments,
      {String cluster}) async {}

  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  ///
  /// Sent to acknowledge that a container changed states.
  Future<void> submitContainerStateChange(
      {String cluster,
      String task,
      String containerName,
      String runtimeId,
      String status,
      int exitCode,
      String reason,
      List<NetworkBinding> networkBindings}) async {}

  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  ///
  /// Sent to acknowledge that a task changed states.
  Future<void> submitTaskStateChange(
      {String cluster,
      String task,
      String status,
      String reason,
      List<ContainerStateChange> containers,
      List<AttachmentStateChange> attachments,
      DateTime pullStartedAt,
      DateTime pullStoppedAt,
      DateTime executionStoppedAt}) async {}

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Deletes specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Modifies the settings to use for a cluster.
  Future<void> updateClusterSettings(
      {@required String cluster,
      @required List<ClusterSetting> settings}) async {}

  /// Updates the Amazon ECS container agent on a specified container instance.
  /// Updating the Amazon ECS container agent does not interrupt running tasks
  /// or services on the container instance. The process for updating the agent
  /// differs depending on whether your container instance was launched with the
  /// Amazon ECS-optimized AMI or another operating system.
  ///
  ///  `UpdateContainerAgent` requires the Amazon ECS-optimized AMI or Amazon
  /// Linux with the `ecs-init` service installed and running. For help updating
  /// the Amazon ECS container agent on other operating systems, see [Manually
  /// Updating the Amazon ECS Container
  /// Agent](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html#manually_update_agent)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> updateContainerAgent(String containerInstance,
      {String cluster}) async {}

  /// Modifies the status of an Amazon ECS container instance.
  ///
  /// Once a container instance has reached an `ACTIVE` state, you can change
  /// the status of a container instance to `DRAINING` to manually remove an
  /// instance from a cluster, for example to perform system updates, update the
  /// Docker daemon, or scale down the cluster size.
  ///
  ///  A container instance cannot be changed to `DRAINING` until it has reached
  /// an `ACTIVE` status. If the instance is in any other status, an error will
  /// be received.
  ///
  /// When you set a container instance to `DRAINING`, Amazon ECS prevents new
  /// tasks from being scheduled for placement on the container instance and
  /// replacement service tasks are started on other container instances in the
  /// cluster if the resources are available. Service tasks on the container
  /// instance that are in the `PENDING` state are stopped immediately.
  ///
  /// Service tasks on the container instance that are in the `RUNNING` state
  /// are stopped and replaced according to the service's deployment
  /// configuration parameters, `minimumHealthyPercent` and `maximumPercent`.
  /// You can change the deployment configuration of your service using
  /// UpdateService.
  ///
  /// *   If `minimumHealthyPercent` is below 100%, the scheduler can ignore
  /// `desiredCount` temporarily during task replacement. For example,
  /// `desiredCount` is four tasks, a minimum of 50% allows the scheduler to
  /// stop two existing tasks before starting two new tasks. If the minimum is
  /// 100%, the service scheduler can't remove existing tasks until the
  /// replacement tasks are considered healthy. Tasks for services that do not
  /// use a load balancer are considered healthy if they are in the `RUNNING`
  /// state. Tasks for services that use a load balancer are considered healthy
  /// if they are in the `RUNNING` state and the container instance they are
  /// hosted on is reported as healthy by the load balancer.
  ///
  /// *   The `maximumPercent` parameter represents an upper limit on the number
  /// of running tasks during task replacement, which enables you to define the
  /// replacement batch size. For example, if `desiredCount` is four tasks, a
  /// maximum of 200% starts four new tasks before stopping the four tasks to be
  /// drained, provided that the cluster resources required to do this are
  /// available. If the maximum is 100%, then replacement tasks can't start
  /// until the draining tasks have stopped.
  ///
  ///
  /// Any `PENDING` or `RUNNING` tasks that do not belong to a service are not
  /// affected. You must wait for them to finish or stop them manually.
  ///
  /// A container instance has completed draining when it has no more `RUNNING`
  /// tasks. You can verify this using ListTasks.
  ///
  /// When a container instance has been drained, you can set a container
  /// instance to `ACTIVE` status and once it has reached that status the Amazon
  /// ECS scheduler can begin scheduling tasks on the instance again.
  Future<void> updateContainerInstancesState(
      {String cluster,
      @required List<String> containerInstances,
      @required String status}) async {}

  /// Modifies the parameters of a service.
  ///
  /// For services using the rolling update (`ECS`) deployment controller, the
  /// desired count, deployment configuration, network configuration, or task
  /// definition used can be updated.
  ///
  /// For services using the blue/green (`CODE_DEPLOY`) deployment controller,
  /// only the desired count, deployment configuration, and health check grace
  /// period can be updated using this API. If the network configuration,
  /// platform version, or task definition need to be updated, a new AWS
  /// CodeDeploy deployment should be created. For more information, see
  /// [CreateDeployment](https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html)
  /// in the _AWS CodeDeploy API Reference_.
  ///
  /// For services using an external deployment controller, you can update only
  /// the desired count and health check grace period using this API. If the
  /// launch type, load balancer, network configuration, platform version, or
  /// task definition need to be updated, you should create a new task set. For
  /// more information, see CreateTaskSet.
  ///
  /// You can add to or subtract from the number of instantiations of a task
  /// definition in a service by specifying the cluster that the service is
  /// running in and a new `desiredCount` parameter.
  ///
  /// If you have updated the Docker image of your application, you can create a
  /// new task definition with that image and deploy it to your service. The
  /// service scheduler uses the minimum healthy percent and maximum percent
  /// parameters (in the service's deployment configuration) to determine the
  /// deployment strategy.
  ///
  ///  If your updated Docker image uses the same tag as what is in the existing
  /// task definition for your service (for example, `my_image:latest`), you do
  /// not need to create a new revision of your task definition. You can update
  /// the service using the `forceNewDeployment` option. The new tasks launched
  /// by the deployment pull the current image/tag combination from your
  /// repository when they start.
  ///
  /// You can also update the deployment configuration of a service. When a
  /// deployment is triggered by updating the task definition of a service, the
  /// service scheduler uses the deployment configuration parameters,
  /// `minimumHealthyPercent` and `maximumPercent`, to determine the deployment
  /// strategy.
  ///
  /// *   If `minimumHealthyPercent` is below 100%, the scheduler can ignore
  /// `desiredCount` temporarily during a deployment. For example, if
  /// `desiredCount` is four tasks, a minimum of 50% allows the scheduler to
  /// stop two existing tasks before starting two new tasks. Tasks for services
  /// that do not use a load balancer are considered healthy if they are in the
  /// `RUNNING` state. Tasks for services that use a load balancer are
  /// considered healthy if they are in the `RUNNING` state and the container
  /// instance they are hosted on is reported as healthy by the load balancer.
  ///
  /// *   The `maximumPercent` parameter represents an upper limit on the number
  /// of running tasks during a deployment, which enables you to define the
  /// deployment batch size. For example, if `desiredCount` is four tasks, a
  /// maximum of 200% starts four new tasks before stopping the four older tasks
  /// (provided that the cluster resources required to do this are available).
  ///
  ///
  /// When UpdateService stops a task during a deployment, the equivalent of
  /// `docker stop` is issued to the containers running in the task. This
  /// results in a `SIGTERM` and a 30-second timeout, after which `SIGKILL` is
  /// sent and the containers are forcibly stopped. If the container handles the
  /// `SIGTERM` gracefully and exits within 30 seconds from receiving it, no
  /// `SIGKILL` is sent.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement in your cluster with the following logic:
  ///
  /// *   Determine which of the container instances in your cluster can support
  /// your service's task definition (for example, they have the required CPU,
  /// memory, ports, and container instance attributes).
  ///
  /// *   By default, the service scheduler attempts to balance tasks across
  /// Availability Zones in this manner (although you can choose a different
  /// placement strategy):
  ///
  ///     *   Sort the valid container instances by the fewest number of running
  /// tasks for this service in the same Availability Zone as the instance. For
  /// example, if zone A has one running service task and zones B and C each
  /// have zero, valid container instances in either zone B or C are considered
  /// optimal for placement.
  ///
  ///     *   Place the new service task on a valid container instance in an
  /// optimal Availability Zone (based on the previous steps), favoring
  /// container instances with the fewest number of running tasks for this
  /// service.
  ///
  ///
  ///
  /// When the service scheduler stops running tasks, it attempts to maintain
  /// balance across the Availability Zones in your cluster using the following
  /// logic:
  ///
  /// *   Sort the container instances by the largest number of running tasks
  /// for this service in the same Availability Zone as the instance. For
  /// example, if zone A has one running service task and zones B and C each
  /// have two, container instances in either zone B or C are considered optimal
  /// for termination.
  ///
  /// *   Stop the task on a container instance in an optimal Availability Zone
  /// (based on the previous steps), favoring container instances with the
  /// largest number of running tasks for this service.
  Future<void> updateService(String service,
      {String cluster,
      int desiredCount,
      String taskDefinition,
      DeploymentConfiguration deploymentConfiguration,
      NetworkConfiguration networkConfiguration,
      String platformVersion,
      bool forceNewDeployment,
      int healthCheckGracePeriodSeconds}) async {}

  /// Modifies which task set in a service is the primary task set. Any
  /// parameters that are updated on the primary task set in a service will
  /// transition to the service. This is used when a service uses the `EXTERNAL`
  /// deployment controller type. For more information, see [Amazon ECS
  /// Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> updateServicePrimaryTaskSet(
      {@required String cluster,
      @required String service,
      @required String primaryTaskSet}) async {}

  /// Modifies a task set. This is used when a service uses the `EXTERNAL`
  /// deployment controller type. For more information, see [Amazon ECS
  /// Deployment
  /// Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<void> updateTaskSet(
      {@required String cluster,
      @required String service,
      @required String taskSet,
      @required Scale scale}) async {}
}

class Attachment {}

class AttachmentStateChange {}

class Attribute {}

class AwsVpcConfiguration {}

class Cluster {}

class ClusterSetting {}

class Container {}

class ContainerDefinition {}

class ContainerDependency {}

class ContainerInstance {}

class ContainerOverride {}

class ContainerStateChange {}

class CreateClusterResponse {}

class CreateServiceResponse {}

class CreateTaskSetResponse {}

class DeleteAccountSettingResponse {}

class DeleteAttributesResponse {}

class DeleteClusterResponse {}

class DeleteServiceResponse {}

class DeleteTaskSetResponse {}

class Deployment {}

class DeploymentConfiguration {}

class DeploymentController {}

class DeregisterContainerInstanceResponse {}

class DeregisterTaskDefinitionResponse {}

class DescribeClustersResponse {}

class DescribeContainerInstancesResponse {}

class DescribeServicesResponse {}

class DescribeTaskDefinitionResponse {}

class DescribeTaskSetsResponse {}

class DescribeTasksResponse {}

class Device {}

class DiscoverPollEndpointResponse {}

class DockerVolumeConfiguration {}

class Failure {}

class FirelensConfiguration {}

class HealthCheck {}

class HostEntry {}

class HostVolumeProperties {}

class InferenceAccelerator {}

class InferenceAcceleratorOverride {}

class KernelCapabilities {}

class KeyValuePair {}

class LinuxParameters {}

class ListAccountSettingsResponse {}

class ListAttributesResponse {}

class ListClustersResponse {}

class ListContainerInstancesResponse {}

class ListServicesResponse {}

class ListTagsForResourceResponse {}

class ListTaskDefinitionFamiliesResponse {}

class ListTaskDefinitionsResponse {}

class ListTasksResponse {}

class LoadBalancer {}

class LogConfiguration {}

class MountPoint {}

class NetworkBinding {}

class NetworkConfiguration {}

class NetworkInterface {}

class PlacementConstraint {}

class PlacementStrategy {}

class PlatformDevice {}

class PortMapping {}

class ProxyConfiguration {}

class PutAccountSettingDefaultResponse {}

class PutAccountSettingResponse {}

class PutAttributesResponse {}

class RegisterContainerInstanceResponse {}

class RegisterTaskDefinitionResponse {}

class RepositoryCredentials {}

class Resource {}

class ResourceRequirement {}

class RunTaskResponse {}

class Scale {}

class Secret {}

class Service {}

class ServiceEvent {}

class ServiceRegistry {}

class Setting {}

class StartTaskResponse {}

class StopTaskResponse {}

class SubmitAttachmentStateChangesResponse {}

class SubmitContainerStateChangeResponse {}

class SubmitTaskStateChangeResponse {}

class SystemControl {}

class Tag {}

class TagResourceResponse {}

class Task {}

class TaskDefinition {}

class TaskDefinitionPlacementConstraint {}

class TaskOverride {}

class TaskSet {}

class Tmpfs {}

class Ulimit {}

class UntagResourceResponse {}

class UpdateClusterSettingsResponse {}

class UpdateContainerAgentResponse {}

class UpdateContainerInstancesStateResponse {}

class UpdateServicePrimaryTaskSetResponse {}

class UpdateServiceResponse {}

class UpdateTaskSetResponse {}

class VersionInfo {}

class Volume {}

class VolumeFrom {}