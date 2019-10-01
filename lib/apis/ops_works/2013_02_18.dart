import 'package:meta/meta.dart';

/// AWS OpsWorks
///
/// Welcome to the _AWS OpsWorks Stacks API Reference_. This guide provides
/// descriptions, syntax, and usage examples for AWS OpsWorks Stacks actions and
/// data types, including common parameters and error codes.
///
/// AWS OpsWorks Stacks is an application management service that provides an
/// integrated experience for overseeing the complete application lifecycle. For
/// information about this product, go to the
/// [AWS OpsWorks](http://aws.amazon.com/opsworks/) details page.
///
///  **SDKs and CLI**
///
/// The most common way to use the AWS OpsWorks Stacks API is by using the AWS
/// Command Line Interface (CLI) or by using one of the AWS SDKs to implement
/// applications in your preferred language. For more information, see:
///
/// *
/// [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
///
/// *
/// [AWS SDK for Java](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/opsworks/AWSOpsWorksClient.html)
///
/// *
/// [AWS SDK for .NET](https://docs.aws.amazon.com/sdkfornet/latest/apidocs/html/N_Amazon_OpsWorks.htm)
///
/// *
/// [AWS SDK for PHP 2](https://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.OpsWorks.OpsWorksClient.html)
///
/// *    [AWS SDK for Ruby](http://docs.aws.amazon.com/sdkforruby/api/)
///
/// *
/// [AWS SDK for Node.js](http://aws.amazon.com/documentation/sdkforjavascript/)
///
/// *
/// [AWS SDK for Python(Boto)](http://docs.pythonboto.org/en/latest/ref/opsworks.html)
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
/// stacks use Chef 12.2. For more information, see
/// [Chef Versions](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-chef11.html).
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
  /// information on user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [layerIds]: The layer ID, which must correspond to a custom layer. You
  /// cannot assign a registered instance to a built-in layer.
  Future<void> assignInstance(
      {@required String instanceId, @required List<String> layerIds}) async {}

  /// Assigns one of the stack's registered Amazon EBS volumes to a specified
  /// instance. The volume must first be registered with the stack by calling
  /// RegisterVolume. After you register the volume, you must call UpdateVolume
  /// to specify a mount point before calling `AssignVolume`. For more
  /// information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [volumeId]: The volume ID.
  ///
  /// [instanceId]: The instance ID.
  Future<void> assignVolume(String volumeId, {String instanceId}) async {}

  /// Associates one of the stack's registered Elastic IP addresses with a
  /// specified instance. The address must first be registered with the stack by
  /// calling RegisterElasticIp. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticIp]: The Elastic IP address.
  ///
  /// [instanceId]: The instance ID.
  Future<void> associateElasticIp(String elasticIp,
      {String instanceId}) async {}

  /// Attaches an Elastic Load Balancing load balancer to a specified layer. AWS
  /// OpsWorks Stacks does not support Application Load Balancer. You can only
  /// use Classic Load Balancer with AWS OpsWorks Stacks. For more information,
  /// see
  /// [Elastic Load Balancing](https://docs.aws.amazon.com/opsworks/latest/userguide/layers-elb.html).
  ///
  ///  You must create the Elastic Load Balancing instance separately, by using
  /// the Elastic Load Balancing console, API, or CLI. For more information, see
  ///
  /// [Elastic Load Balancing Developer Guide](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html).
  ///
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticLoadBalancerName]: The Elastic Load Balancing instance's name.
  ///
  /// [layerId]: The ID of the layer to which the Elastic Load Balancing
  /// instance is to be attached.
  Future<void> attachElasticLoadBalancer(
      {@required String elasticLoadBalancerName,
      @required String layerId}) async {}

  /// Creates a clone of a specified stack. For more information, see
  /// [Clone a Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-cloning.html).
  /// By default, all parameters are set to the values used by the parent stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [sourceStackId]: The source stack ID.
  ///
  /// [name]: The cloned stack name.
  ///
  /// [region]: The cloned stack AWS region, such as "ap-northeast-2". For more
  /// information about AWS regions, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  ///
  /// [vpcId]: The ID of the VPC that the cloned stack is to be launched into.
  /// It must be in the specified region. All instances are launched into this
  /// VPC, and you cannot change the ID later.
  ///
  /// *   If your account supports EC2 Classic, the default value is no VPC.
  ///
  /// *   If your account does not support EC2 Classic, the default value is the
  /// default VPC for the specified region.
  ///
  ///
  /// If the VPC ID corresponds to a default VPC and you have specified either
  /// the `DefaultAvailabilityZone` or the `DefaultSubnetId` parameter only, AWS
  /// OpsWorks Stacks infers the value of the other parameter. If you specify
  /// neither parameter, AWS OpsWorks Stacks sets these parameters to the first
  /// valid Availability Zone for the specified region and the corresponding
  /// default VPC subnet ID, respectively.
  ///
  /// If you specify a nondefault VPC ID, note the following:
  ///
  /// *   It must belong to a VPC in your account that is in the specified
  /// region.
  ///
  /// *   You must specify a value for `DefaultSubnetId`.
  ///
  ///
  /// For more information about how to use AWS OpsWorks Stacks with a VPC, see
  /// [Running a Stack in a VPC](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html).
  /// For more information about default VPC and EC2 Classic, see
  /// [Supported Platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html).
  ///
  /// [attributes]: A list of stack attributes and values as key/value pairs to
  /// be added to the cloned stack.
  ///
  /// [serviceRoleArn]: The stack AWS Identity and Access Management (IAM) role,
  /// which allows AWS OpsWorks Stacks to work with AWS resources on your
  /// behalf. You must set this parameter to the Amazon Resource Name (ARN) for
  /// an existing IAM role. If you create a stack by using the AWS OpsWorks
  /// Stacks console, it creates the role for you. You can obtain an existing
  /// stack's IAM ARN programmatically by calling DescribePermissions. For more
  /// information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  ///
  ///
  /// You must set this parameter to a valid service role ARN or the action will
  /// fail; there is no default value. You can specify the source stack's
  /// service role ARN, if you prefer, but you must do so explicitly.
  ///
  /// [defaultInstanceProfileArn]: The Amazon Resource Name (ARN) of an IAM
  /// profile that is the default profile for all of the stack's EC2 instances.
  /// For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [defaultOs]: The stack's operating system, which must be set to one of the
  /// following.
  ///
  /// *   A supported Linux operating system: An Amazon Linux version, such as
  /// `Amazon Linux 2018.03`, `Amazon Linux 2017.09`, `Amazon Linux 2017.03`,
  /// `Amazon Linux 2016.09`, `Amazon Linux 2016.03`, `Amazon Linux 2015.09`, or
  /// `Amazon Linux 2015.03`.
  ///
  /// *   A supported Ubuntu operating system, such as `Ubuntu 16.04 LTS`,
  /// `Ubuntu 14.04 LTS`, or `Ubuntu 12.04 LTS`.
  ///
  /// *    `CentOS Linux 7`
  ///
  /// *    `Red Hat Enterprise Linux 7`
  ///
  /// *    `Microsoft Windows Server 2012 R2 Base`, `Microsoft Windows Server
  /// 2012 R2 with SQL Server Express`, `Microsoft Windows Server 2012 R2 with
  /// SQL Server Standard`, or `Microsoft Windows Server 2012 R2 with SQL Server
  /// Web`.
  ///
  /// *   A custom AMI: `Custom`. You specify the custom AMI you want to use
  /// when you create instances. For more information about how to use custom
  /// AMIs with OpsWorks, see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  ///
  /// The default option is the parent stack's operating system. For more
  /// information about supported operating systems, see
  /// [AWS OpsWorks Stacks Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  ///
  ///
  ///
  /// You can specify a different Linux operating system for the cloned stack,
  /// but you cannot change from Linux to Windows or Windows to Linux.
  ///
  /// [hostnameTheme]: The stack's host name theme, with spaces are replaced by
  /// underscores. The theme is used to generate host names for the stack's
  /// instances. By default, `HostnameTheme` is set to `Layer_Dependent`, which
  /// creates host names by appending integers to the layer's short name. The
  /// other themes are:
  ///
  /// *    `Baked_Goods`
  ///
  /// *    `Clouds`
  ///
  /// *    `Europe_Cities`
  ///
  /// *    `Fruits`
  ///
  /// *    `Greek_Deities_and_Titans`
  ///
  /// *    `Legendary_creatures_from_Japan`
  ///
  /// *    `Planets_and_Moons`
  ///
  /// *    `Roman_Deities`
  ///
  /// *    `Scottish_Islands`
  ///
  /// *    `US_Cities`
  ///
  /// *    `Wild_Cats`
  ///
  ///
  /// To obtain a generated host name, call `GetHostNameSuggestion`, which
  /// returns a host name based on the current theme.
  ///
  /// [defaultAvailabilityZone]: The cloned stack's default Availability Zone,
  /// which must be in the specified region. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  /// If you also specify a value for `DefaultSubnetId`, the subnet must be in
  /// the same zone. For more information, see the `VpcId` parameter
  /// description.
  ///
  /// [defaultSubnetId]: The stack's default VPC subnet ID. This parameter is
  /// required if you specify a value for the `VpcId` parameter. All instances
  /// are launched into this subnet unless you specify otherwise when you create
  /// the instance. If you also specify a value for `DefaultAvailabilityZone`,
  /// the subnet must be in that zone. For information on default values and
  /// when this parameter is required, see the `VpcId` parameter description.
  ///
  /// [customJson]: A string that contains user-defined, custom JSON. It is used
  /// to override the corresponding default stack configuration JSON values. The
  /// string should be in the following format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information about custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html)
  ///
  /// [configurationManager]: The configuration manager. When you clone a stack
  /// we recommend that you use the configuration manager to specify the Chef
  /// version: 12, 11.10, or 11.4 for Linux stacks, or 12.2 for Windows stacks.
  /// The default value for Linux stacks is currently 12.
  ///
  /// [chefConfiguration]: A `ChefConfiguration` object that specifies whether
  /// to enable Berkshelf and the Berkshelf version on Chef 11.10 stacks. For
  /// more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [useCustomCookbooks]: Whether to use custom cookbooks.
  ///
  /// [useOpsworksSecurityGroups]: Whether to associate the AWS OpsWorks Stacks
  /// built-in security groups with the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default. With
  /// `UseOpsworksSecurityGroups` you can instead provide your own custom
  /// security groups. `UseOpsworksSecurityGroups` has the following settings:
  ///
  /// *   True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it but
  /// you cannot delete the built-in security group.
  ///
  /// *   False - AWS OpsWorks Stacks does not associate built-in security
  /// groups with layers. You must create appropriate Amazon Elastic Compute
  /// Cloud (Amazon EC2) security groups and associate a security group with
  /// each layer that you create. However, you can still manually associate a
  /// built-in security group with a layer on creation; custom security groups
  /// are required only for those layers that need custom settings.
  ///
  ///
  /// For more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [customCookbooksSource]: Contains the information required to retrieve an
  /// app or cookbook from a repository. For more information, see
  /// [Adding Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html)
  /// or
  /// [Cookbooks and Recipes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).
  ///
  /// [defaultSshKeyName]: A default Amazon EC2 key pair name. The default value
  /// is none. If you specify a key pair name, AWS OpsWorks installs the public
  /// key on the instance and you can use the private key with an SSH client to
  /// log in to the instance. For more information, see
  /// [Using SSH to Communicate with an Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html)
  /// and
  /// [Managing SSH Access](https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html).
  /// You can override this setting by specifying a different key pair, or no
  /// key pair, when you
  /// [create an instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html).
  ///
  /// [clonePermissions]: Whether to clone the source stack's permissions.
  ///
  /// [cloneAppIds]: A list of source stack app IDs to be included in the cloned
  /// stack.
  ///
  /// [defaultRootDeviceType]: The default root device type. This value is used
  /// by default for all instances in the cloned stack, but you can override it
  /// when you create an instance. For more information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  ///
  /// [agentVersion]: The default AWS OpsWorks Stacks agent version. You have
  /// the following options:
  ///
  /// *   Auto-update - Set this parameter to `LATEST`. AWS OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  ///
  /// *   Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  ///
  ///
  /// The default setting is `LATEST`. To specify an agent version, you must use
  /// the complete version number, not the abbreviated number shown on the
  /// console. For a list of available agent version numbers, call
  /// DescribeAgentVersions. AgentVersion cannot be set to Chef 12.2.
  ///
  ///
  ///
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
  Future<CloneStackResult> cloneStack(
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
      String agentVersion}) async {
    return CloneStackResult.fromJson({});
  }

  /// Creates an app for a specified stack. For more information, see
  /// [Creating Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [shortname]: The app's short name.
  ///
  /// [name]: The app name.
  ///
  /// [description]: A description of the app.
  ///
  /// [dataSources]: The app's data source.
  ///
  /// [type]: The app type. Each supported type is associated with a particular
  /// layer. For example, PHP applications are associated with a PHP layer. AWS
  /// OpsWorks Stacks deploys an application to those instances that are members
  /// of the corresponding layer. If your app isn't one of the standard types,
  /// or you prefer to implement your own Deploy recipes, specify `other`.
  ///
  /// [appSource]: A `Source` object that specifies the app repository.
  ///
  /// [domains]: The app virtual host settings, with multiple domains separated
  /// by commas. For example: `'www.example.com, example.com'`
  ///
  /// [enableSsl]: Whether to enable SSL for the app.
  ///
  /// [sslConfiguration]: An `SslConfiguration` object with the SSL
  /// configuration.
  ///
  /// [attributes]: One or more user-defined key/value pairs to be added to the
  /// stack attributes.
  ///
  /// [environment]: An array of `EnvironmentVariable` objects that specify
  /// environment variables to be associated with the app. After you deploy the
  /// app, these variables are defined on the associated app server instance.
  /// For more information, see
  /// [Environment Variables](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment).
  ///
  /// There is no specific limit on the number of environment variables.
  /// However, the size of the associated data structure - which includes the
  /// variables' names, values, and protected flag values - cannot exceed 20 KB.
  /// This limit should accommodate most if not all use cases. Exceeding it will
  /// cause an exception with the message, "Environment: is too large (maximum
  /// is 20KB)."
  ///
  ///
  ///
  /// If you have specified one or more environment variables, you cannot modify
  /// the stack's Chef version.
  Future<CreateAppResult> createApp(
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
      List<EnvironmentVariable> environment}) async {
    return CreateAppResult.fromJson({});
  }

  /// Runs deployment or stack commands. For more information, see
  /// [Deploying Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-deploying.html)
  /// and
  /// [Run Stack Commands](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-commands.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [appId]: The app ID. This parameter is required for app deployments, but
  /// not for other deployment commands.
  ///
  /// [instanceIds]: The instance IDs for the deployment targets.
  ///
  /// [layerIds]: The layer IDs for the deployment targets.
  ///
  /// [command]: A `DeploymentCommand` object that specifies the deployment
  /// command and any associated arguments.
  ///
  /// [comment]: A user-defined comment.
  ///
  /// [customJson]: A string that contains user-defined, custom JSON. You can
  /// use this parameter to override some corresponding default stack
  /// configuration JSON values. The string should be in the following format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information about custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html)
  /// and
  /// [Overriding Attributes With Custom JSON](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html).
  Future<CreateDeploymentResult> createDeployment(
      {@required String stackId,
      String appId,
      List<String> instanceIds,
      List<String> layerIds,
      @required DeploymentCommand command,
      String comment,
      String customJson}) async {
    return CreateDeploymentResult.fromJson({});
  }

  /// Creates an instance in a specified stack. For more information, see
  /// [Adding an Instance to a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [layerIds]: An array that contains the instance's layer IDs.
  ///
  /// [instanceType]: The instance type, such as `t2.micro`. For a list of
  /// supported instance types, open the stack in the console, choose
  /// **Instances**, and choose **+ Instance**. The **Size** list contains the
  /// currently supported types. For more information, see
  /// [Instance Families and Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).
  /// The parameter values that you use to specify the various types are in the
  /// **API Name** column of the **Available Instance Types** table.
  ///
  /// [autoScalingType]: For load-based or time-based instances, the type.
  /// Windows stacks can use only time-based instances.
  ///
  /// [hostname]: The instance host name.
  ///
  /// [os]: The instance's operating system, which must be set to one of the
  /// following.
  ///
  /// *   A supported Linux operating system: An Amazon Linux version, such as
  /// `Amazon Linux 2018.03`, `Amazon Linux 2017.09`, `Amazon Linux 2017.03`,
  /// `Amazon Linux 2016.09`, `Amazon Linux 2016.03`, `Amazon Linux 2015.09`, or
  /// `Amazon Linux 2015.03`.
  ///
  /// *   A supported Ubuntu operating system, such as `Ubuntu 16.04 LTS`,
  /// `Ubuntu 14.04 LTS`, or `Ubuntu 12.04 LTS`.
  ///
  /// *    `CentOS Linux 7`
  ///
  /// *    `Red Hat Enterprise Linux 7`
  ///
  /// *   A supported Windows operating system, such as `Microsoft Windows
  /// Server 2012 R2 Base`, `Microsoft Windows Server 2012 R2 with SQL Server
  /// Express`, `Microsoft Windows Server 2012 R2 with SQL Server Standard`, or
  /// `Microsoft Windows Server 2012 R2 with SQL Server Web`.
  ///
  /// *   A custom AMI: `Custom`.
  ///
  ///
  /// For more information about the supported operating systems, see
  /// [AWS OpsWorks Stacks Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to `Custom`, you must use the CreateInstance action's AmiId
  /// parameter to specify the custom AMI that you want to use. Block device
  /// mappings are not supported if the value is `Custom`. For more information
  /// about supported operating systems, see
  /// [Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html)For
  /// more information about how to use custom AMIs with AWS OpsWorks Stacks,
  /// see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  /// [amiId]: A custom AMI ID to be used to create the instance. The AMI should
  /// be based on one of the supported operating systems. For more information,
  /// see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  ///
  ///
  /// If you specify a custom AMI, you must set `Os` to `Custom`.
  ///
  /// [sshKeyName]: The instance's Amazon EC2 key-pair name.
  ///
  /// [availabilityZone]: The instance Availability Zone. For more information,
  /// see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  ///
  /// [virtualizationType]: The instance's virtualization type, `paravirtual` or
  /// `hvm`.
  ///
  /// [subnetId]: The ID of the instance's subnet. If the stack is running in a
  /// VPC, you can use this parameter to override the stack's default subnet ID
  /// value and direct AWS OpsWorks Stacks to launch the instance in a different
  /// subnet.
  ///
  /// [architecture]: The instance architecture. The default option is `x86_64`.
  /// Instance types do not necessarily support both architectures. For a list
  /// of the architectures that are supported by the different instance types,
  /// see
  /// [Instance Families and Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).
  ///
  /// [rootDeviceType]: The instance root device type. For more information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  ///
  /// [blockDeviceMappings]: An array of `BlockDeviceMapping` objects that
  /// specify the instance's block devices. For more information, see
  /// [Block Device Mapping](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html).
  /// Note that block device mappings are not supported for custom AMIs.
  ///
  /// [installUpdatesOnBoot]: Whether to install operating system and package
  /// updates when the instance boots. The default value is `true`. To control
  /// when updates are installed, set this value to `false`. You must then
  /// update your instances manually by using CreateDeployment to run the
  /// `update_dependencies` stack command or by manually running `yum` (Amazon
  /// Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// We strongly recommend using the default value of `true` to ensure that
  /// your instances have the latest security updates.
  ///
  /// [ebsOptimized]: Whether to create an Amazon EBS-optimized instance.
  ///
  /// [agentVersion]: The default AWS OpsWorks Stacks agent version. You have
  /// the following options:
  ///
  /// *    `INHERIT` - Use the stack's default agent version setting.
  ///
  /// *    _version_number_ - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, edit
  /// the instance configuration and specify a new version. AWS OpsWorks Stacks
  /// then automatically installs that version on the instance.
  ///
  ///
  /// The default setting is `INHERIT`. To specify an agent version, you must
  /// use the complete version number, not the abbreviated number shown on the
  /// console. For a list of available agent version numbers, call
  /// DescribeAgentVersions. AgentVersion cannot be set to Chef 12.2.
  ///
  /// [tenancy]: The instance's tenancy option. The default option is no
  /// tenancy, or if the instance is running in a VPC, inherit tenancy settings
  /// from the VPC. The following are valid values for this parameter:
  /// `dedicated`, `default`, or `host`. Because there are costs associated with
  /// changes in tenancy options, we recommend that you research tenancy options
  /// before choosing them for your instances. For more information about
  /// dedicated hosts, see
  /// [Dedicated Hosts Overview](http://aws.amazon.com/ec2/dedicated-hosts/) and
  /// [Amazon EC2 Dedicated Hosts](http://aws.amazon.com/ec2/dedicated-hosts/).
  /// For more information about dedicated instances, see
  /// [Dedicated Instances](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html)
  /// and
  /// [Amazon EC2 Dedicated Instances](http://aws.amazon.com/ec2/purchasing-options/dedicated-instances/).
  Future<CreateInstanceResult> createInstance(
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
      String tenancy}) async {
    return CreateInstanceResult.fromJson({});
  }

  /// Creates a layer. For more information, see
  /// [How to Create a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-create.html).
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
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The layer stack ID.
  ///
  /// [type]: The layer type. A stack cannot have more than one built-in layer
  /// of the same type. It can have any number of custom layers. Built-in layers
  /// are not available in Chef 12 stacks.
  ///
  /// [name]: The layer name, which is used by the console.
  ///
  /// [shortname]: For custom layers only, use this parameter to specify the
  /// layer's short name, which is used internally by AWS OpsWorks Stacks and by
  /// Chef recipes. The short name is also used as the name for the directory
  /// where your app files are installed. It can have a maximum of 200
  /// characters, which are limited to the alphanumeric characters, '-', '_',
  /// and '.'.
  ///
  /// The built-in layers' short names are defined by AWS OpsWorks Stacks. For
  /// more information, see the
  /// [Layer Reference](https://docs.aws.amazon.com/opsworks/latest/userguide/layers.html).
  ///
  /// [attributes]: One or more user-defined key-value pairs to be added to the
  /// stack attributes.
  ///
  /// To create a cluster layer, set the `EcsClusterArn` attribute to the
  /// cluster's ARN.
  ///
  /// [cloudWatchLogsConfiguration]: Specifies CloudWatch Logs configuration
  /// options for the layer. For more information, see CloudWatchLogsLogStream.
  ///
  /// [customInstanceProfileArn]: The ARN of an IAM profile to be used for the
  /// layer's EC2 instances. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [customJson]: A JSON-formatted string containing custom stack
  /// configuration and deployment attributes to be installed on the layer's
  /// instances. For more information, see
  /// [Using Custom JSON](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html).
  /// This feature is supported as of version 1.7.42 of the AWS CLI.
  ///
  /// [customSecurityGroupIds]: An array containing the layer custom security
  /// group IDs.
  ///
  /// [packages]: An array of `Package` objects that describes the layer
  /// packages.
  ///
  /// [volumeConfigurations]: A `VolumeConfigurations` object that describes the
  /// layer's Amazon EBS volumes.
  ///
  /// [enableAutoHealing]: Whether to disable auto healing for the layer.
  ///
  /// [autoAssignElasticIps]: Whether to automatically assign an
  /// [Elastic IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// to the layer's instances. For more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  ///
  /// [autoAssignPublicIps]: For stacks that are running in a VPC, whether to
  /// automatically assign a public IP address to the layer's instances. For
  /// more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  ///
  /// [customRecipes]: A `LayerCustomRecipes` object that specifies the layer
  /// custom recipes.
  ///
  /// [installUpdatesOnBoot]: Whether to install operating system and package
  /// updates when the instance boots. The default value is `true`. To control
  /// when updates are installed, set this value to `false`. You must then
  /// update your instances manually by using CreateDeployment to run the
  /// `update_dependencies` stack command or by manually running `yum` (Amazon
  /// Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// To ensure that your instances have the latest security updates, we
  /// strongly recommend using the default value of `true`.
  ///
  /// [useEbsOptimizedInstances]: Whether to use Amazon EBS-optimized instances.
  ///
  /// [lifecycleEventConfiguration]: A `LifeCycleEventConfiguration` object that
  /// you can use to configure the Shutdown event to specify an execution
  /// timeout and enable or disable Elastic Load Balancer connection draining.
  Future<CreateLayerResult> createLayer(
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
      LifecycleEventConfiguration lifecycleEventConfiguration}) async {
    return CreateLayerResult.fromJson({});
  }

  /// Creates a new stack. For more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-edit.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [name]: The stack name.
  ///
  /// [region]: The stack's AWS region, such as `ap-south-1`. For more
  /// information about Amazon regions, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  ///
  ///
  ///
  /// In the AWS CLI, this API maps to the `--stack-region` parameter. If the
  /// `--stack-region` parameter and the AWS CLI common parameter `--region` are
  /// set to the same value, the stack uses a _regional_ endpoint. If the
  /// `--stack-region` parameter is not set, but the AWS CLI `--region`
  /// parameter is, this also results in a stack with a _regional_ endpoint.
  /// However, if the `--region` parameter is set to `us-east-1`, and the
  /// `--stack-region` parameter is set to one of the following, then the stack
  /// uses a legacy or _classic_ region: `us-west-1, us-west-2, sa-east-1,
  /// eu-central-1, eu-west-1, ap-northeast-1, ap-southeast-1, ap-southeast-2`.
  /// In this case, the actual API endpoint of the stack is in `us-east-1`. Only
  /// the preceding regions are supported as classic regions in the `us-east-1`
  /// API endpoint. Because it is a best practice to choose the regional
  /// endpoint that is closest to where you manage AWS, we recommend that you
  /// use regional endpoints for new stacks. The AWS CLI common `--region`
  /// parameter always specifies a regional API endpoint; it cannot be used to
  /// specify a classic AWS OpsWorks Stacks region.
  ///
  /// [vpcId]: The ID of the VPC that the stack is to be launched into. The VPC
  /// must be in the stack's region. All instances are launched into this VPC.
  /// You cannot change the ID later.
  ///
  /// *   If your account supports EC2-Classic, the default value is `no VPC`.
  ///
  /// *   If your account does not support EC2-Classic, the default value is the
  /// default VPC for the specified region.
  ///
  ///
  /// If the VPC ID corresponds to a default VPC and you have specified either
  /// the `DefaultAvailabilityZone` or the `DefaultSubnetId` parameter only, AWS
  /// OpsWorks Stacks infers the value of the other parameter. If you specify
  /// neither parameter, AWS OpsWorks Stacks sets these parameters to the first
  /// valid Availability Zone for the specified region and the corresponding
  /// default VPC subnet ID, respectively.
  ///
  /// If you specify a nondefault VPC ID, note the following:
  ///
  /// *   It must belong to a VPC in your account that is in the specified
  /// region.
  ///
  /// *   You must specify a value for `DefaultSubnetId`.
  ///
  ///
  /// For more information about how to use AWS OpsWorks Stacks with a VPC, see
  /// [Running a Stack in a VPC](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html).
  /// For more information about default VPC and EC2-Classic, see
  /// [Supported Platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html).
  ///
  /// [attributes]: One or more user-defined key-value pairs to be added to the
  /// stack attributes.
  ///
  /// [serviceRoleArn]: The stack's AWS Identity and Access Management (IAM)
  /// role, which allows AWS OpsWorks Stacks to work with AWS resources on your
  /// behalf. You must set this parameter to the Amazon Resource Name (ARN) for
  /// an existing IAM role. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [defaultInstanceProfileArn]: The Amazon Resource Name (ARN) of an IAM
  /// profile that is the default profile for all of the stack's EC2 instances.
  /// For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [defaultOs]: The stack's default operating system, which is installed on
  /// every instance unless you specify a different operating system when you
  /// create the instance. You can specify one of the following.
  ///
  /// *   A supported Linux operating system: An Amazon Linux version, such as
  /// `Amazon Linux 2018.03`, `Amazon Linux 2017.09`, `Amazon Linux 2017.03`,
  /// `Amazon Linux 2016.09`, `Amazon Linux 2016.03`, `Amazon Linux 2015.09`, or
  /// `Amazon Linux 2015.03`.
  ///
  /// *   A supported Ubuntu operating system, such as `Ubuntu 16.04 LTS`,
  /// `Ubuntu 14.04 LTS`, or `Ubuntu 12.04 LTS`.
  ///
  /// *    `CentOS Linux 7`
  ///
  /// *    `Red Hat Enterprise Linux 7`
  ///
  /// *   A supported Windows operating system, such as `Microsoft Windows
  /// Server 2012 R2 Base`, `Microsoft Windows Server 2012 R2 with SQL Server
  /// Express`, `Microsoft Windows Server 2012 R2 with SQL Server Standard`, or
  /// `Microsoft Windows Server 2012 R2 with SQL Server Web`.
  ///
  /// *   A custom AMI: `Custom`. You specify the custom AMI you want to use
  /// when you create instances. For more information, see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  ///
  /// The default option is the current Amazon Linux version. For more
  /// information about supported operating systems, see
  /// [AWS OpsWorks Stacks Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  ///
  /// [hostnameTheme]: The stack's host name theme, with spaces replaced by
  /// underscores. The theme is used to generate host names for the stack's
  /// instances. By default, `HostnameTheme` is set to `Layer_Dependent`, which
  /// creates host names by appending integers to the layer's short name. The
  /// other themes are:
  ///
  /// *    `Baked_Goods`
  ///
  /// *    `Clouds`
  ///
  /// *    `Europe_Cities`
  ///
  /// *    `Fruits`
  ///
  /// *    `Greek_Deities_and_Titans`
  ///
  /// *    `Legendary_creatures_from_Japan`
  ///
  /// *    `Planets_and_Moons`
  ///
  /// *    `Roman_Deities`
  ///
  /// *    `Scottish_Islands`
  ///
  /// *    `US_Cities`
  ///
  /// *    `Wild_Cats`
  ///
  ///
  /// To obtain a generated host name, call `GetHostNameSuggestion`, which
  /// returns a host name based on the current theme.
  ///
  /// [defaultAvailabilityZone]: The stack's default Availability Zone, which
  /// must be in the specified region. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  /// If you also specify a value for `DefaultSubnetId`, the subnet must be in
  /// the same zone. For more information, see the `VpcId` parameter
  /// description.
  ///
  /// [defaultSubnetId]: The stack's default VPC subnet ID. This parameter is
  /// required if you specify a value for the `VpcId` parameter. All instances
  /// are launched into this subnet unless you specify otherwise when you create
  /// the instance. If you also specify a value for `DefaultAvailabilityZone`,
  /// the subnet must be in that zone. For information on default values and
  /// when this parameter is required, see the `VpcId` parameter description.
  ///
  /// [customJson]: A string that contains user-defined, custom JSON. It can be
  /// used to override the corresponding default stack configuration attribute
  /// values or to pass data to recipes. The string should be in the following
  /// format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information about custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html).
  ///
  /// [configurationManager]: The configuration manager. When you create a stack
  /// we recommend that you use the configuration manager to specify the Chef
  /// version: 12, 11.10, or 11.4 for Linux stacks, or 12.2 for Windows stacks.
  /// The default value for Linux stacks is currently 12.
  ///
  /// [chefConfiguration]: A `ChefConfiguration` object that specifies whether
  /// to enable Berkshelf and the Berkshelf version on Chef 11.10 stacks. For
  /// more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [useCustomCookbooks]: Whether the stack uses custom cookbooks.
  ///
  /// [useOpsworksSecurityGroups]: Whether to associate the AWS OpsWorks Stacks
  /// built-in security groups with the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default. With
  /// `UseOpsworksSecurityGroups` you can instead provide your own custom
  /// security groups. `UseOpsworksSecurityGroups` has the following settings:
  ///
  /// *   True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it, but
  /// you cannot delete the built-in security group.
  ///
  /// *   False - AWS OpsWorks Stacks does not associate built-in security
  /// groups with layers. You must create appropriate EC2 security groups and
  /// associate a security group with each layer that you create. However, you
  /// can still manually associate a built-in security group with a layer on
  /// creation; custom security groups are required only for those layers that
  /// need custom settings.
  ///
  ///
  /// For more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [customCookbooksSource]: Contains the information required to retrieve an
  /// app or cookbook from a repository. For more information, see
  /// [Adding Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html)
  /// or
  /// [Cookbooks and Recipes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).
  ///
  /// [defaultSshKeyName]: A default Amazon EC2 key pair name. The default value
  /// is none. If you specify a key pair name, AWS OpsWorks installs the public
  /// key on the instance and you can use the private key with an SSH client to
  /// log in to the instance. For more information, see
  /// [Using SSH to Communicate with an Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html)
  /// and
  /// [Managing SSH Access](https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html).
  /// You can override this setting by specifying a different key pair, or no
  /// key pair, when you
  /// [create an instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html).
  ///
  /// [defaultRootDeviceType]: The default root device type. This value is the
  /// default for all instances in the stack, but you can override it when you
  /// create an instance. The default option is `instance-store`. For more
  /// information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  ///
  /// [agentVersion]: The default AWS OpsWorks Stacks agent version. You have
  /// the following options:
  ///
  /// *   Auto-update - Set this parameter to `LATEST`. AWS OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  ///
  /// *   Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  ///
  ///
  /// The default setting is the most recent release of the agent. To specify an
  /// agent version, you must use the complete version number, not the
  /// abbreviated number shown on the console. For a list of available agent
  /// version numbers, call DescribeAgentVersions. AgentVersion cannot be set to
  /// Chef 12.2.
  ///
  ///
  ///
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
  Future<CreateStackResult> createStack(
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
      String agentVersion}) async {
    return CreateStackResult.fromJson({});
  }

  /// Creates a new user profile.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [iamUserArn]: The user's IAM ARN; this can also be a federated user's ARN.
  ///
  /// [sshUsername]: The user's SSH user name. The allowable characters are
  /// [a-z], [A-Z], [0-9], '-', and '_'. If the specified name includes other
  /// punctuation marks, AWS OpsWorks Stacks removes them. For example,
  /// `my.name` will be changed to `myname`. If you do not specify an SSH user
  /// name, AWS OpsWorks Stacks generates one from the IAM user name.
  ///
  /// [sshPublicKey]: The user's public SSH key.
  ///
  /// [allowSelfManagement]: Whether users can specify their own SSH public key
  /// through the My Settings page. For more information, see
  /// [Setting an IAM User's Public SSH Key](https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html).
  Future<CreateUserProfileResult> createUserProfile(String iamUserArn,
      {String sshUsername,
      String sshPublicKey,
      bool allowSelfManagement}) async {
    return CreateUserProfileResult.fromJson({});
  }

  /// Deletes a specified app.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [appId]: The app ID.
  Future<void> deleteApp(String appId) async {}

  /// Deletes a specified instance, which terminates the associated Amazon EC2
  /// instance. You must stop an instance before you can delete it.
  ///
  /// For more information, see
  /// [Deleting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-delete.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [deleteElasticIp]: Whether to delete the instance Elastic IP address.
  ///
  /// [deleteVolumes]: Whether to delete the instance's Amazon EBS volumes.
  Future<void> deleteInstance(String instanceId,
      {bool deleteElasticIp, bool deleteVolumes}) async {}

  /// Deletes a specified layer. You must first stop and then delete all
  /// associated instances or unassign registered instances. For more
  /// information, see
  /// [How to Delete a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-delete.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [layerId]: The layer ID.
  Future<void> deleteLayer(String layerId) async {}

  /// Deletes a specified stack. You must first delete all instances, layers,
  /// and apps or deregister registered instances. For more information, see
  /// [Shut Down a Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-shutting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  Future<void> deleteStack(String stackId) async {}

  /// Deletes a user profile.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [iamUserArn]: The user's IAM ARN. This can also be a federated user's ARN.
  Future<void> deleteUserProfile(String iamUserArn) async {}

  /// Deregisters a specified Amazon ECS cluster from a stack. For more
  /// information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html#workinglayers-ecscluster-delete).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [ecsClusterArn]: The cluster's Amazon Resource Number (ARN).
  Future<void> deregisterEcsCluster(String ecsClusterArn) async {}

  /// Deregisters a specified Elastic IP address. The address can then be
  /// registered by another stack. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticIp]: The Elastic IP address.
  Future<void> deregisterElasticIp(String elasticIp) async {}

  /// Deregister a registered Amazon EC2 or on-premises instance. This action
  /// removes the instance from the stack and returns it to your control. This
  /// action cannot be used with instances that were created with AWS OpsWorks
  /// Stacks.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  Future<void> deregisterInstance(String instanceId) async {}

  /// Deregisters an Amazon RDS instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [rdsDbInstanceArn]: The Amazon RDS instance's ARN.
  Future<void> deregisterRdsDbInstance(String rdsDbInstanceArn) async {}

  /// Deregisters an Amazon EBS volume. The volume can then be registered by
  /// another stack. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [volumeId]: The AWS OpsWorks Stacks volume ID, which is the GUID that AWS
  /// OpsWorks Stacks assigned to the instance when you registered the volume
  /// with the stack, not the Amazon EC2 volume ID.
  Future<void> deregisterVolume(String volumeId) async {}

  /// Describes the available AWS OpsWorks Stacks agent versions. You must
  /// specify a stack ID or a configuration manager. `DescribeAgentVersions`
  /// returns a list of available agent versions for the specified stack or
  /// configuration manager.
  ///
  /// [stackId]: The stack ID.
  ///
  /// [configurationManager]: The configuration manager.
  Future<DescribeAgentVersionsResult> describeAgentVersions(
      {String stackId, StackConfigurationManager configurationManager}) async {
    return DescribeAgentVersionsResult.fromJson({});
  }

  /// Requests a description of a specified set of apps.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The app stack ID. If you use this parameter, `DescribeApps`
  /// returns a description of the apps in the specified stack.
  ///
  /// [appIds]: An array of app IDs for the apps to be described. If you use
  /// this parameter, `DescribeApps` returns a description of the specified
  /// apps. Otherwise, it returns a description of every app.
  Future<DescribeAppsResult> describeApps(
      {String stackId, List<String> appIds}) async {
    return DescribeAppsResult.fromJson({});
  }

  /// Describes the results of specified commands.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [deploymentId]: The deployment ID. If you include this parameter,
  /// `DescribeCommands` returns a description of the commands associated with
  /// the specified deployment.
  ///
  /// [instanceId]: The instance ID. If you include this parameter,
  /// `DescribeCommands` returns a description of the commands associated with
  /// the specified instance.
  ///
  /// [commandIds]: An array of command IDs. If you include this parameter,
  /// `DescribeCommands` returns a description of the specified commands.
  /// Otherwise, it returns a description of every command.
  Future<DescribeCommandsResult> describeCommands(
      {String deploymentId, String instanceId, List<String> commandIds}) async {
    return DescribeCommandsResult.fromJson({});
  }

  /// Requests a description of a specified set of deployments.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID. If you include this parameter, the command
  /// returns a description of the commands associated with the specified stack.
  ///
  /// [appId]: The app ID. If you include this parameter, the command returns a
  /// description of the commands associated with the specified app.
  ///
  /// [deploymentIds]: An array of deployment IDs to be described. If you
  /// include this parameter, the command returns a description of the specified
  /// deployments. Otherwise, it returns a description of every deployment.
  Future<DescribeDeploymentsResult> describeDeployments(
      {String stackId, String appId, List<String> deploymentIds}) async {
    return DescribeDeploymentsResult.fromJson({});
  }

  /// Describes Amazon ECS clusters that are registered with a stack. If you
  /// specify only a stack ID, you can use the `MaxResults` and `NextToken`
  /// parameters to paginate the response. However, AWS OpsWorks Stacks
  /// currently supports only one cluster per layer, so the result set has a
  /// maximum of one element.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permission. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// [ecsClusterArns]: A list of ARNs, one for each cluster to be described.
  ///
  /// [stackId]: A stack ID. `DescribeEcsClusters` returns a description of the
  /// cluster that is registered with the stack.
  ///
  /// [nextToken]: If the previous paginated request did not return all of the
  /// remaining results, the response object's`NextToken` parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// `DescribeEcsClusters` again and assign that token to the request object's
  /// `NextToken` parameter. If there are no remaining results, the previous
  /// response object's `NextToken` parameter is set to `null`.
  ///
  /// [maxResults]: To receive a paginated response, use this parameter to
  /// specify the maximum number of results to be returned with a single call.
  /// If the number of available results exceeds this maximum, the response
  /// includes a `NextToken` value that you can assign to the `NextToken`
  /// request parameter to get the next set of results.
  Future<DescribeEcsClustersResult> describeEcsClusters(
      {List<String> ecsClusterArns,
      String stackId,
      String nextToken,
      int maxResults}) async {
    return DescribeEcsClustersResult.fromJson({});
  }

  /// Describes
  /// [Elastic IP addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html).
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID. If you include this parameter,
  /// `DescribeElasticIps` returns a description of the Elastic IP addresses
  /// associated with the specified instance.
  ///
  /// [stackId]: A stack ID. If you include this parameter, `DescribeElasticIps`
  /// returns a description of the Elastic IP addresses that are registered with
  /// the specified stack.
  ///
  /// [ips]: An array of Elastic IP addresses to be described. If you include
  /// this parameter, `DescribeElasticIps` returns a description of the
  /// specified Elastic IP addresses. Otherwise, it returns a description of
  /// every Elastic IP address.
  Future<DescribeElasticIpsResult> describeElasticIps(
      {String instanceId, String stackId, List<String> ips}) async {
    return DescribeElasticIpsResult.fromJson({});
  }

  /// Describes a stack's Elastic Load Balancing instances.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: A stack ID. The action describes the stack's Elastic Load
  /// Balancing instances.
  ///
  /// [layerIds]: A list of layer IDs. The action describes the Elastic Load
  /// Balancing instances for the specified layers.
  Future<DescribeElasticLoadBalancersResult> describeElasticLoadBalancers(
      {String stackId, List<String> layerIds}) async {
    return DescribeElasticLoadBalancersResult.fromJson({});
  }

  /// Requests a description of a set of instances.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: A stack ID. If you use this parameter, `DescribeInstances`
  /// returns descriptions of the instances associated with the specified stack.
  ///
  /// [layerId]: A layer ID. If you use this parameter, `DescribeInstances`
  /// returns descriptions of the instances associated with the specified layer.
  ///
  /// [instanceIds]: An array of instance IDs to be described. If you use this
  /// parameter, `DescribeInstances` returns a description of the specified
  /// instances. Otherwise, it returns a description of every instance.
  Future<DescribeInstancesResult> describeInstances(
      {String stackId, String layerId, List<String> instanceIds}) async {
    return DescribeInstancesResult.fromJson({});
  }

  /// Requests a description of one or more layers in a specified stack.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [layerIds]: An array of layer IDs that specify the layers to be described.
  /// If you omit this parameter, `DescribeLayers` returns a description of
  /// every layer in the specified stack.
  Future<DescribeLayersResult> describeLayers(
      {String stackId, List<String> layerIds}) async {
    return DescribeLayersResult.fromJson({});
  }

  /// Describes load-based auto scaling configurations for specified layers.
  ///
  ///  You must specify at least one of the parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [layerIds]: An array of layer IDs.
  Future<DescribeLoadBasedAutoScalingResult> describeLoadBasedAutoScaling(
      List<String> layerIds) async {
    return DescribeLoadBasedAutoScalingResult.fromJson({});
  }

  /// Describes a user's SSH information.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have
  /// self-management enabled or an attached policy that explicitly grants
  /// permissions. For more information about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<DescribeMyUserProfileResult> describeMyUserProfile() async {
    return DescribeMyUserProfileResult.fromJson({});
  }

  /// Describes the operating systems that are supported by AWS OpsWorks Stacks.
  Future<DescribeOperatingSystemsResponse> describeOperatingSystems() async {
    return DescribeOperatingSystemsResponse.fromJson({});
  }

  /// Describes the permissions for a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [iamUserArn]: The user's IAM ARN. This can also be a federated user's ARN.
  /// For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [stackId]: The stack ID.
  Future<DescribePermissionsResult> describePermissions(
      {String iamUserArn, String stackId}) async {
    return DescribePermissionsResult.fromJson({});
  }

  /// Describe an instance's RAID arrays.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID. If you use this parameter,
  /// `DescribeRaidArrays` returns descriptions of the RAID arrays associated
  /// with the specified instance.
  ///
  /// [stackId]: The stack ID.
  ///
  /// [raidArrayIds]: An array of RAID array IDs. If you use this parameter,
  /// `DescribeRaidArrays` returns descriptions of the specified arrays.
  /// Otherwise, it returns a description of every array.
  Future<DescribeRaidArraysResult> describeRaidArrays(
      {String instanceId, String stackId, List<String> raidArrayIds}) async {
    return DescribeRaidArraysResult.fromJson({});
  }

  /// Describes Amazon RDS instances.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// [stackId]: The ID of the stack with which the instances are registered.
  /// The operation returns descriptions of all registered Amazon RDS instances.
  ///
  /// [rdsDbInstanceArns]: An array containing the ARNs of the instances to be
  /// described.
  Future<DescribeRdsDbInstancesResult> describeRdsDbInstances(String stackId,
      {List<String> rdsDbInstanceArns}) async {
    return DescribeRdsDbInstancesResult.fromJson({});
  }

  /// Describes AWS OpsWorks Stacks service errors.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// [stackId]: The stack ID. If you use this parameter,
  /// `DescribeServiceErrors` returns descriptions of the errors associated with
  /// the specified stack.
  ///
  /// [instanceId]: The instance ID. If you use this parameter,
  /// `DescribeServiceErrors` returns descriptions of the errors associated with
  /// the specified instance.
  ///
  /// [serviceErrorIds]: An array of service error IDs. If you use this
  /// parameter, `DescribeServiceErrors` returns descriptions of the specified
  /// errors. Otherwise, it returns a description of every error.
  Future<DescribeServiceErrorsResult> describeServiceErrors(
      {String stackId, String instanceId, List<String> serviceErrorIds}) async {
    return DescribeServiceErrorsResult.fromJson({});
  }

  /// Requests a description of a stack's provisioning parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  Future<DescribeStackProvisioningParametersResult>
      describeStackProvisioningParameters(String stackId) async {
    return DescribeStackProvisioningParametersResult.fromJson({});
  }

  /// Describes the number of layers and apps in a specified stack, and the
  /// number of instances in each state, such as `running_setup` or `online`.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  Future<DescribeStackSummaryResult> describeStackSummary(
      String stackId) async {
    return DescribeStackSummaryResult.fromJson({});
  }

  /// Requests a description of one or more stacks.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackIds]: An array of stack IDs that specify the stacks to be described.
  /// If you omit this parameter, `DescribeStacks` returns a description of
  /// every stack.
  Future<DescribeStacksResult> describeStacks({List<String> stackIds}) async {
    return DescribeStacksResult.fromJson({});
  }

  /// Describes time-based auto scaling configurations for specified instances.
  ///
  ///  You must specify at least one of the parameters.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceIds]: An array of instance IDs.
  Future<DescribeTimeBasedAutoScalingResult> describeTimeBasedAutoScaling(
      List<String> instanceIds) async {
    return DescribeTimeBasedAutoScalingResult.fromJson({});
  }

  /// Describe specified users.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [iamUserArns]: An array of IAM or federated user ARNs that identify the
  /// users to be described.
  Future<DescribeUserProfilesResult> describeUserProfiles(
      {List<String> iamUserArns}) async {
    return DescribeUserProfilesResult.fromJson({});
  }

  /// Describes an instance's Amazon EBS volumes.
  ///
  ///  This call accepts only one resource-identifying parameter.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID. If you use this parameter,
  /// `DescribeVolumes` returns descriptions of the volumes associated with the
  /// specified instance.
  ///
  /// [stackId]: A stack ID. The action describes the stack's registered Amazon
  /// EBS volumes.
  ///
  /// [raidArrayId]: The RAID array ID. If you use this parameter,
  /// `DescribeVolumes` returns descriptions of the volumes associated with the
  /// specified RAID array.
  ///
  /// [volumeIds]: Am array of volume IDs. If you use this parameter,
  /// `DescribeVolumes` returns descriptions of the specified volumes.
  /// Otherwise, it returns a description of every volume.
  Future<DescribeVolumesResult> describeVolumes(
      {String instanceId,
      String stackId,
      String raidArrayId,
      List<String> volumeIds}) async {
    return DescribeVolumesResult.fromJson({});
  }

  /// Detaches a specified Elastic Load Balancing instance from its layer.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticLoadBalancerName]: The Elastic Load Balancing instance's name.
  ///
  /// [layerId]: The ID of the layer that the Elastic Load Balancing instance is
  /// attached to.
  Future<void> detachElasticLoadBalancer(
      {@required String elasticLoadBalancerName,
      @required String layerId}) async {}

  /// Disassociates an Elastic IP address from its instance. The address remains
  /// registered with the stack. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticIp]: The Elastic IP address.
  Future<void> disassociateElasticIp(String elasticIp) async {}

  /// Gets a generated host name for the specified layer, based on the current
  /// host name theme.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [layerId]: The layer ID.
  Future<GetHostnameSuggestionResult> getHostnameSuggestion(
      String layerId) async {
    return GetHostnameSuggestionResult.fromJson({});
  }

  /// This action can be used only with Windows stacks.
  ///
  /// Grants RDP access to a Windows instance for a specified time period.
  ///
  /// [instanceId]: The instance's AWS OpsWorks Stacks ID.
  ///
  /// [validForInMinutes]: The length of time (in minutes) that the grant is
  /// valid. When the grant expires at the end of this period, the user will no
  /// longer be able to use the credentials to log in. If the user is logged in
  /// at the time, he or she automatically will be logged out.
  Future<GrantAccessResult> grantAccess(String instanceId,
      {int validForInMinutes}) async {
    return GrantAccessResult.fromJson({});
  }

  /// Returns a list of tags that are applied to the specified stack or layer.
  ///
  /// [resourceArn]: The stack or layer's Amazon Resource Number (ARN).
  ///
  /// [maxResults]: Do not use. A validation exception occurs if you add a
  /// `MaxResults` parameter to a `ListTagsRequest` call.
  ///
  /// [nextToken]: Do not use. A validation exception occurs if you add a
  /// `NextToken` parameter to a `ListTagsRequest` call.
  Future<ListTagsResult> listTags(String resourceArn,
      {int maxResults, String nextToken}) async {
    return ListTagsResult.fromJson({});
  }

  /// Reboots a specified instance. For more information, see
  /// [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  Future<void> rebootInstance(String instanceId) async {}

  /// Registers a specified Amazon ECS cluster with a stack. You can register
  /// only one cluster with a stack. A cluster can be registered with only one
  /// stack. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [ecsClusterArn]: The cluster's ARN.
  ///
  /// [stackId]: The stack ID.
  Future<RegisterEcsClusterResult> registerEcsCluster(
      {@required String ecsClusterArn, @required String stackId}) async {
    return RegisterEcsClusterResult.fromJson({});
  }

  /// Registers an Elastic IP address with a specified stack. An address can be
  /// registered with only one stack at a time. If the address is already
  /// registered, you must first deregister it by calling DeregisterElasticIp.
  /// For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticIp]: The Elastic IP address.
  ///
  /// [stackId]: The stack ID.
  Future<RegisterElasticIpResult> registerElasticIp(
      {@required String elasticIp, @required String stackId}) async {
    return RegisterElasticIpResult.fromJson({});
  }

  /// Registers instances that were created outside of AWS OpsWorks Stacks with
  /// a specified stack.
  ///
  ///  We do not recommend using this action to register instances. The complete
  /// registration operation includes two tasks: installing the AWS OpsWorks
  /// Stacks agent on the instance, and registering the instance with the stack.
  /// `RegisterInstance` handles only the second step. You should instead use
  /// the AWS CLI `register` command, which performs the entire registration
  /// operation. For more information, see
  /// [Registering an Instance with an AWS OpsWorks Stacks Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register.html).
  ///
  ///
  /// Registered instances have the same requirements as instances that are
  /// created by using the CreateInstance API. For example, registered instances
  /// must be running a supported Linux-based operating system, and they must
  /// have a supported instance type. For more information about requirements
  /// for instances that you want to register, see
  /// [Preparing the Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register-registering-preparer.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The ID of the stack that the instance is to be registered with.
  ///
  /// [hostname]: The instance's hostname.
  ///
  /// [publicIp]: The instance's public IP address.
  ///
  /// [privateIp]: The instance's private IP address.
  ///
  /// [rsaPublicKey]: The instances public RSA key. This key is used to encrypt
  /// communication between the instance and the service.
  ///
  /// [rsaPublicKeyFingerprint]: The instances public RSA key fingerprint.
  ///
  /// [instanceIdentity]: An InstanceIdentity object that contains the
  /// instance's identity.
  Future<RegisterInstanceResult> registerInstance(String stackId,
      {String hostname,
      String publicIp,
      String privateIp,
      String rsaPublicKey,
      String rsaPublicKeyFingerprint,
      InstanceIdentity instanceIdentity}) async {
    return RegisterInstanceResult.fromJson({});
  }

  /// Registers an Amazon RDS instance with a stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [rdsDbInstanceArn]: The Amazon RDS instance's ARN.
  ///
  /// [dbUser]: The database's master user name.
  ///
  /// [dbPassword]: The database password.
  Future<void> registerRdsDbInstance(
      {@required String stackId,
      @required String rdsDbInstanceArn,
      @required String dbUser,
      @required String dbPassword}) async {}

  /// Registers an Amazon EBS volume with a specified stack. A volume can be
  /// registered with only one stack at a time. If the volume is already
  /// registered, you must first deregister it by calling DeregisterVolume. For
  /// more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [ec2VolumeId]: The Amazon EBS volume ID.
  ///
  /// [stackId]: The stack ID.
  Future<RegisterVolumeResult> registerVolume(String stackId,
      {String ec2VolumeId}) async {
    return RegisterVolumeResult.fromJson({});
  }

  /// Specify the load-based auto scaling configuration for a specified layer.
  /// For more information, see
  /// [Managing Load with Time-based and Load-based Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html).
  ///
  ///  To use load-based auto scaling, you must create a set of load-based auto
  /// scaling instances. Load-based auto scaling operates only on the instances
  /// from that set, so you must ensure that you have created enough instances
  /// to handle the maximum anticipated load.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [layerId]: The layer ID.
  ///
  /// [enable]: Enables load-based auto scaling for the layer.
  ///
  /// [upScaling]: An `AutoScalingThresholds` object with the upscaling
  /// threshold configuration. If the load exceeds these thresholds for a
  /// specified amount of time, AWS OpsWorks Stacks starts a specified number of
  /// instances.
  ///
  /// [downScaling]: An `AutoScalingThresholds` object with the downscaling
  /// threshold configuration. If the load falls below these thresholds for a
  /// specified amount of time, AWS OpsWorks Stacks stops a specified number of
  /// instances.
  Future<void> setLoadBasedAutoScaling(String layerId,
      {bool enable,
      AutoScalingThresholds upScaling,
      AutoScalingThresholds downScaling}) async {}

  /// Specifies a user's permissions. For more information, see
  /// [Security and Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/workingsecurity.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [iamUserArn]: The user's IAM ARN. This can also be a federated user's ARN.
  ///
  /// [allowSsh]: The user is allowed to use SSH to communicate with the
  /// instance.
  ///
  /// [allowSudo]: The user is allowed to use **sudo** to elevate privileges.
  ///
  /// [level]: The user's permission level, which must be set to one of the
  /// following strings. You cannot set your own permissions level.
  ///
  /// *    `deny`
  ///
  /// *    `show`
  ///
  /// *    `deploy`
  ///
  /// *    `manage`
  ///
  /// *    `iam_only`
  ///
  ///
  /// For more information about the permissions associated with these levels,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  Future<void> setPermission(
      {@required String stackId,
      @required String iamUserArn,
      bool allowSsh,
      bool allowSudo,
      String level}) async {}

  /// Specify the time-based auto scaling configuration for a specified
  /// instance. For more information, see
  /// [Managing Load with Time-based and Load-based Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [autoScalingSchedule]: An `AutoScalingSchedule` with the instance
  /// schedule.
  Future<void> setTimeBasedAutoScaling(String instanceId,
      {WeeklyAutoScalingSchedule autoScalingSchedule}) async {}

  /// Starts a specified instance. For more information, see
  /// [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  Future<void> startInstance(String instanceId) async {}

  /// Starts a stack's instances.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  Future<void> startStack(String stackId) async {}

  /// Stops a specified instance. When you stop a standard instance, the data
  /// disappears and must be reinstalled when you restart the instance. You can
  /// stop an Amazon EBS-backed instance without losing data. For more
  /// information, see
  /// [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [force]: Specifies whether to force an instance to stop. If the instance's
  /// root device type is `ebs`, or EBS-backed, adding the `Force` parameter to
  /// the `StopInstances` API call disassociates the AWS OpsWorks Stacks
  /// instance from EC2, and forces deletion of _only_ the OpsWorks Stacks
  /// instance. You must also delete the formerly-associated instance in EC2
  /// after troubleshooting and replacing the AWS OpsWorks Stacks instance with
  /// a new one.
  Future<void> stopInstance(String instanceId, {bool force}) async {}

  /// Stops a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  Future<void> stopStack(String stackId) async {}

  /// Apply cost-allocation tags to a specified stack or layer in AWS OpsWorks
  /// Stacks. For more information about how tagging works, see
  /// [Tags](https://docs.aws.amazon.com/opsworks/latest/userguide/tagging.html)
  /// in the AWS OpsWorks User Guide.
  ///
  /// [resourceArn]: The stack or layer's Amazon Resource Number (ARN).
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to a
  /// stack or layer.
  ///
  /// *   The key cannot be empty.
  ///
  /// *   The key can be a maximum of 127 characters, and can contain only
  /// Unicode letters, numbers, or separators, or the following special
  /// characters: `+ - = . _ : /`
  ///
  /// *   The value can be a maximum 255 characters, and contain only Unicode
  /// letters, numbers, or separators, or the following special characters: `+ -
  /// = . _ : /`
  ///
  /// *   Leading and trailing white spaces are trimmed from both the key and
  /// value.
  ///
  /// *   A maximum of 40 tags is allowed for any resource.
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
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  Future<void> unassignInstance(String instanceId) async {}

  /// Unassigns an assigned Amazon EBS volume. The volume remains registered
  /// with the stack. For more information, see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [volumeId]: The volume ID.
  Future<void> unassignVolume(String volumeId) async {}

  /// Removes tags from a specified stack or layer.
  ///
  /// [resourceArn]: The stack or layer's Amazon Resource Number (ARN).
  ///
  /// [tagKeys]: A list of the keys of tags to be removed from a stack or layer.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a specified app.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [appId]: The app ID.
  ///
  /// [name]: The app name.
  ///
  /// [description]: A description of the app.
  ///
  /// [dataSources]: The app's data sources.
  ///
  /// [type]: The app type.
  ///
  /// [appSource]: A `Source` object that specifies the app repository.
  ///
  /// [domains]: The app's virtual host settings, with multiple domains
  /// separated by commas. For example: `'www.example.com, example.com'`
  ///
  /// [enableSsl]: Whether SSL is enabled for the app.
  ///
  /// [sslConfiguration]: An `SslConfiguration` object with the SSL
  /// configuration.
  ///
  /// [attributes]: One or more user-defined key/value pairs to be added to the
  /// stack attributes.
  ///
  /// [environment]: An array of `EnvironmentVariable` objects that specify
  /// environment variables to be associated with the app. After you deploy the
  /// app, these variables are defined on the associated app server
  /// instances.For more information, see
  /// [Environment Variables](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment).
  ///
  /// There is no specific limit on the number of environment variables.
  /// However, the size of the associated data structure - which includes the
  /// variables' names, values, and protected flag values - cannot exceed 20 KB.
  /// This limit should accommodate most if not all use cases. Exceeding it will
  /// cause an exception with the message, "Environment: is too large (maximum
  /// is 20 KB)."
  ///
  ///
  ///
  /// If you have specified one or more environment variables, you cannot modify
  /// the stack's Chef version.
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
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [elasticIp]: The IP address for which you want to update the name.
  ///
  /// [name]: The new name.
  Future<void> updateElasticIp(String elasticIp, {String name}) async {}

  /// Updates a specified instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [layerIds]: The instance's layer IDs.
  ///
  /// [instanceType]: The instance type, such as `t2.micro`. For a list of
  /// supported instance types, open the stack in the console, choose
  /// **Instances**, and choose **+ Instance**. The **Size** list contains the
  /// currently supported types. For more information, see
  /// [Instance Families and Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).
  /// The parameter values that you use to specify the various types are in the
  /// **API Name** column of the **Available Instance Types** table.
  ///
  /// [autoScalingType]: For load-based or time-based instances, the type.
  /// Windows stacks can use only time-based instances.
  ///
  /// [hostname]: The instance host name.
  ///
  /// [os]: The instance's operating system, which must be set to one of the
  /// following. You cannot update an instance that is using a custom AMI.
  ///
  /// *   A supported Linux operating system: An Amazon Linux version, such as
  /// `Amazon Linux 2018.03`, `Amazon Linux 2017.09`, `Amazon Linux 2017.03`,
  /// `Amazon Linux 2016.09`, `Amazon Linux 2016.03`, `Amazon Linux 2015.09`, or
  /// `Amazon Linux 2015.03`.
  ///
  /// *   A supported Ubuntu operating system, such as `Ubuntu 16.04 LTS`,
  /// `Ubuntu 14.04 LTS`, or `Ubuntu 12.04 LTS`.
  ///
  /// *    `CentOS Linux 7`
  ///
  /// *    `Red Hat Enterprise Linux 7`
  ///
  /// *   A supported Windows operating system, such as `Microsoft Windows
  /// Server 2012 R2 Base`, `Microsoft Windows Server 2012 R2 with SQL Server
  /// Express`, `Microsoft Windows Server 2012 R2 with SQL Server Standard`, or
  /// `Microsoft Windows Server 2012 R2 with SQL Server Web`.
  ///
  ///
  /// For more information about supported operating systems, see
  /// [AWS OpsWorks Stacks Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to `Custom`, you must use the AmiId parameter to specify the
  /// custom AMI that you want to use. For more information about supported
  /// operating systems, see
  /// [Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  /// For more information about how to use custom AMIs with OpsWorks, see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  ///
  ///
  /// You can specify a different Linux operating system for the updated stack,
  /// but you cannot change from Linux to Windows or Windows to Linux.
  ///
  /// [amiId]: The ID of the AMI that was used to create the instance. The value
  /// of this parameter must be the same AMI ID that the instance is already
  /// using. You cannot apply a new AMI to an instance by running
  /// UpdateInstance. UpdateInstance does not work on instances that are using
  /// custom AMIs.
  ///
  /// [sshKeyName]: The instance's Amazon EC2 key name.
  ///
  /// [architecture]: The instance architecture. Instance types do not
  /// necessarily support both architectures. For a list of the architectures
  /// that are supported by the different instance types, see
  /// [Instance Families and Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).
  ///
  /// [installUpdatesOnBoot]: Whether to install operating system and package
  /// updates when the instance boots. The default value is `true`. To control
  /// when updates are installed, set this value to `false`. You must then
  /// update your instances manually by using CreateDeployment to run the
  /// `update_dependencies` stack command or by manually running `yum` (Amazon
  /// Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// We strongly recommend using the default value of `true`, to ensure that
  /// your instances have the latest security updates.
  ///
  /// [ebsOptimized]: This property cannot be updated.
  ///
  /// [agentVersion]: The default AWS OpsWorks Stacks agent version. You have
  /// the following options:
  ///
  /// *    `INHERIT` - Use the stack's default agent version setting.
  ///
  /// *    _version_number_ - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, you
  /// must edit the instance configuration and specify a new version. AWS
  /// OpsWorks Stacks then automatically installs that version on the instance.
  ///
  ///
  /// The default setting is `INHERIT`. To specify an agent version, you must
  /// use the complete version number, not the abbreviated number shown on the
  /// console. For a list of available agent version numbers, call
  /// DescribeAgentVersions.
  ///
  /// AgentVersion cannot be set to Chef 12.2.
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
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [layerId]: The layer ID.
  ///
  /// [name]: The layer name, which is used by the console.
  ///
  /// [shortname]: For custom layers only, use this parameter to specify the
  /// layer's short name, which is used internally by AWS OpsWorks Stacks and by
  /// Chef. The short name is also used as the name for the directory where your
  /// app files are installed. It can have a maximum of 200 characters and must
  /// be in the following format: /A[a-z0-9-_.]+Z/.
  ///
  /// The built-in layers' short names are defined by AWS OpsWorks Stacks. For
  /// more information, see the
  /// [Layer Reference](https://docs.aws.amazon.com/opsworks/latest/userguide/layers.html)
  ///
  /// [attributes]: One or more user-defined key/value pairs to be added to the
  /// stack attributes.
  ///
  /// [cloudWatchLogsConfiguration]: Specifies CloudWatch Logs configuration
  /// options for the layer. For more information, see CloudWatchLogsLogStream.
  ///
  /// [customInstanceProfileArn]: The ARN of an IAM profile to be used for all
  /// of the layer's EC2 instances. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [customJson]: A JSON-formatted string containing custom stack
  /// configuration and deployment attributes to be installed on the layer's
  /// instances. For more information, see
  /// [Using Custom JSON](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html).
  ///
  /// [customSecurityGroupIds]: An array containing the layer's custom security
  /// group IDs.
  ///
  /// [packages]: An array of `Package` objects that describe the layer's
  /// packages.
  ///
  /// [volumeConfigurations]: A `VolumeConfigurations` object that describes the
  /// layer's Amazon EBS volumes.
  ///
  /// [enableAutoHealing]: Whether to disable auto healing for the layer.
  ///
  /// [autoAssignElasticIps]: Whether to automatically assign an
  /// [Elastic IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// to the layer's instances. For more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  ///
  /// [autoAssignPublicIps]: For stacks that are running in a VPC, whether to
  /// automatically assign a public IP address to the layer's instances. For
  /// more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  ///
  /// [customRecipes]: A `LayerCustomRecipes` object that specifies the layer's
  /// custom recipes.
  ///
  /// [installUpdatesOnBoot]: Whether to install operating system and package
  /// updates when the instance boots. The default value is `true`. To control
  /// when updates are installed, set this value to `false`. You must then
  /// update your instances manually by using CreateDeployment to run the
  /// `update_dependencies` stack command or manually running `yum` (Amazon
  /// Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// We strongly recommend using the default value of `true`, to ensure that
  /// your instances have the latest security updates.
  ///
  /// [useEbsOptimizedInstances]: Whether to use Amazon EBS-optimized instances.
  ///
  /// [lifecycleEventConfiguration]:
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
  /// permissions. For more information about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [sshPublicKey]: The user's SSH public key.
  Future<void> updateMyUserProfile({String sshPublicKey}) async {}

  /// Updates an Amazon RDS instance.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [rdsDbInstanceArn]: The Amazon RDS instance's ARN.
  ///
  /// [dbUser]: The master user name.
  ///
  /// [dbPassword]: The database password.
  Future<void> updateRdsDbInstance(String rdsDbInstanceArn,
      {String dbUser, String dbPassword}) async {}

  /// Updates a specified stack.
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [stackId]: The stack ID.
  ///
  /// [name]: The stack's new name.
  ///
  /// [attributes]: One or more user-defined key-value pairs to be added to the
  /// stack attributes.
  ///
  /// [serviceRoleArn]: Do not use this parameter. You cannot update a stack's
  /// service role.
  ///
  /// [defaultInstanceProfileArn]: The ARN of an IAM profile that is the default
  /// profile for all of the stack's EC2 instances. For more information about
  /// IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  ///
  /// [defaultOs]: The stack's operating system, which must be set to one of the
  /// following:
  ///
  /// *   A supported Linux operating system: An Amazon Linux version, such as
  /// `Amazon Linux 2018.03`, `Amazon Linux 2017.09`, `Amazon Linux 2017.03`,
  /// `Amazon Linux 2016.09`, `Amazon Linux 2016.03`, `Amazon Linux 2015.09`, or
  /// `Amazon Linux 2015.03`.
  ///
  /// *   A supported Ubuntu operating system, such as `Ubuntu 16.04 LTS`,
  /// `Ubuntu 14.04 LTS`, or `Ubuntu 12.04 LTS`.
  ///
  /// *    `CentOS Linux 7`
  ///
  /// *    `Red Hat Enterprise Linux 7`
  ///
  /// *   A supported Windows operating system, such as `Microsoft Windows
  /// Server 2012 R2 Base`, `Microsoft Windows Server 2012 R2 with SQL Server
  /// Express`, `Microsoft Windows Server 2012 R2 with SQL Server Standard`, or
  /// `Microsoft Windows Server 2012 R2 with SQL Server Web`.
  ///
  /// *   A custom AMI: `Custom`. You specify the custom AMI you want to use
  /// when you create instances. For more information about how to use custom
  /// AMIs with OpsWorks, see
  /// [Using Custom AMIs](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html).
  ///
  ///
  /// The default option is the stack's current operating system. For more
  /// information about supported operating systems, see
  /// [AWS OpsWorks Stacks Operating Systems](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html).
  ///
  /// [hostnameTheme]: The stack's new host name theme, with spaces replaced by
  /// underscores. The theme is used to generate host names for the stack's
  /// instances. By default, `HostnameTheme` is set to `Layer_Dependent`, which
  /// creates host names by appending integers to the layer's short name. The
  /// other themes are:
  ///
  /// *    `Baked_Goods`
  ///
  /// *    `Clouds`
  ///
  /// *    `Europe_Cities`
  ///
  /// *    `Fruits`
  ///
  /// *    `Greek_Deities_and_Titans`
  ///
  /// *    `Legendary_creatures_from_Japan`
  ///
  /// *    `Planets_and_Moons`
  ///
  /// *    `Roman_Deities`
  ///
  /// *    `Scottish_Islands`
  ///
  /// *    `US_Cities`
  ///
  /// *    `Wild_Cats`
  ///
  ///
  /// To obtain a generated host name, call `GetHostNameSuggestion`, which
  /// returns a host name based on the current theme.
  ///
  /// [defaultAvailabilityZone]: The stack's default Availability Zone, which
  /// must be in the stack's region. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  /// If you also specify a value for `DefaultSubnetId`, the subnet must be in
  /// the same zone. For more information, see CreateStack.
  ///
  /// [defaultSubnetId]: The stack's default VPC subnet ID. This parameter is
  /// required if you specify a value for the `VpcId` parameter. All instances
  /// are launched into this subnet unless you specify otherwise when you create
  /// the instance. If you also specify a value for `DefaultAvailabilityZone`,
  /// the subnet must be in that zone. For information on default values and
  /// when this parameter is required, see the `VpcId` parameter description.
  ///
  /// [customJson]: A string that contains user-defined, custom JSON. It can be
  /// used to override the corresponding default stack configuration JSON values
  /// or to pass data to recipes. The string should be in the following format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information about custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html).
  ///
  /// [configurationManager]: The configuration manager. When you update a
  /// stack, we recommend that you use the configuration manager to specify the
  /// Chef version: 12, 11.10, or 11.4 for Linux stacks, or 12.2 for Windows
  /// stacks. The default value for Linux stacks is currently 12.
  ///
  /// [chefConfiguration]: A `ChefConfiguration` object that specifies whether
  /// to enable Berkshelf and the Berkshelf version on Chef 11.10 stacks. For
  /// more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [useCustomCookbooks]: Whether the stack uses custom cookbooks.
  ///
  /// [customCookbooksSource]: Contains the information required to retrieve an
  /// app or cookbook from a repository. For more information, see
  /// [Adding Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html)
  /// or
  /// [Cookbooks and Recipes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).
  ///
  /// [defaultSshKeyName]: A default Amazon EC2 key-pair name. The default value
  /// is `none`. If you specify a key-pair name, AWS OpsWorks Stacks installs
  /// the public key on the instance and you can use the private key with an SSH
  /// client to log in to the instance. For more information, see
  /// [Using SSH to Communicate with an Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html)
  /// and
  /// [Managing SSH Access](https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html).
  /// You can override this setting by specifying a different key pair, or no
  /// key pair, when you
  /// [create an instance](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html).
  ///
  /// [defaultRootDeviceType]: The default root device type. This value is used
  /// by default for all instances in the stack, but you can override it when
  /// you create an instance. For more information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  ///
  /// [useOpsworksSecurityGroups]: Whether to associate the AWS OpsWorks Stacks
  /// built-in security groups with the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default.
  /// `UseOpsworksSecurityGroups` allows you to provide your own custom security
  /// groups instead of using the built-in groups. `UseOpsworksSecurityGroups`
  /// has the following settings:
  ///
  /// *   True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it, but
  /// you cannot delete the built-in security group.
  ///
  /// *   False - AWS OpsWorks Stacks does not associate built-in security
  /// groups with layers. You must create appropriate EC2 security groups and
  /// associate a security group with each layer that you create. However, you
  /// can still manually associate a built-in security group with a layer on.
  /// Custom security groups are required only for those layers that need custom
  /// settings.
  ///
  ///
  /// For more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  ///
  /// [agentVersion]: The default AWS OpsWorks Stacks agent version. You have
  /// the following options:
  ///
  /// *   Auto-update - Set this parameter to `LATEST`. AWS OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  ///
  /// *   Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  ///
  ///
  /// The default setting is `LATEST`. To specify an agent version, you must use
  /// the complete version number, not the abbreviated number shown on the
  /// console. For a list of available agent version numbers, call
  /// DescribeAgentVersions. AgentVersion cannot be set to Chef 12.2.
  ///
  ///
  ///
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
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
  /// about user permissions, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [iamUserArn]: The user IAM ARN. This can also be a federated user's ARN.
  ///
  /// [sshUsername]: The user's SSH user name. The allowable characters are
  /// [a-z], [A-Z], [0-9], '-', and '_'. If the specified name includes other
  /// punctuation marks, AWS OpsWorks Stacks removes them. For example,
  /// `my.name` will be changed to `myname`. If you do not specify an SSH user
  /// name, AWS OpsWorks Stacks generates one from the IAM user name.
  ///
  /// [sshPublicKey]: The user's new SSH public key.
  ///
  /// [allowSelfManagement]: Whether users can specify their own SSH public key
  /// through the My Settings page. For more information, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html).
  Future<void> updateUserProfile(String iamUserArn,
      {String sshUsername,
      String sshPublicKey,
      bool allowSelfManagement}) async {}

  /// Updates an Amazon EBS volume's name or mount point. For more information,
  /// see
  /// [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html).
  ///
  ///  **Required Permissions**: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).
  ///
  /// [volumeId]: The volume ID.
  ///
  /// [name]: The new name.
  ///
  /// [mountPoint]: The new mount point.
  Future<void> updateVolume(String volumeId,
      {String name, String mountPoint}) async {}
}

