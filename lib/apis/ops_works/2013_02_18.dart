import 'package:meta/meta.dart';

/// AWS OpsWorks
///
/// Welcome to the _AWS OpsWorks Stacks API Reference_. This guide provides
/// descriptions, syntax, and usage examples for AWS OpsWorks Stacks actions and
/// data types, including common parameters and error codes.
///
/// AWS OpsWorks Stacks is an application management service that provides an
/// integrated experience for overseeing the complete application lifecycle. For
/// information about this product, go to the [AWS
/// OpsWorks](http://aws.amazon.com/opsworks/) details page.
///
///  **SDKs and CLI**
///
/// The most common way to use the AWS OpsWorks Stacks API is by using the AWS
/// Command Line Interface (CLI) or by using one of the AWS SDKs to implement
/// applications in your preferred language. For more information, see:
///
/// *    [AWS
/// CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
///
/// *    [AWS SDK for
/// Java](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/opsworks/AWSOpsWorksClient.html)
///
/// *    [AWS SDK for
/// .NET](https://docs.aws.amazon.com/sdkfornet/latest/apidocs/html/N_Amazon_OpsWorks.htm)
///
/// *    [AWS SDK for PHP
/// 2](https://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.OpsWorks.OpsWorksClient.html)
///
/// *    [AWS SDK for Ruby](http://docs.aws.amazon.com/sdkforruby/api/)
///
/// *    [AWS SDK for
/// Node.js](http://aws.amazon.com/documentation/sdkforjavascript/)
///
/// *    [AWS SDK for
/// Python(Boto)](http://docs.pythonboto.org/en/latest/ref/opsworks.html)
///
///
///  **Endpoints**
///
/// AWS OpsWorks Stacks supports the following endpoints, all HTTPS. You must
/// connect to one of the following endpoints. Stacks can only be accessed or
/// managed within the endpoint in which they are created.
///
/// *   opsworks.us-east-1.amazonaws.com
///
/// *   opsworks.us-east-2.amazonaws.com
///
/// *   opsworks.us-west-1.amazonaws.com
///
/// *   opsworks.us-west-2.amazonaws.com
///
/// *   opsworks.ca-central-1.amazonaws.com (API only; not available in the AWS
/// console)
///
/// *   opsworks.eu-west-1.amazonaws.com
///
/// *   opsworks.eu-west-2.amazonaws.com
///
/// *   opsworks.eu-west-3.amazonaws.com
///
/// *   opsworks.eu-central-1.amazonaws.com
///
/// *   opsworks.ap-northeast-1.amazonaws.com
///
/// *   opsworks.ap-northeast-2.amazonaws.com
///
/// *   opsworks.ap-south-1.amazonaws.com
///
/// *   opsworks.ap-southeast-1.amazonaws.com
///
/// *   opsworks.ap-southeast-2.amazonaws.com
///
/// *   opsworks.sa-east-1.amazonaws.com
///
///
///  **Chef Versions**
///
/// When you call CreateStack, CloneStack, or UpdateStack we recommend you use
/// the `ConfigurationManager` parameter to specify the Chef version. The
/// recommended and default value for Linux stacks is currently 12. Windows
/// stacks use Chef 12.2. For more information, see [Chef
/// Versions](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-chef11.html).
///
///
///
/// You can specify Chef 12, 11.10, or 11.4 for your Linux stack. We recommend
/// migrating your existing Linux stacks to Chef 12 as soon as possible.
class OpsWorksApi {
  /// Assign a registered instance to a layer.
  ///
  /// *   You can assign registered on-premises instances to any layer type.
  ///
  /// *   You can assign registered Amazon EC2 instances only to custom layers.
  ///
  /// *   You cannot use this action with instances that were created with AWS
  /// OpsWorks Stacks.
  ///
  ///
  ///  **Required Permissions**: To use this action, an AWS Identity and Access
  /// Management (IAM) user must have a Manage permissions level for the stack
  /// or an attached policy that explicitly grants permissions. For more
  /// information on user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> assignInstance(
      {@required String instanceId, @required List<String> layerIds}) async {}

  /// Assigns one of the stack's registered Amazon EBS volumes to a specified
  /// instance. The volume must first be registered with the stack by calling
  /// RegisterVolume. After you register the volume, you must call UpdateVolume
  /// to specify a mount point before calling `AssignVolume`. For more
  /// information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> assignVolume(String volumeId, {String instanceId}) async {}

  /// Associates one of the stack's registered Elastic IP addresses with a
  /// specified instance. The address must first be registered with the stack by
  /// calling RegisterElasticIp. For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> associateElasticIp(String elasticIp,
      {String instanceId}) async {}

  /// Attaches an Elastic Load Balancing load balancer to a specified layer. AWS
  /// OpsWorks Stacks does not support Application Load Balancer. You can only
  /// use Classic Load Balancer with AWS OpsWorks Stacks. For more information,
  /// see [Elastic Load
  /// Balancing](https://docs.aws.amazon.com/opsworks/latest/userguide/layers-elb.html).
  ///
  ///  You must create the Elastic Load Balancing instance separately, by using
  /// the Elastic Load Balancing console, API, or CLI. For more information, see
  ///  [Elastic Load Balancing Developer
  /// Guide](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html).
  ///
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> attachElasticLoadBalancer(
      {@required String elasticLoadBalancerName,
      @required String layerId}) async {}

  /// Creates a clone of a specified stack. For more information, see [Clone a
  /// Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-cloning.html).
  /// By default, all parameters are set to the values used by the parent stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> cloneStack(
      {@required String sourceStackId,
      String name,
      String region,
      String vpcId,
      Map<String, String> attributes,
      @required String serviceRoleArn,
      String defaultInstanceProfileArn,
      String defaultOs,
      String hostnameTheme,
      String defaultAvailabilityZone,
      String defaultSubnetId,
      String customJson,
      StackConfigurationManager configurationManager,
      ChefConfiguration chefConfiguration,
      bool useCustomCookbooks,
      bool useOpsworksSecurityGroups,
      Source customCookbooksSource,
      String defaultSshKeyName,
      bool clonePermissions,
      List<String> cloneAppIds,
      String defaultRootDeviceType,
      String agentVersion}) async {}

  /// Creates an app for a specified stack. For more information, see [Creating
  /// Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createApp(
      {@required String stackId,
      String shortname,
      @required String name,
      String description,
      List<DataSource> dataSources,
      @required String type,
      Source appSource,
      List<String> domains,
      bool enableSsl,
      SslConfiguration sslConfiguration,
      Map<String, String> attributes,
      List<EnvironmentVariable> environment}) async {}

  /// Runs deployment or stack commands. For more information, see [Deploying
  /// Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-deploying.html)
  /// and [Run Stack
  /// Commands](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-commands.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createDeployment(
      {@required String stackId,
      String appId,
      List<String> instanceIds,
      List<String> layerIds,
      @required DeploymentCommand command,
      String comment,
      String customJson}) async {}

  /// Creates an instance in a specified stack. For more information, see
  /// [Adding an Instance to a
  /// Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createInstance(
      {@required String stackId,
      @required List<String> layerIds,
      @required String instanceType,
      String autoScalingType,
      String hostname,
      String os,
      String amiId,
      String sshKeyName,
      String availabilityZone,
      String virtualizationType,
      String subnetId,
      String architecture,
      String rootDeviceType,
      List<BlockDeviceMapping> blockDeviceMappings,
      bool installUpdatesOnBoot,
      bool ebsOptimized,
      String agentVersion,
      String tenancy}) async {}

  /// Creates a layer. For more information, see [How to Create a
  /// Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-create.html).
  ///
  ///  You should use **CreateLayer** for noncustom layer types such as PHP App
  /// Server only if the stack does not have an existing layer of that type. A
  /// stack can have at most one instance of each noncustom layer; if you
  /// attempt to create a second instance, **CreateLayer** fails. A stack can
  /// have an arbitrary number of custom layers, so you can call **CreateLayer**
  /// as many times as you like for that layer type.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createLayer(
      {@required String stackId,
      @required String type,
      @required String name,
      @required String shortname,
      Map<String, String> attributes,
      CloudWatchLogsConfiguration cloudWatchLogsConfiguration,
      String customInstanceProfileArn,
      String customJson,
      List<String> customSecurityGroupIds,
      List<String> packages,
      List<VolumeConfiguration> volumeConfigurations,
      bool enableAutoHealing,
      bool autoAssignElasticIps,
      bool autoAssignPublicIps,
      Recipes customRecipes,
      bool installUpdatesOnBoot,
      bool useEbsOptimizedInstances,
      LifecycleEventConfiguration lifecycleEventConfiguration}) async {}

  /// Creates a new stack. For more information, see [Create a New
  /// Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-edit.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createStack(
      {@required String name,
      @required String region,
      String vpcId,
      Map<String, String> attributes,
      @required String serviceRoleArn,
      @required String defaultInstanceProfileArn,
      String defaultOs,
      String hostnameTheme,
      String defaultAvailabilityZone,
      String defaultSubnetId,
      String customJson,
      StackConfigurationManager configurationManager,
      ChefConfiguration chefConfiguration,
      bool useCustomCookbooks,
      bool useOpsworksSecurityGroups,
      Source customCookbooksSource,
      String defaultSshKeyName,
      String defaultRootDeviceType,
      String agentVersion}) async {}

  /// Creates a new user profile.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> createUserProfile(String iamUserArn,
      {String sshUsername,
      String sshPublicKey,
      bool allowSelfManagement}) async {}

  /// Deletes a specified app.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deleteApp(String appId) async {}

  /// Deletes a specified instance, which terminates the associated Amazon EC2
  /// instance. You must stop an instance before you can delete it.
  ///
  /// For more information, see [Deleting
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-delete.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deleteInstance(String instanceId,
      {bool deleteElasticIp, bool deleteVolumes}) async {}

  /// Deletes a specified layer. You must first stop and then delete all
  /// associated instances or unassign registered instances. For more
  /// information, see [How to Delete a
  /// Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-delete.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deleteLayer(String layerId) async {}

  /// Deletes a specified stack. You must first delete all instances, layers,
  /// and apps or deregister registered instances. For more information, see
  /// [Shut Down a
  /// Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-shutting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deleteStack(String stackId) async {}

  /// Deletes a user profile.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deleteUserProfile(String iamUserArn) async {}

  /// Deregisters a specified Amazon ECS cluster from a stack. For more
  /// information, see  [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html#workinglayers-ecscluster-delete).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deregisterEcsCluster(String ecsClusterArn) async {}

  /// Deregisters a specified Elastic IP address. The address can then be
  /// registered by another stack. For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deregisterElasticIp(String elasticIp) async {}

  /// Deregister a registered Amazon EC2 or on-premises instance. This action
  /// removes the instance from the stack and returns it to your control. This
  /// action cannot be used with instances that were created with AWS OpsWorks
  /// Stacks.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deregisterInstance(String instanceId) async {}

  /// Deregisters an Amazon RDS instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deregisterRdsDbInstance(String rdsDbInstanceArn) async {}

  /// Deregisters an Amazon EBS volume. The volume can then be registered by
  /// another stack. For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> deregisterVolume(String volumeId) async {}

  /// Describes the available AWS OpsWorks Stacks agent versions. You must
  /// specify a stack ID or a configuration manager. `DescribeAgentVersions`
  /// returns a list of available agent versions for the specified stack or
  /// configuration manager.
  Future<void> describeAgentVersions(
      {String stackId, StackConfigurationManager configurationManager}) async {}

  /// Requests a description of a specified set of apps.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeApps({String stackId, List<String> appIds}) async {}

  /// Describes the results of specified commands.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeCommands(
      {String deploymentId,
      String instanceId,
      List<String> commandIds}) async {}

  /// Requests a description of a specified set of deployments.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeDeployments(
      {String stackId, String appId, List<String> deploymentIds}) async {}

  /// Describes Amazon ECS clusters that are registered with a stack. If you
  /// specify only a stack ID, you can use the `MaxResults` and `NextToken`
  /// parameters to paginate the response. However, AWS OpsWorks Stacks
  /// currently supports only one cluster per layer, so the result set has a
  /// maximum of one element.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permission. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  Future<void> describeEcsClusters(
      {List<String> ecsClusterArns,
      String stackId,
      String nextToken,
      int maxResults}) async {}

  /// Describes [Elastic IP
  /// addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html).
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeElasticIps(
      {String instanceId, String stackId, List<String> ips}) async {}

  /// Describes a stack's Elastic Load Balancing instances.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeElasticLoadBalancers(
      {String stackId, List<String> layerIds}) async {}

  /// Requests a description of a set of instances.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeInstances(
      {String stackId, String layerId, List<String> instanceIds}) async {}

  /// Requests a description of one or more layers in a specified stack.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeLayers({String stackId, List<String> layerIds}) async {}

  /// Describes load-based auto scaling configurations for specified layers.
  ///
  ///  You must specify at least one of the parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeLoadBasedAutoScaling(List<String> layerIds) async {}

  /// Describes a user's SSH information.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have
  /// self-management enabled or an attached policy that explicitly grants
  /// permissions. For more information about user permissions, see [Managing
  /// User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeMyUserProfile() async {}

  /// Describes the operating systems that are supported by AWS OpsWorks Stacks.
  Future<void> describeOperatingSystems() async {}

  /// Describes the permissions for a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describePermissions({String iamUserArn, String stackId}) async {}

  /// Describe an instance's RAID arrays.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeRaidArrays(
      {String instanceId, String stackId, List<String> raidArrayIds}) async {}

  /// Describes Amazon RDS instances.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  Future<void> describeRdsDbInstances(String stackId,
      {List<String> rdsDbInstanceArns}) async {}

  /// Describes AWS OpsWorks Stacks service errors.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  Future<void> describeServiceErrors(
      {String stackId,
      String instanceId,
      List<String> serviceErrorIds}) async {}

  /// Requests a description of a stack's provisioning parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeStackProvisioningParameters(String stackId) async {}

  /// Describes the number of layers and apps in a specified stack, and the
  /// number of instances in each state, such as `running_setup` or `online`.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeStackSummary(String stackId) async {}

  /// Requests a description of one or more stacks.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeStacks({List<String> stackIds}) async {}

  /// Describes time-based auto scaling configurations for specified instances.
  ///
  ///  You must specify at least one of the parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeTimeBasedAutoScaling(List<String> instanceIds) async {}

  /// Describe specified users.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeUserProfiles({List<String> iamUserArns}) async {}

  /// Describes an instance's Amazon EBS volumes.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> describeVolumes(
      {String instanceId,
      String stackId,
      String raidArrayId,
      List<String> volumeIds}) async {}

  /// Detaches a specified Elastic Load Balancing instance from its layer.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> detachElasticLoadBalancer(
      {@required String elasticLoadBalancerName,
      @required String layerId}) async {}

  /// Disassociates an Elastic IP address from its instance. The address remains
  /// registered with the stack. For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> disassociateElasticIp(String elasticIp) async {}

  /// Gets a generated host name for the specified layer, based on the current
  /// host name theme.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> getHostnameSuggestion(String layerId) async {}

  /// This action can be used only with Windows stacks.
  ///
  /// Grants RDP access to a Windows instance for a specified time period.
  Future<void> grantAccess(String instanceId, {int validForInMinutes}) async {}

  /// Returns a list of tags that are applied to the specified stack or layer.
  Future<void> listTags(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Reboots a specified instance. For more information, see [Starting,
  /// Stopping, and Rebooting
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> rebootInstance(String instanceId) async {}

  /// Registers a specified Amazon ECS cluster with a stack. You can register
  /// only one cluster with a stack. A cluster can be registered with only one
  /// stack. For more information, see  [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see  [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> registerEcsCluster(
      {@required String ecsClusterArn, @required String stackId}) async {}

  /// Registers an Elastic IP address with a specified stack. An address can be
  /// registered with only one stack at a time. If the address is already
  /// registered, you must first deregister it by calling DeregisterElasticIp.
  /// For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> registerElasticIp(
      {@required String elasticIp, @required String stackId}) async {}

  /// Registers instances that were created outside of AWS OpsWorks Stacks with
  /// a specified stack.
  ///
  ///  We do not recommend using this action to register instances. The complete
  /// registration operation includes two tasks: installing the AWS OpsWorks
  /// Stacks agent on the instance, and registering the instance with the stack.
  /// `RegisterInstance` handles only the second step. You should instead use
  /// the AWS CLI `register` command, which performs the entire registration
  /// operation. For more information, see  [Registering an Instance with an AWS
  /// OpsWorks Stacks
  /// Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register.html).
  ///
  ///
  /// Registered instances have the same requirements as instances that are
  /// created by using the CreateInstance API. For example, registered instances
  /// must be running a supported Linux-based operating system, and they must
  /// have a supported instance type. For more information about requirements
  /// for instances that you want to register, see  [Preparing the
  /// Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register-registering-preparer.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> registerInstance(String stackId,
      {String hostname,
      String publicIp,
      String privateIp,
      String rsaPublicKey,
      String rsaPublicKeyFingerprint,
      InstanceIdentity instanceIdentity}) async {}

  /// Registers an Amazon RDS instance with a stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> registerRdsDbInstance(
      {@required String stackId,
      @required String rdsDbInstanceArn,
      @required String dbUser,
      @required String dbPassword}) async {}

  /// Registers an Amazon EBS volume with a specified stack. A volume can be
  /// registered with only one stack at a time. If the volume is already
  /// registered, you must first deregister it by calling DeregisterVolume. For
  /// more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> registerVolume(String stackId, {String ec2VolumeId}) async {}

  /// Specify the load-based auto scaling configuration for a specified layer.
  /// For more information, see [Managing Load with Time-based and Load-based
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html).
  ///
  ///  To use load-based auto scaling, you must create a set of load-based auto
  /// scaling instances. Load-based auto scaling operates only on the instances
  /// from that set, so you must ensure that you have created enough instances
  /// to handle the maximum anticipated load.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> setLoadBasedAutoScaling(String layerId,
      {bool enable,
      AutoScalingThresholds upScaling,
      AutoScalingThresholds downScaling}) async {}

  /// Specifies a user's permissions. For more information, see [Security and
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/workingsecurity.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> setPermission(
      {@required String stackId,
      @required String iamUserArn,
      bool allowSsh,
      bool allowSudo,
      String level}) async {}

  /// Specify the time-based auto scaling configuration for a specified
  /// instance. For more information, see [Managing Load with Time-based and
  /// Load-based
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> setTimeBasedAutoScaling(String instanceId,
      {WeeklyAutoScalingSchedule autoScalingSchedule}) async {}

  /// Starts a specified instance. For more information, see [Starting,
  /// Stopping, and Rebooting
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> startInstance(String instanceId) async {}

  /// Starts a stack's instances.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> startStack(String stackId) async {}

  /// Stops a specified instance. When you stop a standard instance, the data
  /// disappears and must be reinstalled when you restart the instance. You can
  /// stop an Amazon EBS-backed instance without losing data. For more
  /// information, see [Starting, Stopping, and Rebooting
  /// Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> stopInstance(String instanceId, {bool force}) async {}

  /// Stops a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> stopStack(String stackId) async {}

  /// Apply cost-allocation tags to a specified stack or layer in AWS OpsWorks
  /// Stacks. For more information about how tagging works, see
  /// [Tags](https://docs.aws.amazon.com/opsworks/latest/userguide/tagging.html)
  /// in the AWS OpsWorks User Guide.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Unassigns a registered instance from all layers that are using the
  /// instance. The instance remains in the stack as an unassigned instance, and
  /// can be assigned to another layer as needed. You cannot use this action
  /// with instances that were created with AWS OpsWorks Stacks.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information about user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> unassignInstance(String instanceId) async {}

  /// Unassigns an assigned Amazon EBS volume. The volume remains registered
  /// with the stack. For more information, see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> unassignVolume(String volumeId) async {}

  /// Removes tags from a specified stack or layer.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a specified app.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateApp(String appId,
      {String name,
      String description,
      List<DataSource> dataSources,
      String type,
      Source appSource,
      List<String> domains,
      bool enableSsl,
      SslConfiguration sslConfiguration,
      Map<String, String> attributes,
      List<EnvironmentVariable> environment}) async {}

  /// Updates a registered Elastic IP address's name. For more information, see
  /// [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateElasticIp(String elasticIp, {String name}) async {}

  /// Updates a specified instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateInstance(String instanceId,
      {List<String> layerIds,
      String instanceType,
      String autoScalingType,
      String hostname,
      String os,
      String amiId,
      String sshKeyName,
      String architecture,
      bool installUpdatesOnBoot,
      bool ebsOptimized,
      String agentVersion}) async {}

  /// Updates a specified layer.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateLayer(String layerId,
      {String name,
      String shortname,
      Map<String, String> attributes,
      CloudWatchLogsConfiguration cloudWatchLogsConfiguration,
      String customInstanceProfileArn,
      String customJson,
      List<String> customSecurityGroupIds,
      List<String> packages,
      List<VolumeConfiguration> volumeConfigurations,
      bool enableAutoHealing,
      bool autoAssignElasticIps,
      bool autoAssignPublicIps,
      Recipes customRecipes,
      bool installUpdatesOnBoot,
      bool useEbsOptimizedInstances,
      LifecycleEventConfiguration lifecycleEventConfiguration}) async {}

  /// Updates a user's SSH public key.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have
  /// self-management enabled or an attached policy that explicitly grants
  /// permissions. For more information about user permissions, see [Managing
  /// User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateMyUserProfile({String sshPublicKey}) async {}

  /// Updates an Amazon RDS instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateRdsDbInstance(String rdsDbInstanceArn,
      {String dbUser, String dbPassword}) async {}

  /// Updates a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateStack(String stackId,
      {String name,
      Map<String, String> attributes,
      String serviceRoleArn,
      String defaultInstanceProfileArn,
      String defaultOs,
      String hostnameTheme,
      String defaultAvailabilityZone,
      String defaultSubnetId,
      String customJson,
      StackConfigurationManager configurationManager,
      ChefConfiguration chefConfiguration,
      bool useCustomCookbooks,
      Source customCookbooksSource,
      String defaultSshKeyName,
      String defaultRootDeviceType,
      bool useOpsworksSecurityGroups,
      String agentVersion}) async {}

  /// Updates a specified user profile.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateUserProfile(String iamUserArn,
      {String sshUsername,
      String sshPublicKey,
      bool allowSelfManagement}) async {}

  /// Updates an Amazon EBS volume's name or mount point. For more information,
  /// see [Resource
  /// Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see [Managing User
  /// Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> updateVolume(String volumeId,
      {String name, String mountPoint}) async {}
}