/// Describes an agent version.
class AgentVersion {
  /// The agent version.
  final String version;

  /// The configuration manager.
  final StackConfigurationManager configurationManager;

  AgentVersion({
    this.version,
    this.configurationManager,
  });
  static AgentVersion fromJson(Map<String, dynamic> json) => AgentVersion();
}

/// A description of the app.
class App {
  /// The app ID.
  final String appId;

  /// The app stack ID.
  final String stackId;

  /// The app's short name.
  final String shortname;

  /// The app name.
  final String name;

  /// A description of the app.
  final String description;

  /// The app's data sources.
  final List<DataSource> dataSources;

  /// The app type.
  final String type;

  /// A `Source` object that describes the app repository.
  final Source appSource;

  /// The app vhost settings with multiple domains separated by commas. For
  /// example: `'www.example.com, example.com'`
  final List<String> domains;

  /// Whether to enable SSL for the app.
  final bool enableSsl;

  /// An `SslConfiguration` object with the SSL configuration.
  final SslConfiguration sslConfiguration;

  /// The stack attributes.
  final Map<String, String> attributes;

  /// When the app was created.
  final String createdAt;

  /// An array of `EnvironmentVariable` objects that specify environment
  /// variables to be associated with the app. After you deploy the app, these
  /// variables are defined on the associated app server instances. For more
  /// information, see
  /// [Environment Variables](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment).
  ///
  ///
  ///
  /// There is no specific limit on the number of environment variables.
  /// However, the size of the associated data structure - which includes the
  /// variable names, values, and protected flag values - cannot exceed 20 KB.
  /// This limit should accommodate most if not all use cases, but if you do
  /// exceed it, you will cause an exception (API) with an "Environment: is too
  /// large (maximum is 20 KB)" message.
  final List<EnvironmentVariable> environment;

  App({
    this.appId,
    this.stackId,
    this.shortname,
    this.name,
    this.description,
    this.dataSources,
    this.type,
    this.appSource,
    this.domains,
    this.enableSsl,
    this.sslConfiguration,
    this.attributes,
    this.createdAt,
    this.environment,
  });
  static App fromJson(Map<String, dynamic> json) => App();
}

/// Describes a load-based auto scaling upscaling or downscaling threshold
/// configuration, which specifies when AWS OpsWorks Stacks starts or stops
/// load-based instances.
class AutoScalingThresholds {
  /// The number of instances to add or remove when the load exceeds a
  /// threshold.
  final int instanceCount;

  /// The amount of time, in minutes, that the load must exceed a threshold
  /// before more instances are added or removed.
  final int thresholdsWaitTime;

  /// The amount of time (in minutes) after a scaling event occurs that AWS
  /// OpsWorks Stacks should ignore metrics and suppress additional scaling
  /// events. For example, AWS OpsWorks Stacks adds new instances following an
  /// upscaling event but the instances won't start reducing the load until they
  /// have been booted and configured. There is no point in raising additional
  /// scaling events during that operation, which typically takes several
  /// minutes. `IgnoreMetricsTime` allows you to direct AWS OpsWorks Stacks to
  /// suppress scaling events long enough to get the new instances online.
  final int ignoreMetricsTime;