class AgentVersion {}

class App {}

class AutoScalingThresholds {}

class BlockDeviceMapping {}

class ChefConfiguration {}

class CloneStackResult {}

class CloudWatchLogsConfiguration {}

class CloudWatchLogsLogStream {}

class Command {}

class CreateAppResult {}

class CreateDeploymentResult {}

class CreateInstanceResult {}

class CreateLayerResult {}

class CreateStackResult {}

class CreateUserProfileResult {}

class DataSource {}

class Deployment {}

class DeploymentCommand {}

class DescribeAgentVersionsResult {}

class DescribeAppsResult {}

class DescribeCommandsResult {}

class DescribeDeploymentsResult {}

class DescribeEcsClustersResult {}

class DescribeElasticIpsResult {}

class DescribeElasticLoadBalancersResult {}

class DescribeInstancesResult {}

class DescribeLayersResult {}

class DescribeLoadBasedAutoScalingResult {}

class DescribeMyUserProfileResult {}

class DescribeOperatingSystemsResponse {}

class DescribePermissionsResult {}

class DescribeRaidArraysResult {}

class DescribeRdsDbInstancesResult {}

class DescribeServiceErrorsResult {}

class DescribeStackProvisioningParametersResult {}

class DescribeStackSummaryResult {}

class DescribeStacksResult {}