  /// The CPU utilization threshold, as a percent of the available CPU. A value
  /// of -1 disables the threshold.
  final double cpuThreshold;

  /// The memory utilization threshold, as a percent of the available memory. A
  /// value of -1 disables the threshold.
  final double memoryThreshold;

  /// The load threshold. A value of -1 disables the threshold. For more
  /// information about how load is computed, see
  /// [Load (computing)](http://en.wikipedia.org/wiki/Load_%28computing%29).
  final double loadThreshold;

  /// Custom Cloudwatch auto scaling alarms, to be used as thresholds. This
  /// parameter takes a list of up to five alarm names, which are case sensitive
  /// and must be in the same region as the stack.
  ///
  ///
  ///
  /// To use custom alarms, you must update your service role to allow
  /// `cloudwatch:DescribeAlarms`. You can either have AWS OpsWorks Stacks
  /// update the role for you when you first use this feature or you can edit
  /// the role manually. For more information, see
  /// [Allowing AWS OpsWorks Stacks to Act on Your Behalf](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-servicerole.html).
  final List<String> alarms;

  AutoScalingThresholds({
    this.instanceCount,
    this.thresholdsWaitTime,
    this.ignoreMetricsTime,
    this.cpuThreshold,
    this.memoryThreshold,
    this.loadThreshold,
    this.alarms,
  });
  static AutoScalingThresholds fromJson(Map<String, dynamic> json) =>
      AutoScalingThresholds();
}