class DescribeTimeBasedAutoScalingResult {}

class DescribeUserProfilesResult {}

class DescribeVolumesResult {}

class EbsBlockDevice {}

class EcsCluster {}

class ElasticIp {}

class ElasticLoadBalancer {}

class EnvironmentVariable {}

class GetHostnameSuggestionResult {}

class GrantAccessResult {}

class Instance {}

class InstanceIdentity {}

class InstancesCount {}

class Layer {}

class LifecycleEventConfiguration {}

class ListTagsResult {}

class LoadBasedAutoScalingConfiguration {}

class OperatingSystem {}

class OperatingSystemConfigurationManager {}

class Permission {}

class RaidArray {}

class RdsDbInstance {}

class Recipes {}

class RegisterEcsClusterResult {}

class RegisterElasticIpResult {}

class RegisterInstanceResult {}

class RegisterVolumeResult {}

class ReportedOs {}

class SelfUserProfile {}

class ServiceError {}

class ShutdownEventConfiguration {}

class Source {}

class SslConfiguration {}

class Stack {}

class StackConfigurationManager {}

class StackSummary {}

class TemporaryCredential {}

class TimeBasedAutoScalingConfiguration {}

class UserProfile {}

class Volume {}

class VolumeConfiguration {}

class WeeklyAutoScalingSchedule {}