/// Describes a block device mapping. This data type maps directly to the Amazon
/// EC2
/// [BlockDeviceMapping](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html)
/// data type.
class BlockDeviceMapping {
  /// The device name that is exposed to the instance, such as `/dev/sdh`. For
  /// the root device, you can use the explicit device name or you can set this
  /// parameter to `ROOT_DEVICE` and AWS OpsWorks Stacks will provide the
  /// correct device name.
  final String deviceName;

  /// Suppresses the specified device included in the AMI's block device
  /// mapping.
  final String noDevice;

  /// The virtual device name. For more information, see
  /// [BlockDeviceMapping](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html).
  final String virtualName;

  /// An `EBSBlockDevice` that defines how to configure an Amazon EBS volume
  /// when the instance is launched.
  final EbsBlockDevice ebs;

  BlockDeviceMapping({
    this.deviceName,
    this.noDevice,
    this.virtualName,
    this.ebs,
  });
  static BlockDeviceMapping fromJson(Map<String, dynamic> json) =>
      BlockDeviceMapping();
}

/// Describes the Chef configuration.
class ChefConfiguration {
  /// Whether to enable Berkshelf.
  final bool manageBerkshelf;

  /// The Berkshelf version.
  final String berkshelfVersion;

  ChefConfiguration({
    this.manageBerkshelf,
    this.berkshelfVersion,
  });
  static ChefConfiguration fromJson(Map<String, dynamic> json) =>
      ChefConfiguration();
}

/// Contains the response to a `CloneStack` request.
class CloneStackResult {
  /// The cloned stack ID.
  final String stackId;

  CloneStackResult({
    this.stackId,
  });
  static CloneStackResult fromJson(Map<String, dynamic> json) =>
      CloneStackResult();
}

/// Describes the Amazon CloudWatch logs configuration for a layer.
class CloudWatchLogsConfiguration {
  /// Whether CloudWatch Logs is enabled for a layer.
  final bool enabled;

  /// A list of configuration options for CloudWatch Logs.
  final List<CloudWatchLogsLogStream> logStreams;

  CloudWatchLogsConfiguration({
    this.enabled,
    this.logStreams,
  });
  static CloudWatchLogsConfiguration fromJson(Map<String, dynamic> json) =>
      CloudWatchLogsConfiguration();
}

/// Describes the Amazon CloudWatch logs configuration for a layer. For detailed
/// information about members of this data type, see the
/// [CloudWatch Logs Agent Reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html).
class CloudWatchLogsLogStream {
  /// Specifies the destination log group. A log group is created automatically
  /// if it doesn't already exist. Log group names can be between 1 and 512
  /// characters long. Allowed characters include a-z, A-Z, 0-9, '_'
  /// (underscore), '-' (hyphen), '/' (forward slash), and '.' (period).
  final String logGroupName;

  /// Specifies how the time stamp is extracted from logs. For more information,
  /// see the
  /// [CloudWatch Logs Agent Reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html).
  final String datetimeFormat;

  /// Specifies the time zone of log event time stamps.
  final String timeZone;

  /// Specifies log files that you want to push to CloudWatch Logs.
  ///
  ///  `File` can point to a specific file or multiple files (by using wild card
  /// characters such as `/var/log/system.log*`). Only the latest file is pushed
  /// to CloudWatch Logs, based on file modification time. We recommend that you
  /// use wild card characters to specify a series of files of the same type,
  /// such as `access_log.2014-06-01-01`, `access_log.2014-06-01-02`, and so on
  /// by using a pattern like `access_log.*`. Don't use a wildcard to match
  /// multiple file types, such as `access_log_80` and `access_log_443`. To
  /// specify multiple, different file types, add another log stream entry to
  /// the configuration file, so that each log file type is stored in a
  /// different log group.
  ///
  /// Zipped files are not supported.
  final String file;

  /// Specifies the range of lines for identifying a file. The valid values are
  /// one number, or two dash-delimited numbers, such as '1', '2-5'. The default
  /// value is '1', meaning the first line is used to calculate the fingerprint.
  /// Fingerprint lines are not sent to CloudWatch Logs unless all specified
  /// lines are available.
  final String fileFingerprintLines;

  /// Specifies the pattern for identifying the start of a log message.
  final String multiLineStartPattern;

  /// Specifies where to start to read data (start_of_file or end_of_file). The
  /// default is start_of_file. This setting is only used if there is no state
  /// persisted for that log stream.
  final String initialPosition;

  /// Specifies the encoding of the log file so that the file can be read
  /// correctly. The default is `utf_8`. Encodings supported by Python
  /// `codecs.decode()` can be used here.
  final String encoding;

  /// Specifies the time duration for the batching of log events. The minimum
  /// value is 5000ms and default value is 5000ms.
  final int bufferDuration;

  /// Specifies the max number of log events in a batch, up to 10000. The
  /// default value is 1000.
  final int batchCount;

  /// Specifies the maximum size of log events in a batch, in bytes, up to
  /// 1048576 bytes. The default value is 32768 bytes. This size is calculated
  /// as the sum of all event messages in UTF-8, plus 26 bytes for each log
  /// event.
  final int batchSize;

  CloudWatchLogsLogStream({
    this.logGroupName,
    this.datetimeFormat,
    this.timeZone,
    this.file,
    this.fileFingerprintLines,
    this.multiLineStartPattern,
    this.initialPosition,
    this.encoding,
    this.bufferDuration,
    this.batchCount,
    this.batchSize,
  });
  static CloudWatchLogsLogStream fromJson(Map<String, dynamic> json) =>
      CloudWatchLogsLogStream();
}

/// Describes a command.
class Command {
  /// The command ID.
  final String commandId;

  /// The ID of the instance where the command was executed.
  final String instanceId;

  /// The command deployment ID.
  final String deploymentId;

  /// Date and time when the command was run.
  final String createdAt;

  /// Date and time when the command was acknowledged.
  final String acknowledgedAt;

  /// Date when the command completed.
  final String completedAt;

  /// The command status:
  ///
  /// *   failed
  ///
  /// *   successful
  ///
  /// *   skipped
  ///
  /// *   pending
  final String status;

  /// The command exit code.
  final int exitCode;

  /// The URL of the command log.
  final String logUrl;

  /// The command type:
  ///
  /// *    `configure`
  ///
  /// *    `deploy`
  ///
  /// *    `execute_recipes`
  ///
  /// *    `install_dependencies`
  ///
  /// *    `restart`
  ///
  /// *    `rollback`
  ///
  /// *    `setup`
  ///
  /// *    `start`
  ///
  /// *    `stop`
  ///
  /// *    `undeploy`
  ///
  /// *    `update_custom_cookbooks`
  ///
  /// *    `update_dependencies`
  final String type;

  Command({
    this.commandId,
    this.instanceId,
    this.deploymentId,
    this.createdAt,
    this.acknowledgedAt,
    this.completedAt,
    this.status,
    this.exitCode,
    this.logUrl,
    this.type,
  });
  static Command fromJson(Map<String, dynamic> json) => Command();
}

/// Contains the response to a `CreateApp` request.
class CreateAppResult {
  /// The app ID.
  final String appId;

  CreateAppResult({
    this.appId,
  });
  static CreateAppResult fromJson(Map<String, dynamic> json) =>
      CreateAppResult();
}

/// Contains the response to a `CreateDeployment` request.
class CreateDeploymentResult {
  /// The deployment ID, which can be used with other requests to identify the
  /// deployment.
  final String deploymentId;

  CreateDeploymentResult({
    this.deploymentId,
  });
  static CreateDeploymentResult fromJson(Map<String, dynamic> json) =>
      CreateDeploymentResult();
}

/// Contains the response to a `CreateInstance` request.
class CreateInstanceResult {
  /// The instance ID.
  final String instanceId;

  CreateInstanceResult({
    this.instanceId,
  });
  static CreateInstanceResult fromJson(Map<String, dynamic> json) =>
      CreateInstanceResult();
}

/// Contains the response to a `CreateLayer` request.
class CreateLayerResult {
  /// The layer ID.
  final String layerId;

  CreateLayerResult({
    this.layerId,
  });
  static CreateLayerResult fromJson(Map<String, dynamic> json) =>
      CreateLayerResult();
}

/// Contains the response to a `CreateStack` request.
class CreateStackResult {
  /// The stack ID, which is an opaque string that you use to identify the stack
  /// when performing actions such as `DescribeStacks`.
  final String stackId;

  CreateStackResult({
    this.stackId,
  });
  static CreateStackResult fromJson(Map<String, dynamic> json) =>
      CreateStackResult();
}

/// Contains the response to a `CreateUserProfile` request.
class CreateUserProfileResult {
  /// The user's IAM ARN.
  final String iamUserArn;

  CreateUserProfileResult({
    this.iamUserArn,
  });
  static CreateUserProfileResult fromJson(Map<String, dynamic> json) =>
      CreateUserProfileResult();
}

/// Describes an app's data source.
class DataSource {
  /// The data source's type, `AutoSelectOpsworksMysqlInstance`,
  /// `OpsworksMysqlInstance`, `RdsDbInstance`, or `None`.
  final String type;

  /// The data source's ARN.
  final String arn;

  /// The database name.
  final String databaseName;

  DataSource({
    this.type,
    this.arn,
    this.databaseName,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource();
}

/// Describes a deployment of a stack or app.
class Deployment {
  /// The deployment ID.
  final String deploymentId;

  /// The stack ID.
  final String stackId;

  /// The app ID.
  final String appId;

  /// Date when the deployment was created.
  final String createdAt;

  /// Date when the deployment completed.
  final String completedAt;

  /// The deployment duration.
  final int duration;

  /// The user's IAM ARN.
  final String iamUserArn;

  /// A user-defined comment.
  final String comment;

  /// Used to specify a stack or deployment command.
  final DeploymentCommand command;

  /// The deployment status:
  ///
  /// *   running
  ///
  /// *   successful
  ///
  /// *   failed
  final String status;

  /// A string that contains user-defined custom JSON. It can be used to
  /// override the corresponding default stack configuration attribute values
  /// for stack or to pass data to recipes. The string should be in the
  /// following format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information on custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html).
  final String customJson;

  /// The IDs of the target instances.
  final List<String> instanceIds;

  Deployment({
    this.deploymentId,
    this.stackId,
    this.appId,
    this.createdAt,
    this.completedAt,
    this.duration,
    this.iamUserArn,
    this.comment,
    this.command,
    this.status,
    this.customJson,
    this.instanceIds,
  });
  static Deployment fromJson(Map<String, dynamic> json) => Deployment();
}

/// Used to specify a stack or deployment command.
class DeploymentCommand {
  /// Specifies the operation. You can specify only one command.
  ///
  /// For stacks, the following commands are available:
  ///
  /// *    `execute_recipes`: Execute one or more recipes. To specify the
  /// recipes, set an `Args` parameter named `recipes` to the list of recipes to
  /// be executed. For example, to execute `phpapp::appsetup`, set `Args` to
  /// `{"recipes":["phpapp::appsetup"]}`.
  ///
  /// *    `install_dependencies`: Install the stack's dependencies.
  ///
  /// *    `update_custom_cookbooks`: Update the stack's custom cookbooks.
  ///
  /// *    `update_dependencies`: Update the stack's dependencies.
  ///
  ///
  ///  The update_dependencies and install_dependencies commands are supported
  /// only for Linux instances. You can run the commands successfully on Windows
  /// instances, but they do nothing.
  ///
  /// For apps, the following commands are available:
  ///
  /// *    `deploy`: Deploy an app. Ruby on Rails apps have an optional `Args`
  /// parameter named `migrate`. Set `Args` to {"migrate":["true"]} to migrate
  /// the database. The default setting is {"migrate":["false"]}.
  ///
  /// *    `rollback` Roll the app back to the previous version. When you update
  /// an app, AWS OpsWorks Stacks stores the previous version, up to a maximum
  /// of five versions. You can use this command to roll an app back as many as
  /// four versions.
  ///
  /// *    `start`: Start the app's web or application server.
  ///
  /// *    `stop`: Stop the app's web or application server.
  ///
  /// *    `restart`: Restart the app's web or application server.
  ///
  /// *    `undeploy`: Undeploy the app.
  final String name;

  /// The arguments of those commands that take arguments. It should be set to a
  /// JSON object with the following format:
  ///
  ///  `{"arg_name1" : ["value1", "value2", ...], "arg_name2" :
  /// ["value1", "value2", ...], ...}`
  ///
  /// The `update_dependencies` command takes two arguments:
  ///
  /// *    `upgrade_os_to` - Specifies the desired Amazon Linux version for
  /// instances whose OS you want to upgrade, such as `Amazon Linux 2016.09`.
  /// You must also set the `allow_reboot` argument to true.
  ///
  /// *    `allow_reboot` - Specifies whether to allow AWS OpsWorks Stacks to
  /// reboot the instances if necessary, after installing the updates. This
  /// argument can be set to either `true` or `false`. The default value is
  /// `false`.
  ///
  ///
  /// For example, to upgrade an instance to Amazon Linux 2016.09, set `Args` to
  /// the following.
  ///
  ///   `{ "upgrade_os_to":["Amazon Linux 2016.09"], "allow_reboot":["true"] }`
  final Map<String, List<String>> args;

  DeploymentCommand({
    @required this.name,
    this.args,
  });
  static DeploymentCommand fromJson(Map<String, dynamic> json) =>
      DeploymentCommand();
}

/// Contains the response to a `DescribeAgentVersions` request.
class DescribeAgentVersionsResult {
  /// The agent versions for the specified stack or configuration manager. Note
  /// that this value is the complete version number, not the abbreviated number
  /// used by the console.
  final List<AgentVersion> agentVersions;

  DescribeAgentVersionsResult({
    this.agentVersions,
  });
  static DescribeAgentVersionsResult fromJson(Map<String, dynamic> json) =>
      DescribeAgentVersionsResult();
}

/// Contains the response to a `DescribeApps` request.
class DescribeAppsResult {
  /// An array of `App` objects that describe the specified apps.
  final List<App> apps;

  DescribeAppsResult({
    this.apps,
  });
  static DescribeAppsResult fromJson(Map<String, dynamic> json) =>
      DescribeAppsResult();
}

/// Contains the response to a `DescribeCommands` request.
class DescribeCommandsResult {
  /// An array of `Command` objects that describe each of the specified
  /// commands.
  final List<Command> commands;

  DescribeCommandsResult({
    this.commands,
  });
  static DescribeCommandsResult fromJson(Map<String, dynamic> json) =>
      DescribeCommandsResult();
}

/// Contains the response to a `DescribeDeployments` request.
class DescribeDeploymentsResult {
  /// An array of `Deployment` objects that describe the deployments.
  final List<Deployment> deployments;

  DescribeDeploymentsResult({
    this.deployments,
  });
  static DescribeDeploymentsResult fromJson(Map<String, dynamic> json) =>
      DescribeDeploymentsResult();
}

/// Contains the response to a `DescribeEcsClusters` request.
class DescribeEcsClustersResult {
  /// A list of `EcsCluster` objects containing the cluster descriptions.
  final List<EcsCluster> ecsClusters;

  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// `NextToken` parameter to retrieve the next set of results. If the previous
  /// paginated request returned all of the remaining results, this parameter is
  /// set to `null`.
  final String nextToken;

  DescribeEcsClustersResult({
    this.ecsClusters,
    this.nextToken,
  });
  static DescribeEcsClustersResult fromJson(Map<String, dynamic> json) =>
      DescribeEcsClustersResult();
}

/// Contains the response to a `DescribeElasticIps` request.
class DescribeElasticIpsResult {
  /// An `ElasticIps` object that describes the specified Elastic IP addresses.
  final List<ElasticIp> elasticIps;

  DescribeElasticIpsResult({
    this.elasticIps,
  });
  static DescribeElasticIpsResult fromJson(Map<String, dynamic> json) =>
      DescribeElasticIpsResult();
}

/// Contains the response to a `DescribeElasticLoadBalancers` request.
class DescribeElasticLoadBalancersResult {
  /// A list of `ElasticLoadBalancer` objects that describe the specified
  /// Elastic Load Balancing instances.
  final List<ElasticLoadBalancer> elasticLoadBalancers;

  DescribeElasticLoadBalancersResult({
    this.elasticLoadBalancers,
  });
  static DescribeElasticLoadBalancersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeElasticLoadBalancersResult();
}

/// Contains the response to a `DescribeInstances` request.
class DescribeInstancesResult {
  /// An array of `Instance` objects that describe the instances.
  final List<Instance> instances;

  DescribeInstancesResult({
    this.instances,
  });
  static DescribeInstancesResult fromJson(Map<String, dynamic> json) =>
      DescribeInstancesResult();
}

/// Contains the response to a `DescribeLayers` request.
class DescribeLayersResult {
  /// An array of `Layer` objects that describe the layers.
  final List<Layer> layers;

  DescribeLayersResult({
    this.layers,
  });
  static DescribeLayersResult fromJson(Map<String, dynamic> json) =>
      DescribeLayersResult();
}

/// Contains the response to a `DescribeLoadBasedAutoScaling` request.
class DescribeLoadBasedAutoScalingResult {
  /// An array of `LoadBasedAutoScalingConfiguration` objects that describe each
  /// layer's configuration.
  final List<LoadBasedAutoScalingConfiguration>
      loadBasedAutoScalingConfigurations;

  DescribeLoadBasedAutoScalingResult({
    this.loadBasedAutoScalingConfigurations,
  });
  static DescribeLoadBasedAutoScalingResult fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBasedAutoScalingResult();
}

/// Contains the response to a `DescribeMyUserProfile` request.
class DescribeMyUserProfileResult {
  /// A `UserProfile` object that describes the user's SSH information.
  final SelfUserProfile userProfile;

  DescribeMyUserProfileResult({
    this.userProfile,
  });
  static DescribeMyUserProfileResult fromJson(Map<String, dynamic> json) =>
      DescribeMyUserProfileResult();
}

/// The response to a `DescribeOperatingSystems` request.
class DescribeOperatingSystemsResponse {
  /// Contains information in response to a `DescribeOperatingSystems` request.
  final List<OperatingSystem> operatingSystems;

  DescribeOperatingSystemsResponse({
    this.operatingSystems,
  });
  static DescribeOperatingSystemsResponse fromJson(Map<String, dynamic> json) =>
      DescribeOperatingSystemsResponse();
}

/// Contains the response to a `DescribePermissions` request.
class DescribePermissionsResult {
  /// An array of `Permission` objects that describe the stack permissions.
  ///
  /// *   If the request object contains only a stack ID, the array contains a
  /// `Permission` object with permissions for each of the stack IAM ARNs.
  ///
  /// *   If the request object contains only an IAM ARN, the array contains a
  /// `Permission` object with permissions for each of the user's stack IDs.
  ///
  /// *   If the request contains a stack ID and an IAM ARN, the array contains
  /// a single `Permission` object with permissions for the specified stack and
  /// IAM ARN.
  final List<Permission> permissions;

  DescribePermissionsResult({
    this.permissions,
  });
  static DescribePermissionsResult fromJson(Map<String, dynamic> json) =>
      DescribePermissionsResult();
}

/// Contains the response to a `DescribeRaidArrays` request.
class DescribeRaidArraysResult {
  /// A `RaidArrays` object that describes the specified RAID arrays.
  final List<RaidArray> raidArrays;

  DescribeRaidArraysResult({
    this.raidArrays,
  });
  static DescribeRaidArraysResult fromJson(Map<String, dynamic> json) =>
      DescribeRaidArraysResult();
}

/// Contains the response to a `DescribeRdsDbInstances` request.
class DescribeRdsDbInstancesResult {
  /// An a array of `RdsDbInstance` objects that describe the instances.
  final List<RdsDbInstance> rdsDbInstances;

  DescribeRdsDbInstancesResult({
    this.rdsDbInstances,
  });
  static DescribeRdsDbInstancesResult fromJson(Map<String, dynamic> json) =>
      DescribeRdsDbInstancesResult();
}

/// Contains the response to a `DescribeServiceErrors` request.
class DescribeServiceErrorsResult {
  /// An array of `ServiceError` objects that describe the specified service
  /// errors.
  final List<ServiceError> serviceErrors;

  DescribeServiceErrorsResult({
    this.serviceErrors,
  });
  static DescribeServiceErrorsResult fromJson(Map<String, dynamic> json) =>
      DescribeServiceErrorsResult();
}

/// Contains the response to a `DescribeStackProvisioningParameters` request.
class DescribeStackProvisioningParametersResult {
  /// The AWS OpsWorks Stacks agent installer's URL.
  final String agentInstallerUrl;

  /// An embedded object that contains the provisioning parameters.
  final Map<String, String> parameters;

  DescribeStackProvisioningParametersResult({
    this.agentInstallerUrl,
    this.parameters,
  });
  static DescribeStackProvisioningParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeStackProvisioningParametersResult();
}

/// Contains the response to a `DescribeStackSummary` request.
class DescribeStackSummaryResult {
  /// A `StackSummary` object that contains the results.
  final StackSummary stackSummary;

  DescribeStackSummaryResult({
    this.stackSummary,
  });
  static DescribeStackSummaryResult fromJson(Map<String, dynamic> json) =>
      DescribeStackSummaryResult();
}

/// Contains the response to a `DescribeStacks` request.
class DescribeStacksResult {
  /// An array of `Stack` objects that describe the stacks.
  final List<Stack> stacks;

  DescribeStacksResult({
    this.stacks,
  });
  static DescribeStacksResult fromJson(Map<String, dynamic> json) =>
      DescribeStacksResult();
}

/// Contains the response to a `DescribeTimeBasedAutoScaling` request.
class DescribeTimeBasedAutoScalingResult {
  /// An array of `TimeBasedAutoScalingConfiguration` objects that describe the
  /// configuration for the specified instances.
  final List<TimeBasedAutoScalingConfiguration>
      timeBasedAutoScalingConfigurations;

  DescribeTimeBasedAutoScalingResult({
    this.timeBasedAutoScalingConfigurations,
  });
  static DescribeTimeBasedAutoScalingResult fromJson(
          Map<String, dynamic> json) =>
      DescribeTimeBasedAutoScalingResult();
}

/// Contains the response to a `DescribeUserProfiles` request.
class DescribeUserProfilesResult {
  /// A `Users` object that describes the specified users.
  final List<UserProfile> userProfiles;

  DescribeUserProfilesResult({
    this.userProfiles,
  });
  static DescribeUserProfilesResult fromJson(Map<String, dynamic> json) =>
      DescribeUserProfilesResult();
}

/// Contains the response to a `DescribeVolumes` request.
class DescribeVolumesResult {
  /// An array of volume IDs.
  final List<Volume> volumes;

  DescribeVolumesResult({
    this.volumes,
  });
  static DescribeVolumesResult fromJson(Map<String, dynamic> json) =>
      DescribeVolumesResult();
}

/// Describes an Amazon EBS volume. This data type maps directly to the Amazon
/// EC2
/// [EbsBlockDevice](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html)
/// data type.
class EbsBlockDevice {
  /// The snapshot ID.
  final String snapshotId;

  /// The number of I/O operations per second (IOPS) that the volume supports.
  /// For more information, see
  /// [EbsBlockDevice](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html).
  final int iops;

  /// The volume size, in GiB. For more information, see
  /// [EbsBlockDevice](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html).
  final int volumeSize;

  /// The volume type. `gp2` for General Purpose (SSD) volumes, `io1` for
  /// Provisioned IOPS (SSD) volumes, `st1` for Throughput Optimized hard disk
  /// drives (HDD), `sc1` for Cold HDD,and `standard` for Magnetic volumes.
  ///
  /// If you specify the `io1` volume type, you must also specify a value for
  /// the `Iops` attribute. The maximum ratio of provisioned IOPS to requested
  /// volume size (in GiB) is 50:1. AWS uses the default volume size (in GiB)
  /// specified in the AMI attributes to set IOPS to 50 x (volume size).
  final String volumeType;

  /// Whether the volume is deleted on instance termination.
  final bool deleteOnTermination;

  EbsBlockDevice({
    this.snapshotId,
    this.iops,
    this.volumeSize,
    this.volumeType,
    this.deleteOnTermination,
  });
  static EbsBlockDevice fromJson(Map<String, dynamic> json) => EbsBlockDevice();
}

/// Describes a registered Amazon ECS cluster.
class EcsCluster {
  /// The cluster's ARN.
  final String ecsClusterArn;

  /// The cluster name.
  final String ecsClusterName;

  /// The stack ID.
  final String stackId;

  /// The time and date that the cluster was registered with the stack.
  final String registeredAt;

  EcsCluster({
    this.ecsClusterArn,
    this.ecsClusterName,
    this.stackId,
    this.registeredAt,
  });
  static EcsCluster fromJson(Map<String, dynamic> json) => EcsCluster();
}

/// Describes an Elastic IP address.
class ElasticIp {
  /// The IP address.
  final String ip;

  /// The name.
  final String name;

  /// The domain.
  final String domain;

  /// The AWS region. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String region;

  /// The ID of the instance that the address is attached to.
  final String instanceId;

  ElasticIp({
    this.ip,
    this.name,
    this.domain,
    this.region,
    this.instanceId,
  });
  static ElasticIp fromJson(Map<String, dynamic> json) => ElasticIp();
}

/// Describes an Elastic Load Balancing instance.
class ElasticLoadBalancer {
  /// The Elastic Load Balancing instance's name.
  final String elasticLoadBalancerName;

  /// The instance's AWS region.
  final String region;

  /// The instance's public DNS name.
  final String dnsName;

  /// The ID of the stack that the instance is associated with.
  final String stackId;

  /// The ID of the layer that the instance is attached to.
  final String layerId;

  /// The VPC ID.
  final String vpcId;

  /// A list of Availability Zones.
  final List<String> availabilityZones;

  /// A list of subnet IDs, if the stack is running in a VPC.
  final List<String> subnetIds;

  /// A list of the EC2 instances that the Elastic Load Balancing instance is
  /// managing traffic for.
  final List<String> ec2InstanceIds;

  ElasticLoadBalancer({
    this.elasticLoadBalancerName,
    this.region,
    this.dnsName,
    this.stackId,
    this.layerId,
    this.vpcId,
    this.availabilityZones,
    this.subnetIds,
    this.ec2InstanceIds,
  });
  static ElasticLoadBalancer fromJson(Map<String, dynamic> json) =>
      ElasticLoadBalancer();
}

/// Represents an app's environment variable.
class EnvironmentVariable {
  /// (Required) The environment variable's name, which can consist of up to 64
  /// characters and must be specified. The name can contain upper- and
  /// lowercase letters, numbers, and underscores (_), but it must start with a
  /// letter or underscore.
  final String key;

  /// (Optional) The environment variable's value, which can be left empty. If
  /// you specify a value, it can contain up to 256 characters, which must all
  /// be printable.
  final String value;

  /// (Optional) Whether the variable's value will be returned by the
  /// DescribeApps action. To conceal an environment variable's value, set
  /// `Secure` to `true`. `DescribeApps` then returns `*****FILTERED*****`
  /// instead of the actual value. The default value for `Secure` is `false`.
  final bool secure;

  EnvironmentVariable({
    @required this.key,
    @required this.value,
    this.secure,
  });
  static EnvironmentVariable fromJson(Map<String, dynamic> json) =>
      EnvironmentVariable();
}

/// Contains the response to a `GetHostnameSuggestion` request.
class GetHostnameSuggestionResult {
  /// The layer ID.
  final String layerId;

  /// The generated host name.
  final String hostname;

  GetHostnameSuggestionResult({
    this.layerId,
    this.hostname,
  });
  static GetHostnameSuggestionResult fromJson(Map<String, dynamic> json) =>
      GetHostnameSuggestionResult();
}

/// Contains the response to a `GrantAccess` request.
class GrantAccessResult {
  /// A `TemporaryCredential` object that contains the data needed to log in to
  /// the instance by RDP clients, such as the Microsoft Remote Desktop
  /// Connection.
  final TemporaryCredential temporaryCredential;

  GrantAccessResult({
    this.temporaryCredential,
  });
  static GrantAccessResult fromJson(Map<String, dynamic> json) =>
      GrantAccessResult();
}

/// Describes an instance.
class Instance {
  /// The agent version. This parameter is set to `INHERIT` if the instance
  /// inherits the default stack setting or to a a version number for a fixed
  /// agent version.
  final String agentVersion;

  /// A custom AMI ID to be used to create the instance. For more information,
  /// see
  /// [Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html)
  final String amiId;

  /// The instance architecture: "i386" or "x86_64".
  final String architecture;

  /// The instance's Amazon Resource Number (ARN).
  final String arn;

  /// For load-based or time-based instances, the type.
  final String autoScalingType;

  /// The instance Availability Zone. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String availabilityZone;

  /// An array of `BlockDeviceMapping` objects that specify the instance's block
  /// device mappings.
  final List<BlockDeviceMapping> blockDeviceMappings;

  /// The time that the instance was created.
  final String createdAt;

  /// Whether this is an Amazon EBS-optimized instance.
  final bool ebsOptimized;

  /// The ID of the associated Amazon EC2 instance.
  final String ec2InstanceId;

  /// For container instances, the Amazon ECS cluster's ARN.
  final String ecsClusterArn;

  /// For container instances, the instance's ARN.
  final String ecsContainerInstanceArn;

  /// The instance
  /// [Elastic IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// .
  final String elasticIp;

  /// The instance host name.
  final String hostname;

  /// For registered instances, the infrastructure class: `ec2` or
  /// `on-premises`.
  final String infrastructureClass;

  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is `true`. If this value is set to `false`, you
  /// must then update your instances manually by using CreateDeployment to run
  /// the `update_dependencies` stack command or by manually running `yum`
  /// (Amazon Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// We strongly recommend using the default value of `true`, to ensure that
  /// your instances have the latest security updates.
  final bool installUpdatesOnBoot;

  /// The instance ID.
  final String instanceId;

  /// The ARN of the instance's IAM profile. For more information about IAM
  /// ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  final String instanceProfileArn;

  /// The instance type, such as `t2.micro`.
  final String instanceType;

  /// The ID of the last service error. For more information, call
  /// DescribeServiceErrors.
  final String lastServiceErrorId;

  /// An array containing the instance layer IDs.
  final List<String> layerIds;

  /// The instance's operating system.
  final String os;

  /// The instance's platform.
  final String platform;

  /// The instance's private DNS name.
  final String privateDns;

  /// The instance's private IP address.
  final String privateIp;

  /// The instance public DNS name.
  final String publicDns;

  /// The instance public IP address.
  final String publicIp;

  /// For registered instances, who performed the registration.
  final String registeredBy;

  /// The instance's reported AWS OpsWorks Stacks agent version.
  final String reportedAgentVersion;

  /// For registered instances, the reported operating system.
  final ReportedOs reportedOs;

  /// The instance's root device type. For more information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  final String rootDeviceType;

  /// The root device volume ID.
  final String rootDeviceVolumeId;

  /// An array containing the instance security group IDs.
  final List<String> securityGroupIds;

  /// The SSH key's Deep Security Agent (DSA) fingerprint.
  final String sshHostDsaKeyFingerprint;

  /// The SSH key's RSA fingerprint.
  final String sshHostRsaKeyFingerprint;

  /// The instance's Amazon EC2 key-pair name.
  final String sshKeyName;

  /// The stack ID.
  final String stackId;

  /// The instance status:
  ///
  /// *    `booting`
  ///
  /// *    `connection_lost`
  ///
  /// *    `online`
  ///
  /// *    `pending`
  ///
  /// *    `rebooting`
  ///
  /// *    `requested`
  ///
  /// *    `running_setup`
  ///
  /// *    `setup_failed`
  ///
  /// *    `shutting_down`
  ///
  /// *    `start_failed`
  ///
  /// *    `stop_failed`
  ///
  /// *    `stopped`
  ///
  /// *    `stopping`
  ///
  /// *    `terminated`
  ///
  /// *    `terminating`
  final String status;

  /// The instance's subnet ID; applicable only if the stack is running in a
  /// VPC.
  final String subnetId;

  /// The instance's tenancy option, such as `dedicated` or `host`.
  final String tenancy;

  /// The instance's virtualization type: `paravirtual` or `hvm`.
  final String virtualizationType;

  Instance({
    this.agentVersion,
    this.amiId,
    this.architecture,
    this.arn,
    this.autoScalingType,
    this.availabilityZone,
    this.blockDeviceMappings,
    this.createdAt,
    this.ebsOptimized,
    this.ec2InstanceId,
    this.ecsClusterArn,
    this.ecsContainerInstanceArn,
    this.elasticIp,
    this.hostname,
    this.infrastructureClass,
    this.installUpdatesOnBoot,
    this.instanceId,
    this.instanceProfileArn,
    this.instanceType,
    this.lastServiceErrorId,
    this.layerIds,
    this.os,
    this.platform,
    this.privateDns,
    this.privateIp,
    this.publicDns,
    this.publicIp,
    this.registeredBy,
    this.reportedAgentVersion,
    this.reportedOs,
    this.rootDeviceType,
    this.rootDeviceVolumeId,
    this.securityGroupIds,
    this.sshHostDsaKeyFingerprint,
    this.sshHostRsaKeyFingerprint,
    this.sshKeyName,
    this.stackId,
    this.status,
    this.subnetId,
    this.tenancy,
    this.virtualizationType,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

/// Contains a description of an Amazon EC2 instance from the Amazon EC2
/// metadata service. For more information, see
/// [Instance Metadata and User Data](https://docs.aws.amazon.com/sdkfornet/latest/apidocs/Index.html).
class InstanceIdentity {
  /// A JSON document that contains the metadata.
  final String document;

  /// A signature that can be used to verify the document's accuracy and
  /// authenticity.
  final String signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });
}

/// Describes how many instances a stack has for each status.
class InstancesCount {
  /// The number of instances in the Assigning state.
  final int assigning;

  /// The number of instances with `booting` status.
  final int booting;

  /// The number of instances with `connection_lost` status.
  final int connectionLost;

  /// The number of instances in the Deregistering state.
  final int deregistering;

  /// The number of instances with `online` status.
  final int online;

  /// The number of instances with `pending` status.
  final int pending;

  /// The number of instances with `rebooting` status.
  final int rebooting;

  /// The number of instances in the Registered state.
  final int registered;

  /// The number of instances in the Registering state.
  final int registering;

  /// The number of instances with `requested` status.
  final int requested;

  /// The number of instances with `running_setup` status.
  final int runningSetup;

  /// The number of instances with `setup_failed` status.
  final int setupFailed;

  /// The number of instances with `shutting_down` status.
  final int shuttingDown;

  /// The number of instances with `start_failed` status.
  final int startFailed;

  /// The number of instances with `stop_failed` status.
  final int stopFailed;

  /// The number of instances with `stopped` status.
  final int stopped;

  /// The number of instances with `stopping` status.
  final int stopping;

  /// The number of instances with `terminated` status.
  final int terminated;

  /// The number of instances with `terminating` status.
  final int terminating;

  /// The number of instances in the Unassigning state.
  final int unassigning;

  InstancesCount({
    this.assigning,
    this.booting,
    this.connectionLost,
    this.deregistering,
    this.online,
    this.pending,
    this.rebooting,
    this.registered,
    this.registering,
    this.requested,
    this.runningSetup,
    this.setupFailed,
    this.shuttingDown,
    this.startFailed,
    this.stopFailed,
    this.stopped,
    this.stopping,
    this.terminated,
    this.terminating,
    this.unassigning,
  });
  static InstancesCount fromJson(Map<String, dynamic> json) => InstancesCount();
}

/// Describes a layer.
class Layer {
  /// The Amazon Resource Number (ARN) of a layer.
  final String arn;

  /// The layer stack ID.
  final String stackId;

  /// The layer ID.
  final String layerId;

  /// The layer type.
  final String type;

  /// The layer name.
  final String name;

  /// The layer short name.
  final String shortname;

  /// The layer attributes.
  ///
  /// For the `HaproxyStatsPassword`, `MysqlRootPassword`, and `GangliaPassword`
  /// attributes, AWS OpsWorks Stacks returns `*****FILTERED*****` instead of
  /// the actual value
  ///
  /// For an ECS Cluster layer, AWS OpsWorks Stacks the `EcsClusterArn`
  /// attribute is set to the cluster's ARN.
  final Map<String, String> attributes;

  /// The Amazon CloudWatch Logs configuration settings for the layer.
  final CloudWatchLogsConfiguration cloudWatchLogsConfiguration;

  /// The ARN of the default IAM profile to be used for the layer's EC2
  /// instances. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  final String customInstanceProfileArn;

  /// A JSON formatted string containing the layer's custom stack configuration
  /// and deployment attributes.
  final String customJson;

  /// An array containing the layer's custom security group IDs.
  final List<String> customSecurityGroupIds;

  /// An array containing the layer's security group names.
  final List<String> defaultSecurityGroupNames;

  /// An array of `Package` objects that describe the layer's packages.
  final List<String> packages;

  /// A `VolumeConfigurations` object that describes the layer's Amazon EBS
  /// volumes.
  final List<VolumeConfiguration> volumeConfigurations;

  /// Whether auto healing is disabled for the layer.
  final bool enableAutoHealing;

  /// Whether to automatically assign an
  /// [Elastic IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// to the layer's instances. For more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  final bool autoAssignElasticIps;

  /// For stacks that are running in a VPC, whether to automatically assign a
  /// public IP address to the layer's instances. For more information, see
  /// [How to Edit a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html).
  final bool autoAssignPublicIps;

  /// AWS OpsWorks Stacks supports five lifecycle events: **setup**,
  /// **configuration**, **deploy**, **undeploy**, and **shutdown**. For each
  /// layer, AWS OpsWorks Stacks runs a set of standard recipes for each event.
  /// You can also provide custom recipes for any or all layers and events. AWS
  /// OpsWorks Stacks runs custom event recipes after the standard recipes.
  /// `LayerCustomRecipes` specifies the custom recipes for a particular layer
  /// to be run in response to each of the five events.
  ///
  /// To specify a recipe, use the cookbook's directory name in the repository
  /// followed by two colons and the recipe name, which is the recipe's file
  /// name without the `.rb` extension. For example: `phpapp2::dbsetup`
  /// specifies the `dbsetup.rb` recipe in the repository's `phpapp2` folder.
  final Recipes defaultRecipes;

  /// A `LayerCustomRecipes` object that specifies the layer's custom recipes.
  final Recipes customRecipes;

  /// Date when the layer was created.
  final String createdAt;

  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is `true`. If this value is set to `false`, you
  /// must then update your instances manually by using CreateDeployment to run
  /// the `update_dependencies` stack command or manually running `yum` (Amazon
  /// Linux) or `apt-get` (Ubuntu) on the instances.
  ///
  ///
  ///
  /// We strongly recommend using the default value of `true`, to ensure that
  /// your instances have the latest security updates.
  final bool installUpdatesOnBoot;

  /// Whether the layer uses Amazon EBS-optimized instances.
  final bool useEbsOptimizedInstances;

  /// A `LifeCycleEventConfiguration` object that specifies the Shutdown event
  /// configuration.
  final LifecycleEventConfiguration lifecycleEventConfiguration;

  Layer({
    this.arn,
    this.stackId,
    this.layerId,
    this.type,
    this.name,
    this.shortname,
    this.attributes,
    this.cloudWatchLogsConfiguration,
    this.customInstanceProfileArn,
    this.customJson,
    this.customSecurityGroupIds,
    this.defaultSecurityGroupNames,
    this.packages,
    this.volumeConfigurations,
    this.enableAutoHealing,
    this.autoAssignElasticIps,
    this.autoAssignPublicIps,
    this.defaultRecipes,
    this.customRecipes,
    this.createdAt,
    this.installUpdatesOnBoot,
    this.useEbsOptimizedInstances,
    this.lifecycleEventConfiguration,
  });
  static Layer fromJson(Map<String, dynamic> json) => Layer();
}

/// Specifies the lifecycle event configuration
class LifecycleEventConfiguration {
  /// A `ShutdownEventConfiguration` object that specifies the Shutdown event
  /// configuration.
  final ShutdownEventConfiguration shutdown;

  LifecycleEventConfiguration({
    this.shutdown,
  });
  static LifecycleEventConfiguration fromJson(Map<String, dynamic> json) =>
      LifecycleEventConfiguration();
}

/// Contains the response to a `ListTags` request.
class ListTagsResult {
  /// A set of key-value pairs that contain tag keys and tag values that are
  /// attached to a stack or layer.
  final Map<String, String> tags;

  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// `NextToken` parameter to get the next set of results. If the previous
  /// paginated request returned all of the remaining results, this parameter is
  /// set to `null`.
  final String nextToken;

  ListTagsResult({
    this.tags,
    this.nextToken,
  });
  static ListTagsResult fromJson(Map<String, dynamic> json) => ListTagsResult();
}

/// Describes a layer's load-based auto scaling configuration.
class LoadBasedAutoScalingConfiguration {
  /// The layer ID.
  final String layerId;

  /// Whether load-based auto scaling is enabled for the layer.
  final bool enable;

  /// An `AutoScalingThresholds` object that describes the upscaling
  /// configuration, which defines how and when AWS OpsWorks Stacks increases
  /// the number of instances.
  final AutoScalingThresholds upScaling;

  /// An `AutoScalingThresholds` object that describes the downscaling
  /// configuration, which defines how and when AWS OpsWorks Stacks reduces the
  /// number of instances.
  final AutoScalingThresholds downScaling;

  LoadBasedAutoScalingConfiguration({
    this.layerId,
    this.enable,
    this.upScaling,
    this.downScaling,
  });
  static LoadBasedAutoScalingConfiguration fromJson(
          Map<String, dynamic> json) =>
      LoadBasedAutoScalingConfiguration();
}

/// Describes supported operating systems in AWS OpsWorks Stacks.
class OperatingSystem {
  /// The name of the operating system, such as `Amazon Linux 2018.03`.
  final String name;

  /// The ID of a supported operating system, such as `Amazon Linux 2018.03`.
  final String id;

  /// The type of a supported operating system, either `Linux` or `Windows`.
  final String type;

  /// Supported configuration manager name and versions for an AWS OpsWorks
  /// Stacks operating system.
  final List<OperatingSystemConfigurationManager> configurationManagers;

  /// A short name for the operating system manufacturer.
  final String reportedName;

  /// The version of the operating system, including the release and edition, if
  /// applicable.
  final String reportedVersion;

  /// Indicates that an operating system is not supported for new instances.
  final bool supported;

  OperatingSystem({
    this.name,
    this.id,
    this.type,
    this.configurationManagers,
    this.reportedName,
    this.reportedVersion,
    this.supported,
  });
  static OperatingSystem fromJson(Map<String, dynamic> json) =>
      OperatingSystem();
}

/// A block that contains information about the configuration manager (Chef) and
/// the versions of the configuration manager that are supported for an
/// operating system.
class OperatingSystemConfigurationManager {
  /// The name of the configuration manager, which is Chef.
  final String name;

  /// The versions of the configuration manager that are supported by an
  /// operating system.
  final String version;

  OperatingSystemConfigurationManager({
    this.name,
    this.version,
  });
  static OperatingSystemConfigurationManager fromJson(
          Map<String, dynamic> json) =>
      OperatingSystemConfigurationManager();
}

/// Describes stack or user permissions.
class Permission {
  /// A stack ID.
  final String stackId;

  /// The Amazon Resource Name (ARN) for an AWS Identity and Access Management
  /// (IAM) role. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  final String iamUserArn;

  /// Whether the user can use SSH.
  final bool allowSsh;

  /// Whether the user can use **sudo**.
  final bool allowSudo;

  /// The user's permission level, which must be the following:
  ///
  /// *    `deny`
  ///
  /// *    `show`
  ///
  /// *    `deploy`
  ///
  /// *    `manage`
  ///
  /// *    `iam_only`
  ///
  ///
  /// For more information on the permissions associated with these levels, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html)
  final String level;

  Permission({
    this.stackId,
    this.iamUserArn,
    this.allowSsh,
    this.allowSudo,
    this.level,
  });
  static Permission fromJson(Map<String, dynamic> json) => Permission();
}

/// Describes an instance's RAID array.
class RaidArray {
  /// The array ID.
  final String raidArrayId;

  /// The instance ID.
  final String instanceId;

  /// The array name.
  final String name;

  /// The [RAID level](http://en.wikipedia.org/wiki/Standard_RAID_levels).
  final int raidLevel;

  /// The number of disks in the array.
  final int numberOfDisks;

  /// The array's size.
  final int size;

  /// The array's Linux device. For example /dev/mdadm0.
  final String device;

  /// The array's mount point.
  final String mountPoint;

  /// The array's Availability Zone. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String availabilityZone;

  /// When the RAID array was created.
  final String createdAt;

  /// The stack ID.
  final String stackId;

  /// The volume type, standard or PIOPS.
  final String volumeType;

  /// For PIOPS volumes, the IOPS per disk.
  final int iops;

  RaidArray({
    this.raidArrayId,
    this.instanceId,
    this.name,
    this.raidLevel,
    this.numberOfDisks,
    this.size,
    this.device,
    this.mountPoint,
    this.availabilityZone,
    this.createdAt,
    this.stackId,
    this.volumeType,
    this.iops,
  });
  static RaidArray fromJson(Map<String, dynamic> json) => RaidArray();
}

/// Describes an Amazon RDS instance.
class RdsDbInstance {
  /// The instance's ARN.
  final String rdsDbInstanceArn;

  /// The DB instance identifier.
  final String dbInstanceIdentifier;

  /// The master user name.
  final String dbUser;

  /// AWS OpsWorks Stacks returns `*****FILTERED*****` instead of the actual
  /// value.
  final String dbPassword;

  /// The instance's AWS region.
  final String region;

  /// The instance's address.
  final String address;

  /// The instance's database engine.
  final String engine;

  /// The ID of the stack with which the instance is registered.
  final String stackId;

  /// Set to `true` if AWS OpsWorks Stacks is unable to discover the Amazon RDS
  /// instance. AWS OpsWorks Stacks attempts to discover the instance only once.
  /// If this value is set to `true`, you must deregister the instance, and then
  /// register it again.
  final bool missingOnRds;

  RdsDbInstance({
    this.rdsDbInstanceArn,
    this.dbInstanceIdentifier,
    this.dbUser,
    this.dbPassword,
    this.region,
    this.address,
    this.engine,
    this.stackId,
    this.missingOnRds,
  });
  static RdsDbInstance fromJson(Map<String, dynamic> json) => RdsDbInstance();
}

/// AWS OpsWorks Stacks supports five lifecycle events: **setup**,
/// **configuration**, **deploy**, **undeploy**, and **shutdown**. For each
/// layer, AWS OpsWorks Stacks runs a set of standard recipes for each event. In
/// addition, you can provide custom recipes for any or all layers and events.
/// AWS OpsWorks Stacks runs custom event recipes after the standard recipes.
/// `LayerCustomRecipes` specifies the custom recipes for a particular layer to
/// be run in response to each of the five events.
///
/// To specify a recipe, use the cookbook's directory name in the repository
/// followed by two colons and the recipe name, which is the recipe's file name
/// without the .rb extension. For example: phpapp2::dbsetup specifies the
/// dbsetup.rb recipe in the repository's phpapp2 folder.
class Recipes {
  /// An array of custom recipe names to be run following a `setup` event.
  final List<String> setup;

  /// An array of custom recipe names to be run following a `configure` event.
  final List<String> configure;

  /// An array of custom recipe names to be run following a `deploy` event.
  final List<String> deploy;

  /// An array of custom recipe names to be run following a `undeploy` event.
  final List<String> undeploy;

  /// An array of custom recipe names to be run following a `shutdown` event.
  final List<String> shutdown;

  Recipes({
    this.setup,
    this.configure,
    this.deploy,
    this.undeploy,
    this.shutdown,
  });
  static Recipes fromJson(Map<String, dynamic> json) => Recipes();
}

/// Contains the response to a `RegisterEcsCluster` request.
class RegisterEcsClusterResult {
  /// The cluster's ARN.
  final String ecsClusterArn;

  RegisterEcsClusterResult({
    this.ecsClusterArn,
  });
  static RegisterEcsClusterResult fromJson(Map<String, dynamic> json) =>
      RegisterEcsClusterResult();
}

/// Contains the response to a `RegisterElasticIp` request.
class RegisterElasticIpResult {
  /// The Elastic IP address.
  final String elasticIp;

  RegisterElasticIpResult({
    this.elasticIp,
  });
  static RegisterElasticIpResult fromJson(Map<String, dynamic> json) =>
      RegisterElasticIpResult();
}

/// Contains the response to a `RegisterInstanceResult` request.
class RegisterInstanceResult {
  /// The registered instance's AWS OpsWorks Stacks ID.
  final String instanceId;

  RegisterInstanceResult({
    this.instanceId,
  });
  static RegisterInstanceResult fromJson(Map<String, dynamic> json) =>
      RegisterInstanceResult();
}

/// Contains the response to a `RegisterVolume` request.
class RegisterVolumeResult {
  /// The volume ID.
  final String volumeId;

  RegisterVolumeResult({
    this.volumeId,
  });
  static RegisterVolumeResult fromJson(Map<String, dynamic> json) =>
      RegisterVolumeResult();
}

/// A registered instance's reported operating system.
class ReportedOs {
  /// The operating system family.
  final String family;

  /// The operating system name.
  final String name;

  /// The operating system version.
  final String version;

  ReportedOs({
    this.family,
    this.name,
    this.version,
  });
  static ReportedOs fromJson(Map<String, dynamic> json) => ReportedOs();
}

/// Describes a user's SSH information.
class SelfUserProfile {
  /// The user's IAM ARN.
  final String iamUserArn;

  /// The user's name.
  final String name;

  /// The user's SSH user name.
  final String sshUsername;

  /// The user's SSH public key.
  final String sshPublicKey;

  SelfUserProfile({
    this.iamUserArn,
    this.name,
    this.sshUsername,
    this.sshPublicKey,
  });
  static SelfUserProfile fromJson(Map<String, dynamic> json) =>
      SelfUserProfile();
}

/// Describes an AWS OpsWorks Stacks service error.
class ServiceError {
  /// The error ID.
  final String serviceErrorId;

  /// The stack ID.
  final String stackId;

  /// The instance ID.
  final String instanceId;

  /// The error type.
  final String type;

  /// A message that describes the error.
  final String message;

  /// When the error occurred.
  final String createdAt;

  ServiceError({
    this.serviceErrorId,
    this.stackId,
    this.instanceId,
    this.type,
    this.message,
    this.createdAt,
  });
  static ServiceError fromJson(Map<String, dynamic> json) => ServiceError();
}

/// The Shutdown event configuration.
class ShutdownEventConfiguration {
  /// The time, in seconds, that AWS OpsWorks Stacks will wait after triggering
  /// a Shutdown event before shutting down an instance.
  final int executionTimeout;

  /// Whether to enable Elastic Load Balancing connection draining. For more
  /// information, see
  /// [Connection Draining](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html#conn-drain)
  final bool delayUntilElbConnectionsDrained;

  ShutdownEventConfiguration({
    this.executionTimeout,
    this.delayUntilElbConnectionsDrained,
  });
  static ShutdownEventConfiguration fromJson(Map<String, dynamic> json) =>
      ShutdownEventConfiguration();
}

/// Contains the information required to retrieve an app or cookbook from a
/// repository. For more information, see
/// [Creating Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html)
/// or
/// [Custom Recipes and Cookbooks](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).
class Source {
  /// The repository type.
  final String type;

  /// The source URL. The following is an example of an Amazon S3 source URL:
  /// `https://s3.amazonaws.com/opsworks-demo-bucket/opsworks_cookbook_demo.tar.gz`.
  final String url;

  /// This parameter depends on the repository type.
  ///
  /// *   For Amazon S3 bundles, set `Username` to the appropriate IAM access
  /// key ID.
  ///
  /// *   For HTTP bundles, Git repositories, and Subversion repositories, set
  /// `Username` to the user name.
  final String username;

  /// When included in a request, the parameter depends on the repository type.
  ///
  /// *   For Amazon S3 bundles, set `Password` to the appropriate IAM secret
  /// access key.
  ///
  /// *   For HTTP bundles and Subversion repositories, set `Password` to the
  /// password.
  ///
  ///
  /// For more information on how to safely handle IAM credentials, see
  /// [https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html](https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html).
  ///
  /// In responses, AWS OpsWorks Stacks returns `*****FILTERED*****` instead of
  /// the actual value.
  final String password;

  /// In requests, the repository's SSH key.
  ///
  /// In responses, AWS OpsWorks Stacks returns `*****FILTERED*****` instead of
  /// the actual value.
  final String sshKey;

  /// The application's version. AWS OpsWorks Stacks enables you to easily
  /// deploy new versions of an application. One of the simplest approaches is
  /// to have branches or revisions in your repository that represent different
  /// versions that can potentially be deployed.
  final String revision;

  Source({
    this.type,
    this.url,
    this.username,
    this.password,
    this.sshKey,
    this.revision,
  });
  static Source fromJson(Map<String, dynamic> json) => Source();
}

/// Describes an app's SSL configuration.
class SslConfiguration {
  /// The contents of the certificate's domain.crt file.
  final String certificate;

  /// The private key; the contents of the certificate's domain.kex file.
  final String privateKey;

  /// Optional. Can be used to specify an intermediate certificate authority key
  /// or client authentication.
  final String chain;

  SslConfiguration({
    @required this.certificate,
    @required this.privateKey,
    this.chain,
  });
  static SslConfiguration fromJson(Map<String, dynamic> json) =>
      SslConfiguration();
}

/// Describes a stack.
class Stack {
  /// The stack ID.
  final String stackId;

  /// The stack name.
  final String name;

  /// The stack's ARN.
  final String arn;

  /// The stack AWS region, such as "ap-northeast-2". For more information about
  /// AWS regions, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String region;

  /// The VPC ID; applicable only if the stack is running in a VPC.
  final String vpcId;

  /// The stack's attributes.
  final Map<String, String> attributes;

  /// The stack AWS Identity and Access Management (IAM) role.
  final String serviceRoleArn;

  /// The ARN of an IAM profile that is the default profile for all of the
  /// stack's EC2 instances. For more information about IAM ARNs, see
  /// [Using Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html).
  final String defaultInstanceProfileArn;

  /// The stack's default operating system.
  final String defaultOs;

  /// The stack host name theme, with spaces replaced by underscores.
  final String hostnameTheme;

  /// The stack's default Availability Zone. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String defaultAvailabilityZone;

  /// The default subnet ID; applicable only if the stack is running in a VPC.
  final String defaultSubnetId;

  /// A JSON object that contains user-defined attributes to be added to the
  /// stack configuration and deployment attributes. You can use custom JSON to
  /// override the corresponding default stack configuration attribute values or
  /// to pass data to recipes. The string should be in the following format:
  ///
  ///  `"{"key1": "value1", "key2": "value2",...}"`
  ///
  /// For more information on custom JSON, see
  /// [Use Custom JSON to Modify the Stack Configuration Attributes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html).
  final String customJson;

  /// The configuration manager.
  final StackConfigurationManager configurationManager;

  /// A `ChefConfiguration` object that specifies whether to enable Berkshelf
  /// and the Berkshelf version. For more information, see
  /// [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html).
  final ChefConfiguration chefConfiguration;

  /// Whether the stack uses custom cookbooks.
  final bool useCustomCookbooks;

  /// Whether the stack automatically associates the AWS OpsWorks Stacks
  /// built-in security groups with the stack's layers.
  final bool useOpsworksSecurityGroups;

  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see
  /// [Adding Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html)
  /// or
  /// [Cookbooks and Recipes](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).
  final Source customCookbooksSource;

  /// A default Amazon EC2 key pair for the stack's instances. You can override
  /// this value when you create or update an instance.
  final String defaultSshKeyName;

  /// The date when the stack was created.
  final String createdAt;

  /// The default root device type. This value is used by default for all
  /// instances in the stack, but you can override it when you create an
  /// instance. For more information, see
  /// [Storage for the Root Device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device).
  final String defaultRootDeviceType;

  /// The agent version. This parameter is set to `LATEST` for auto-update. or a
  /// version number for a fixed agent version.
  final String agentVersion;

  Stack({
    this.stackId,
    this.name,
    this.arn,
    this.region,
    this.vpcId,
    this.attributes,
    this.serviceRoleArn,
    this.defaultInstanceProfileArn,
    this.defaultOs,
    this.hostnameTheme,
    this.defaultAvailabilityZone,
    this.defaultSubnetId,
    this.customJson,
    this.configurationManager,
    this.chefConfiguration,
    this.useCustomCookbooks,
    this.useOpsworksSecurityGroups,
    this.customCookbooksSource,
    this.defaultSshKeyName,
    this.createdAt,
    this.defaultRootDeviceType,
    this.agentVersion,
  });
  static Stack fromJson(Map<String, dynamic> json) => Stack();
}

/// Describes the configuration manager.
class StackConfigurationManager {
  /// The name. This parameter must be set to "Chef".
  final String name;

  /// The Chef version. This parameter must be set to 12, 11.10, or 11.4 for
  /// Linux stacks, and to 12.2 for Windows stacks. The default value for Linux
  /// stacks is 11.4.
  final String version;

  StackConfigurationManager({
    this.name,
    this.version,
  });
  static StackConfigurationManager fromJson(Map<String, dynamic> json) =>
      StackConfigurationManager();
}

/// Summarizes the number of layers, instances, and apps in a stack.
class StackSummary {
  /// The stack ID.
  final String stackId;

  /// The stack name.
  final String name;

  /// The stack's ARN.
  final String arn;

  /// The number of layers.
  final int layersCount;

  /// The number of apps.
  final int appsCount;

  /// An `InstancesCount` object with the number of instances in each status.
  final InstancesCount instancesCount;

  StackSummary({
    this.stackId,
    this.name,
    this.arn,
    this.layersCount,
    this.appsCount,
    this.instancesCount,
  });
  static StackSummary fromJson(Map<String, dynamic> json) => StackSummary();
}

/// Contains the data needed by RDP clients such as the Microsoft Remote Desktop
/// Connection to log in to the instance.
class TemporaryCredential {
  /// The user name.
  final String username;

  /// The password.
  final String password;

  /// The length of time (in minutes) that the grant is valid. When the grant
  /// expires, at the end of this period, the user will no longer be able to use
  /// the credentials to log in. If they are logged in at the time, they will be
  /// automatically logged out.
  final int validForInMinutes;

  /// The instance's AWS OpsWorks Stacks ID.
  final String instanceId;

  TemporaryCredential({
    this.username,
    this.password,
    this.validForInMinutes,
    this.instanceId,
  });
  static TemporaryCredential fromJson(Map<String, dynamic> json) =>
      TemporaryCredential();
}

/// Describes an instance's time-based auto scaling configuration.
class TimeBasedAutoScalingConfiguration {
  /// The instance ID.
  final String instanceId;

  /// A `WeeklyAutoScalingSchedule` object with the instance schedule.
  final WeeklyAutoScalingSchedule autoScalingSchedule;

  TimeBasedAutoScalingConfiguration({
    this.instanceId,
    this.autoScalingSchedule,
  });
  static TimeBasedAutoScalingConfiguration fromJson(
          Map<String, dynamic> json) =>
      TimeBasedAutoScalingConfiguration();
}

/// Describes a user's SSH information.
class UserProfile {
  /// The user's IAM ARN.
  final String iamUserArn;

  /// The user's name.
  final String name;

  /// The user's SSH user name.
  final String sshUsername;

  /// The user's SSH public key.
  final String sshPublicKey;

  /// Whether users can specify their own SSH public key through the My Settings
  /// page. For more information, see
  /// [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html).
  final bool allowSelfManagement;

  UserProfile({
    this.iamUserArn,
    this.name,
    this.sshUsername,
    this.sshPublicKey,
    this.allowSelfManagement,
  });
  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile();
}

/// Describes an instance's Amazon EBS volume.
class Volume {
  /// The volume ID.
  final String volumeId;

  /// The Amazon EC2 volume ID.
  final String ec2VolumeId;

  /// The volume name.
  final String name;

  /// The RAID array ID.
  final String raidArrayId;

  /// The instance ID.
  final String instanceId;

  /// The value returned by
  /// [DescribeVolumes](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeVolumes.html).
  final String status;

  /// The volume size.
  final int size;

  /// The device name.
  final String device;

  /// The volume mount point. For example, "/mnt/disk1".
  final String mountPoint;

  /// The AWS region. For more information about AWS regions, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String region;

  /// The volume Availability Zone. For more information, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  final String availabilityZone;

  /// The volume type. For more information, see
  /// [Amazon EBS Volume Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html).
  ///
  /// *    `standard` - Magnetic. Magnetic volumes must have a minimum size of 1
  /// GiB and a maximum size of 1024 GiB.
  ///
  /// *    `io1` - Provisioned IOPS (SSD). PIOPS volumes must have a minimum
  /// size of 4 GiB and a maximum size of 16384 GiB.
  ///
  /// *    `gp2` - General Purpose (SSD). General purpose volumes must have a
  /// minimum size of 1 GiB and a maximum size of 16384 GiB.
  ///
  /// *    `st1` - Throughput Optimized hard disk drive (HDD). Throughput
  /// optimized HDD volumes must have a minimum size of 500 GiB and a maximum
  /// size of 16384 GiB.
  ///
  /// *    `sc1` - Cold HDD. Cold HDD volumes must have a minimum size of 500
  /// GiB and a maximum size of 16384 GiB.
  final String volumeType;

  /// For PIOPS volumes, the IOPS per disk.
  final int iops;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see
  /// [Amazon EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html).
  final bool encrypted;

  Volume({
    this.volumeId,
    this.ec2VolumeId,
    this.name,
    this.raidArrayId,
    this.instanceId,
    this.status,
    this.size,
    this.device,
    this.mountPoint,
    this.region,
    this.availabilityZone,
    this.volumeType,
    this.iops,
    this.encrypted,
  });
  static Volume fromJson(Map<String, dynamic> json) => Volume();
}

/// Describes an Amazon EBS volume configuration.
class VolumeConfiguration {
  /// The volume mount point. For example "/dev/sdh".
  final String mountPoint;

  /// The volume
  /// [RAID level](http://en.wikipedia.org/wiki/Standard_RAID_levels).
  final int raidLevel;

  /// The number of disks in the volume.
  final int numberOfDisks;

  /// The volume size.
  final int size;

  /// The volume type. For more information, see
  /// [Amazon EBS Volume Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html).
  ///
  /// *    `standard` - Magnetic. Magnetic volumes must have a minimum size of 1
  /// GiB and a maximum size of 1024 GiB.
  ///
  /// *    `io1` - Provisioned IOPS (SSD). PIOPS volumes must have a minimum
  /// size of 4 GiB and a maximum size of 16384 GiB.
  ///
  /// *    `gp2` - General Purpose (SSD). General purpose volumes must have a
  /// minimum size of 1 GiB and a maximum size of 16384 GiB.
  ///
  /// *    `st1` - Throughput Optimized hard disk drive (HDD). Throughput
  /// optimized HDD volumes must have a minimum size of 500 GiB and a maximum
  /// size of 16384 GiB.
  ///
  /// *    `sc1` - Cold HDD. Cold HDD volumes must have a minimum size of 500
  /// GiB and a maximum size of 16384 GiB.
  final String volumeType;

  /// For PIOPS volumes, the IOPS per disk.
  final int iops;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see
  /// [Amazon EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html).
  final bool encrypted;

  VolumeConfiguration({
    @required this.mountPoint,
    this.raidLevel,
    @required this.numberOfDisks,
    @required this.size,
    this.volumeType,
    this.iops,
    this.encrypted,
  });
  static VolumeConfiguration fromJson(Map<String, dynamic> json) =>
      VolumeConfiguration();
}

/// Describes a time-based instance's auto scaling schedule. The schedule
/// consists of a set of key-value pairs.
///
/// *   The key is the time period (a UTC hour) and must be an integer from 0 -
/// 23.
///
/// *   The value indicates whether the instance should be online or offline for
/// the specified period, and must be set to "on" or "off"
///
///
/// The default setting for all time periods is off, so you use the following
/// parameters primarily to specify the online periods. You don't have to
/// explicitly specify offline periods unless you want to change an online
/// period to an offline period.
///
/// The following example specifies that the instance should be online for four
/// hours, from UTC 1200 - 1600. It will be off for the remainder of the day.
///
///   `{ "12":"on", "13":"on", "14":"on", "15":"on" }`
class WeeklyAutoScalingSchedule {
  /// The schedule for Monday.
  final Map<String, String> monday;

  /// The schedule for Tuesday.
  final Map<String, String> tuesday;

  /// The schedule for Wednesday.
  final Map<String, String> wednesday;

  /// The schedule for Thursday.
  final Map<String, String> thursday;

  /// The schedule for Friday.
  final Map<String, String> friday;

  /// The schedule for Saturday.
  final Map<String, String> saturday;

  /// The schedule for Sunday.
  final Map<String, String> sunday;

  WeeklyAutoScalingSchedule({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });
  static WeeklyAutoScalingSchedule fromJson(Map<String, dynamic> json) =>
      WeeklyAutoScalingSchedule();
}
