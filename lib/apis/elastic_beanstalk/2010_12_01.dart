import 'package:meta/meta.dart';

/// AWS Elastic Beanstalk
///
/// AWS Elastic Beanstalk makes it easy for you to create, deploy, and manage
/// scalable, fault-tolerant applications running on the Amazon Web Services
/// cloud.
///
/// For more information about this product, go to the
/// [AWS Elastic Beanstalk](http://aws.amazon.com/elasticbeanstalk/) details
/// page. The location of the latest AWS Elastic Beanstalk WSDL is
/// [http://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl](http://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl).
/// To install the Software Development Kits (SDKs), Integrated Development
/// Environment (IDE) Toolkits, and command line tools that enable you to access
/// the API, go to
/// [Tools for Amazon Web Services](http://aws.amazon.com/tools/).
///
///  **Endpoints**
///
/// For a list of region-specific endpoints that AWS Elastic Beanstalk supports,
/// go to
/// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region)
/// in the _Amazon Web Services Glossary_.
class ElasticBeanstalkApi {
  final _client;
  ElasticBeanstalkApi(client)
      : _client = client.configured('Elastic Beanstalk', serializer: 'query');

  /// Cancels in-progress environment configuration update or application
  /// version deployment.
  ///
  /// [environmentId]: This specifies the ID of the environment with the
  /// in-progress update that you want to cancel.
  ///
  /// [environmentName]: This specifies the name of the environment with the
  /// in-progress update that you want to cancel.
  Future<void> abortEnvironmentUpdate(
      {String environmentId, String environmentName}) async {
    await _client.send('AbortEnvironmentUpdate', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
    });
  }

  /// Applies a scheduled managed action immediately. A managed action can be
  /// applied only if its status is `Scheduled`. Get the status and action ID of
  /// a managed action with DescribeEnvironmentManagedActions.
  ///
  /// [environmentName]: The name of the target environment.
  ///
  /// [environmentId]: The environment ID of the target environment.
  ///
  /// [actionId]: The action ID of the scheduled managed action to execute.
  Future<ApplyEnvironmentManagedActionResult> applyEnvironmentManagedAction(
      String actionId,
      {String environmentName,
      String environmentId}) async {
    var response_ = await _client.send('ApplyEnvironmentManagedAction', {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      'ActionId': actionId,
    });
    return ApplyEnvironmentManagedActionResult.fromJson(response_);
  }

  /// Checks if the specified CNAME is available.
  ///
  /// [cnamePrefix]: The prefix used when this CNAME is reserved.
  Future<CheckDnsAvailabilityResultMessage> checkDnsAvailability(
      String cnamePrefix) async {
    var response_ = await _client.send('CheckDNSAvailability', {
      'CNAMEPrefix': cnamePrefix,
    });
    return CheckDnsAvailabilityResultMessage.fromJson(response_);
  }

  /// Create or update a group of environments that each run a separate
  /// component of a single application. Takes a list of version labels that
  /// specify application source bundles for each of the environments to create
  /// or update. The name of each environment and other required information
  /// must be included in the source bundles in an environment manifest named
  /// `env.yaml`. See
  /// [Compose Environments](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html)
  /// for details.
  ///
  /// [applicationName]: The name of the application to which the specified
  /// source bundles belong.
  ///
  /// [groupName]: The name of the group to which the target environments
  /// belong. Specify a group name only if the environment name defined in each
  /// target environment's manifest ends with a + (plus) character. See
  /// [Environment Manifest (env.yaml)](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html)
  /// for details.
  ///
  /// [versionLabels]: A list of version labels, specifying one or more
  /// application source bundles that belong to the target application. Each
  /// source bundle must include an environment manifest that specifies the name
  /// of the environment and the name of the solution stack to use, and
  /// optionally can specify environment links to create.
  Future<EnvironmentDescriptionsMessage> composeEnvironments(
      {String applicationName,
      String groupName,
      List<String> versionLabels}) async {
    var response_ = await _client.send('ComposeEnvironments', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (groupName != null) 'GroupName': groupName,
      if (versionLabels != null) 'VersionLabels': versionLabels,
    });
    return EnvironmentDescriptionsMessage.fromJson(response_);
  }

  ///  Creates an application that has one configuration template named
  /// `default` and no application versions.
  ///
  /// [applicationName]: The name of the application.
  ///
  /// Constraint: This name must be unique within your account. If the specified
  /// name already exists, the action returns an `InvalidParameterValue` error.
  ///
  /// [description]: Describes the application.
  ///
  /// [resourceLifecycleConfig]: Specify an application resource lifecycle
  /// configuration to prevent your application from accumulating too many
  /// versions.
  ///
  /// [tags]: Specifies the tags applied to the application.
  ///
  /// Elastic Beanstalk applies these tags only to the application. Environments
  /// that you create in the application don't inherit the tags.
  Future<ApplicationDescriptionMessage> createApplication(
      String applicationName,
      {String description,
      ApplicationResourceLifecycleConfig resourceLifecycleConfig,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateApplication', {
      'ApplicationName': applicationName,
      if (description != null) 'Description': description,
      if (resourceLifecycleConfig != null)
        'ResourceLifecycleConfig': resourceLifecycleConfig,
      if (tags != null) 'Tags': tags,
    });
    return ApplicationDescriptionMessage.fromJson(response_);
  }

  /// Creates an application version for the specified application. You can
  /// create an application version from a source bundle in Amazon S3, a commit
  /// in AWS CodeCommit, or the output of an AWS CodeBuild build as follows:
  ///
  /// Specify a commit in an AWS CodeCommit repository with
  /// `SourceBuildInformation`.
  ///
  /// Specify a build in an AWS CodeBuild with `SourceBuildInformation` and
  /// `BuildConfiguration`.
  ///
  /// Specify a source bundle in S3 with `SourceBundle`
  ///
  /// Omit both `SourceBuildInformation` and `SourceBundle` to use the default
  /// sample application.
  ///
  ///
  ///
  /// Once you create an application version with a specified Amazon S3 bucket
  /// and key location, you cannot change that Amazon S3 location. If you change
  /// the Amazon S3 location, you receive an exception when you attempt to
  /// launch an environment from the application version.
  ///
  /// [applicationName]:  The name of the application. If no application is
  /// found with this name, and `AutoCreateApplication` is `false`, returns an
  /// `InvalidParameterValue` error.
  ///
  /// [versionLabel]: A label identifying this version.
  ///
  /// Constraint: Must be unique per application. If an application version
  /// already exists with this label for the specified application, AWS Elastic
  /// Beanstalk returns an `InvalidParameterValue` error.
  ///
  /// [description]: Describes this version.
  ///
  /// [sourceBuildInformation]: Specify a commit in an AWS CodeCommit Git
  /// repository to use as the source code for the application version.
  ///
  /// [sourceBundle]: The Amazon S3 bucket and key that identify the location of
  /// the source bundle for this version.
  ///
  ///  The Amazon S3 bucket must be in the same region as the environment.
  ///
  /// Specify a source bundle in S3 or a commit in an AWS CodeCommit repository
  /// (with `SourceBuildInformation`), but not both. If neither `SourceBundle`
  /// nor `SourceBuildInformation` are provided, Elastic Beanstalk uses a sample
  /// application.
  ///
  /// [buildConfiguration]: Settings for an AWS CodeBuild build.
  ///
  /// [autoCreateApplication]: Set to `true` to create an application with the
  /// specified name if it doesn't already exist.
  ///
  /// [process]: Pre-processes and validates the environment manifest
  /// (`env.yaml`) and configuration files (`*.config` files in the
  /// `.ebextensions` folder) in the source bundle. Validating configuration
  /// files can identify issues prior to deploying the application version to an
  /// environment.
  ///
  /// You must turn processing on for application versions that you create using
  /// AWS CodeBuild or AWS CodeCommit. For application versions built from a
  /// source bundle in Amazon S3, processing is optional.
  ///
  ///
  ///
  /// The `Process` option validates Elastic Beanstalk configuration files. It
  /// doesn't validate your application's configuration files, like proxy server
  /// or Docker configuration.
  ///
  /// [tags]: Specifies the tags applied to the application version.
  ///
  /// Elastic Beanstalk applies these tags only to the application version.
  /// Environments that use the application version don't inherit the tags.
  Future<ApplicationVersionDescriptionMessage> createApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      String description,
      SourceBuildInformation sourceBuildInformation,
      S3Location sourceBundle,
      BuildConfiguration buildConfiguration,
      bool autoCreateApplication,
      bool process,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateApplicationVersion', {
      'ApplicationName': applicationName,
      'VersionLabel': versionLabel,
      if (description != null) 'Description': description,
      if (sourceBuildInformation != null)
        'SourceBuildInformation': sourceBuildInformation,
      if (sourceBundle != null) 'SourceBundle': sourceBundle,
      if (buildConfiguration != null) 'BuildConfiguration': buildConfiguration,
      if (autoCreateApplication != null)
        'AutoCreateApplication': autoCreateApplication,
      if (process != null) 'Process': process,
      if (tags != null) 'Tags': tags,
    });
    return ApplicationVersionDescriptionMessage.fromJson(response_);
  }

  /// Creates a configuration template. Templates are associated with a specific
  /// application and are used to deploy different versions of the application
  /// with the same configuration settings.
  ///
  /// Templates aren't associated with any environment. The `EnvironmentName`
  /// response element is always `null`.
  ///
  /// Related Topics
  ///
  /// *    DescribeConfigurationOptions
  ///
  /// *    DescribeConfigurationSettings
  ///
  /// *    ListAvailableSolutionStacks
  ///
  /// [applicationName]: The name of the application to associate with this
  /// configuration template. If no application is found with this name, AWS
  /// Elastic Beanstalk returns an `InvalidParameterValue` error.
  ///
  /// [templateName]: The name of the configuration template.
  ///
  /// Constraint: This name must be unique per application.
  ///
  /// Default: If a configuration template already exists with this name, AWS
  /// Elastic Beanstalk returns an `InvalidParameterValue` error.
  ///
  /// [solutionStackName]: The name of the solution stack used by this
  /// configuration. The solution stack specifies the operating system,
  /// architecture, and application server for a configuration template. It
  /// determines the set of configuration options as well as the possible and
  /// default values.
  ///
  ///  Use ListAvailableSolutionStacks to obtain a list of available solution
  /// stacks.
  ///
  ///  A solution stack name or a source configuration parameter must be
  /// specified, otherwise AWS Elastic Beanstalk returns an
  /// `InvalidParameterValue` error.
  ///
  /// If a solution stack name is not specified and the source configuration
  /// parameter is specified, AWS Elastic Beanstalk uses the same solution stack
  /// as the source configuration template.
  ///
  /// [platformArn]: The ARN of the custom platform.
  ///
  /// [sourceConfiguration]: If specified, AWS Elastic Beanstalk uses the
  /// configuration values from the specified configuration template to create a
  /// new configuration.
  ///
  ///  Values specified in the `OptionSettings` parameter of this call overrides
  /// any values obtained from the `SourceConfiguration`.
  ///
  ///  If no configuration template is found, returns an `InvalidParameterValue`
  /// error.
  ///
  ///  Constraint: If both the solution stack name parameter and the source
  /// configuration parameters are specified, the solution stack of the source
  /// configuration template must match the specified solution stack name or
  /// else AWS Elastic Beanstalk returns an `InvalidParameterCombination` error.
  ///
  /// [environmentId]: The ID of the environment used with this configuration
  /// template.
  ///
  /// [description]: Describes this configuration.
  ///
  /// [optionSettings]: If specified, AWS Elastic Beanstalk sets the specified
  /// configuration option to the requested value. The new value overrides the
  /// value obtained from the solution stack or the source configuration
  /// template.
  ///
  /// [tags]: Specifies the tags applied to the configuration template.
  Future<ConfigurationSettingsDescription> createConfigurationTemplate(
      {@required String applicationName,
      @required String templateName,
      String solutionStackName,
      String platformArn,
      SourceConfiguration sourceConfiguration,
      String environmentId,
      String description,
      List<ConfigurationOptionSetting> optionSettings,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateConfigurationTemplate', {
      'ApplicationName': applicationName,
      'TemplateName': templateName,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (sourceConfiguration != null)
        'SourceConfiguration': sourceConfiguration,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (description != null) 'Description': description,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (tags != null) 'Tags': tags,
    });
    return ConfigurationSettingsDescription.fromJson(response_);
  }

  /// Launches an environment for the specified application using the specified
  /// configuration.
  ///
  /// [applicationName]: The name of the application that contains the version
  /// to be deployed.
  ///
  ///  If no application is found with this name, `CreateEnvironment` returns an
  /// `InvalidParameterValue` error.
  ///
  /// [environmentName]: A unique name for the deployment environment. Used in
  /// the application URL.
  ///
  /// Constraint: Must be from 4 to 40 characters in length. The name can
  /// contain only letters, numbers, and hyphens. It cannot start or end with a
  /// hyphen. This name must be unique within a region in your account. If the
  /// specified name already exists in the region, AWS Elastic Beanstalk returns
  /// an `InvalidParameterValue` error.
  ///
  /// Default: If the CNAME parameter is not specified, the environment name
  /// becomes part of the CNAME, and therefore part of the visible URL for your
  /// application.
  ///
  /// [groupName]: The name of the group to which the target environment
  /// belongs. Specify a group name only if the environment's name is specified
  /// in an environment manifest and not with the environment name parameter.
  /// See
  /// [Environment Manifest (env.yaml)](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html)
  /// for details.
  ///
  /// [description]: Describes this environment.
  ///
  /// [cnamePrefix]: If specified, the environment attempts to use this value as
  /// the prefix for the CNAME. If not specified, the CNAME is generated
  /// automatically by appending a random alphanumeric string to the environment
  /// name.
  ///
  /// [tier]: This specifies the tier to use for creating this environment.
  ///
  /// [tags]: Specifies the tags applied to resources in the environment.
  ///
  /// [versionLabel]: The name of the application version to deploy.
  ///
  ///  If the specified application has no associated application versions, AWS
  /// Elastic Beanstalk `UpdateEnvironment` returns an `InvalidParameterValue`
  /// error.
  ///
  /// Default: If not specified, AWS Elastic Beanstalk attempts to launch the
  /// sample application in the container.
  ///
  /// [templateName]:  The name of the configuration template to use in
  /// deployment. If no configuration template is found with this name, AWS
  /// Elastic Beanstalk returns an `InvalidParameterValue` error.
  ///
  /// [solutionStackName]: This is an alternative to specifying a template name.
  /// If specified, AWS Elastic Beanstalk sets the configuration values to the
  /// default values associated with the specified solution stack.
  ///
  /// For a list of current solution stacks, see
  /// [Elastic Beanstalk Supported Platforms](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html).
  ///
  /// [platformArn]: The ARN of the platform.
  ///
  /// [optionSettings]: If specified, AWS Elastic Beanstalk sets the specified
  /// configuration options to the requested value in the configuration set for
  /// the new environment. These override the values obtained from the solution
  /// stack or the configuration template.
  ///
  /// [optionsToRemove]: A list of custom user-defined configuration options to
  /// remove from the configuration set for this new environment.
  Future<EnvironmentDescription> createEnvironment(String applicationName,
      {String environmentName,
      String groupName,
      String description,
      String cnamePrefix,
      EnvironmentTier tier,
      List<Tag> tags,
      String versionLabel,
      String templateName,
      String solutionStackName,
      String platformArn,
      List<ConfigurationOptionSetting> optionSettings,
      List<OptionSpecification> optionsToRemove}) async {
    var response_ = await _client.send('CreateEnvironment', {
      'ApplicationName': applicationName,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (groupName != null) 'GroupName': groupName,
      if (description != null) 'Description': description,
      if (cnamePrefix != null) 'CNAMEPrefix': cnamePrefix,
      if (tier != null) 'Tier': tier,
      if (tags != null) 'Tags': tags,
      if (versionLabel != null) 'VersionLabel': versionLabel,
      if (templateName != null) 'TemplateName': templateName,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (optionsToRemove != null) 'OptionsToRemove': optionsToRemove,
    });
    return EnvironmentDescription.fromJson(response_);
  }

  /// Create a new version of your custom platform.
  ///
  /// [platformName]: The name of your custom platform.
  ///
  /// [platformVersion]: The number, such as 1.0.2, for the new platform
  /// version.
  ///
  /// [platformDefinitionBundle]: The location of the platform definition
  /// archive in Amazon S3.
  ///
  /// [environmentName]: The name of the builder environment.
  ///
  /// [optionSettings]: The configuration option settings to apply to the
  /// builder environment.
  ///
  /// [tags]: Specifies the tags applied to the new platform version.
  ///
  /// Elastic Beanstalk applies these tags only to the platform version.
  /// Environments that you create using the platform version don't inherit the
  /// tags.
  Future<CreatePlatformVersionResult> createPlatformVersion(
      {@required String platformName,
      @required String platformVersion,
      @required S3Location platformDefinitionBundle,
      String environmentName,
      List<ConfigurationOptionSetting> optionSettings,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreatePlatformVersion', {
      'PlatformName': platformName,
      'PlatformVersion': platformVersion,
      'PlatformDefinitionBundle': platformDefinitionBundle,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (tags != null) 'Tags': tags,
    });
    return CreatePlatformVersionResult.fromJson(response_);
  }

  /// Creates a bucket in Amazon S3 to store application versions, logs, and
  /// other files used by Elastic Beanstalk environments. The Elastic Beanstalk
  /// console and EB CLI call this API the first time you create an environment
  /// in a region. If the storage location already exists,
  /// `CreateStorageLocation` still returns the bucket name but does not create
  /// a new bucket.
  Future<CreateStorageLocationResultMessage> createStorageLocation() async {
    var response_ = await _client.send('CreateStorageLocation', {});
    return CreateStorageLocationResultMessage.fromJson(response_);
  }

  /// Deletes the specified application along with all associated versions and
  /// configurations. The application versions will not be deleted from your
  /// Amazon S3 bucket.
  ///
  ///
  ///
  /// You cannot delete an application that has a running environment.
  ///
  /// [applicationName]: The name of the application to delete.
  ///
  /// [terminateEnvByForce]: When set to true, running environments will be
  /// terminated before deleting the application.
  Future<void> deleteApplication(String applicationName,
      {bool terminateEnvByForce}) async {
    await _client.send('DeleteApplication', {
      'ApplicationName': applicationName,
      if (terminateEnvByForce != null)
        'TerminateEnvByForce': terminateEnvByForce,
    });
  }

  /// Deletes the specified version from the specified application.
  ///
  ///
  ///
  /// You cannot delete an application version that is associated with a running
  /// environment.
  ///
  /// [applicationName]: The name of the application to which the version
  /// belongs.
  ///
  /// [versionLabel]: The label of the version to delete.
  ///
  /// [deleteSourceBundle]: Set to `true` to delete the source bundle from your
  /// storage bucket. Otherwise, the application version is deleted only from
  /// Elastic Beanstalk and the source bundle remains in Amazon S3.
  Future<void> deleteApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      bool deleteSourceBundle}) async {
    await _client.send('DeleteApplicationVersion', {
      'ApplicationName': applicationName,
      'VersionLabel': versionLabel,
      if (deleteSourceBundle != null) 'DeleteSourceBundle': deleteSourceBundle,
    });
  }

  /// Deletes the specified configuration template.
  ///
  ///
  ///
  /// When you launch an environment using a configuration template, the
  /// environment gets a copy of the template. You can delete or modify the
  /// environment's copy of the template without affecting the running
  /// environment.
  ///
  /// [applicationName]: The name of the application to delete the configuration
  /// template from.
  ///
  /// [templateName]: The name of the configuration template to delete.
  Future<void> deleteConfigurationTemplate(
      {@required String applicationName, @required String templateName}) async {
    await _client.send('DeleteConfigurationTemplate', {
      'ApplicationName': applicationName,
      'TemplateName': templateName,
    });
  }

  /// Deletes the draft configuration associated with the running environment.
  ///
  /// Updating a running environment with any configuration changes creates a
  /// draft configuration set. You can get the draft configuration using
  /// DescribeConfigurationSettings while the update is in progress or if the
  /// update fails. The `DeploymentStatus` for the draft configuration indicates
  /// whether the deployment is in process or has failed. The draft
  /// configuration remains in existence until it is deleted with this action.
  ///
  /// [applicationName]: The name of the application the environment is
  /// associated with.
  ///
  /// [environmentName]: The name of the environment to delete the draft
  /// configuration from.
  Future<void> deleteEnvironmentConfiguration(
      {@required String applicationName,
      @required String environmentName}) async {
    await _client.send('DeleteEnvironmentConfiguration', {
      'ApplicationName': applicationName,
      'EnvironmentName': environmentName,
    });
  }

  /// Deletes the specified version of a custom platform.
  ///
  /// [platformArn]: The ARN of the version of the custom platform.
  Future<DeletePlatformVersionResult> deletePlatformVersion(
      {String platformArn}) async {
    var response_ = await _client.send('DeletePlatformVersion', {
      if (platformArn != null) 'PlatformArn': platformArn,
    });
    return DeletePlatformVersionResult.fromJson(response_);
  }

  /// Returns attributes related to AWS Elastic Beanstalk that are associated
  /// with the calling AWS account.
  ///
  /// The result currently has one set of attributes—resource quotas.
  Future<DescribeAccountAttributesResult> describeAccountAttributes() async {
    var response_ = await _client.send('DescribeAccountAttributes', {});
    return DescribeAccountAttributesResult.fromJson(response_);
  }

  /// Retrieve a list of application versions.
  ///
  /// [applicationName]: Specify an application name to show only application
  /// versions for that application.
  ///
  /// [versionLabels]: Specify a version label to show a specific application
  /// version.
  ///
  /// [maxRecords]: For a paginated request. Specify a maximum number of
  /// application versions to include in each response.
  ///
  /// If no `MaxRecords` is specified, all available application versions are
  /// retrieved in a single response.
  ///
  /// [nextToken]: For a paginated request. Specify a token from a previous
  /// response page to retrieve the next response page. All other parameter
  /// values must be identical to the ones specified in the initial request.
  ///
  /// If no `NextToken` is specified, the first page is retrieved.
  Future<ApplicationVersionDescriptionsMessage> describeApplicationVersions(
      {String applicationName,
      List<String> versionLabels,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeApplicationVersions', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (versionLabels != null) 'VersionLabels': versionLabels,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ApplicationVersionDescriptionsMessage.fromJson(response_);
  }

  /// Returns the descriptions of existing applications.
  ///
  /// [applicationNames]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to only include those with the specified names.
  Future<ApplicationDescriptionsMessage> describeApplications(
      {List<String> applicationNames}) async {
    var response_ = await _client.send('DescribeApplications', {
      if (applicationNames != null) 'ApplicationNames': applicationNames,
    });
    return ApplicationDescriptionsMessage.fromJson(response_);
  }

  /// Describes the configuration options that are used in a particular
  /// configuration template or environment, or that a specified solution stack
  /// defines. The description includes the values the options, their default
  /// values, and an indication of the required action on a running environment
  /// if an option value is changed.
  ///
  /// [applicationName]: The name of the application associated with the
  /// configuration template or environment. Only needed if you want to describe
  /// the configuration options associated with either the configuration
  /// template or environment.
  ///
  /// [templateName]: The name of the configuration template whose configuration
  /// options you want to describe.
  ///
  /// [environmentName]: The name of the environment whose configuration options
  /// you want to describe.
  ///
  /// [solutionStackName]: The name of the solution stack whose configuration
  /// options you want to describe.
  ///
  /// [platformArn]: The ARN of the custom platform.
  ///
  /// [options]: If specified, restricts the descriptions to only the specified
  /// options.
  Future<ConfigurationOptionsDescription> describeConfigurationOptions(
      {String applicationName,
      String templateName,
      String environmentName,
      String solutionStackName,
      String platformArn,
      List<OptionSpecification> options}) async {
    var response_ = await _client.send('DescribeConfigurationOptions', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (templateName != null) 'TemplateName': templateName,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (options != null) 'Options': options,
    });
    return ConfigurationOptionsDescription.fromJson(response_);
  }

  /// Returns a description of the settings for the specified configuration set,
  /// that is, either a configuration template or the configuration set
  /// associated with a running environment.
  ///
  /// When describing the settings for the configuration set associated with a
  /// running environment, it is possible to receive two sets of setting
  /// descriptions. One is the deployed configuration set, and the other is a
  /// draft configuration of an environment that is either in the process of
  /// deployment or that failed to deploy.
  ///
  /// Related Topics
  ///
  /// *    DeleteEnvironmentConfiguration
  ///
  /// [applicationName]: The application for the environment or configuration
  /// template.
  ///
  /// [templateName]: The name of the configuration template to describe.
  ///
  ///  Conditional: You must specify either this parameter or an
  /// EnvironmentName, but not both. If you specify both, AWS Elastic Beanstalk
  /// returns an `InvalidParameterCombination` error. If you do not specify
  /// either, AWS Elastic Beanstalk returns a `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to describe.
  ///
  ///  Condition: You must specify either this or a TemplateName, but not both.
  /// If you specify both, AWS Elastic Beanstalk returns an
  /// `InvalidParameterCombination` error. If you do not specify either, AWS
  /// Elastic Beanstalk returns `MissingRequiredParameter` error.
  Future<ConfigurationSettingsDescriptions> describeConfigurationSettings(
      String applicationName,
      {String templateName,
      String environmentName}) async {
    var response_ = await _client.send('DescribeConfigurationSettings', {
      'ApplicationName': applicationName,
      if (templateName != null) 'TemplateName': templateName,
      if (environmentName != null) 'EnvironmentName': environmentName,
    });
    return ConfigurationSettingsDescriptions.fromJson(response_);
  }

  /// Returns information about the overall health of the specified environment.
  /// The **DescribeEnvironmentHealth** operation is only available with AWS
  /// Elastic Beanstalk Enhanced Health.
  ///
  /// [environmentName]: Specify the environment by name.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  ///
  /// [environmentId]: Specify the environment by ID.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  ///
  /// [attributeNames]: Specify the response elements to return. To retrieve all
  /// attributes, set to `All`. If no attribute names are specified, returns the
  /// name of the environment.
  Future<DescribeEnvironmentHealthResult> describeEnvironmentHealth(
      {String environmentName,
      String environmentId,
      List<String> attributeNames}) async {
    var response_ = await _client.send('DescribeEnvironmentHealth', {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (attributeNames != null) 'AttributeNames': attributeNames,
    });
    return DescribeEnvironmentHealthResult.fromJson(response_);
  }

  /// Lists an environment's completed and failed managed actions.
  ///
  /// [environmentId]: The environment ID of the target environment.
  ///
  /// [environmentName]: The name of the target environment.
  ///
  /// [nextToken]: The pagination token returned by a previous request.
  ///
  /// [maxItems]: The maximum number of items to return for a single request.
  Future<DescribeEnvironmentManagedActionHistoryResult>
      describeEnvironmentManagedActionHistory(
          {String environmentId,
          String environmentName,
          String nextToken,
          int maxItems}) async {
    var response_ =
        await _client.send('DescribeEnvironmentManagedActionHistory', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return DescribeEnvironmentManagedActionHistoryResult.fromJson(response_);
  }

  /// Lists an environment's upcoming and in-progress managed actions.
  ///
  /// [environmentName]: The name of the target environment.
  ///
  /// [environmentId]: The environment ID of the target environment.
  ///
  /// [status]: To show only actions with a particular status, specify a status.
  Future<DescribeEnvironmentManagedActionsResult>
      describeEnvironmentManagedActions(
          {String environmentName, String environmentId, String status}) async {
    var response_ = await _client.send('DescribeEnvironmentManagedActions', {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (status != null) 'Status': status,
    });
    return DescribeEnvironmentManagedActionsResult.fromJson(response_);
  }

  /// Returns AWS resources for this environment.
  ///
  /// [environmentId]: The ID of the environment to retrieve AWS resource usage
  /// data.
  ///
  ///  Condition: You must specify either this or an EnvironmentName, or both.
  /// If you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to retrieve AWS resource
  /// usage data.
  ///
  ///  Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  Future<EnvironmentResourceDescriptionsMessage> describeEnvironmentResources(
      {String environmentId, String environmentName}) async {
    var response_ = await _client.send('DescribeEnvironmentResources', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
    });
    return EnvironmentResourceDescriptionsMessage.fromJson(response_);
  }

  /// Returns descriptions for existing environments.
  ///
  /// [applicationName]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to include only those that are associated with this
  /// application.
  ///
  /// [versionLabel]: If specified, AWS Elastic Beanstalk restricts the returned
  /// descriptions to include only those that are associated with this
  /// application version.
  ///
  /// [environmentIds]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to include only those that have the specified IDs.
  ///
  /// [environmentNames]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to include only those that have the specified names.
  ///
  /// [includeDeleted]: Indicates whether to include deleted environments:
  ///
  ///  `true`: Environments that have been deleted after `IncludedDeletedBackTo`
  /// are displayed.
  ///
  ///  `false`: Do not include deleted environments.
  ///
  /// [includedDeletedBackTo]:  If specified when `IncludeDeleted` is set to
  /// `true`, then environments deleted after this date are displayed.
  ///
  /// [maxRecords]: For a paginated request. Specify a maximum number of
  /// environments to include in each response.
  ///
  /// If no `MaxRecords` is specified, all available environments are retrieved
  /// in a single response.
  ///
  /// [nextToken]: For a paginated request. Specify a token from a previous
  /// response page to retrieve the next response page. All other parameter
  /// values must be identical to the ones specified in the initial request.
  ///
  /// If no `NextToken` is specified, the first page is retrieved.
  Future<EnvironmentDescriptionsMessage> describeEnvironments(
      {String applicationName,
      String versionLabel,
      List<String> environmentIds,
      List<String> environmentNames,
      bool includeDeleted,
      DateTime includedDeletedBackTo,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeEnvironments', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (versionLabel != null) 'VersionLabel': versionLabel,
      if (environmentIds != null) 'EnvironmentIds': environmentIds,
      if (environmentNames != null) 'EnvironmentNames': environmentNames,
      if (includeDeleted != null) 'IncludeDeleted': includeDeleted,
      if (includedDeletedBackTo != null)
        'IncludedDeletedBackTo': includedDeletedBackTo,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return EnvironmentDescriptionsMessage.fromJson(response_);
  }

  /// Returns list of event descriptions matching criteria up to the last 6
  /// weeks.
  ///
  ///
  ///
  /// This action returns the most recent 1,000 events from the specified
  /// `NextToken`.
  ///
  /// [applicationName]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to include only those associated with this
  /// application.
  ///
  /// [versionLabel]: If specified, AWS Elastic Beanstalk restricts the returned
  /// descriptions to those associated with this application version.
  ///
  /// [templateName]: If specified, AWS Elastic Beanstalk restricts the returned
  /// descriptions to those that are associated with this environment
  /// configuration.
  ///
  /// [environmentId]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to those associated with this environment.
  ///
  /// [environmentName]: If specified, AWS Elastic Beanstalk restricts the
  /// returned descriptions to those associated with this environment.
  ///
  /// [platformArn]: The ARN of the version of the custom platform.
  ///
  /// [requestId]: If specified, AWS Elastic Beanstalk restricts the described
  /// events to include only those associated with this request ID.
  ///
  /// [severity]: If specified, limits the events returned from this call to
  /// include only those with the specified severity or higher.
  ///
  /// [startTime]: If specified, AWS Elastic Beanstalk restricts the returned
  /// descriptions to those that occur on or after this time.
  ///
  /// [endTime]:  If specified, AWS Elastic Beanstalk restricts the returned
  /// descriptions to those that occur up to, but not including, the `EndTime`.
  ///
  /// [maxRecords]: Specifies the maximum number of events that can be returned,
  /// beginning with the most recent event.
  ///
  /// [nextToken]: Pagination token. If specified, the events return the next
  /// batch of results.
  Future<EventDescriptionsMessage> describeEvents(
      {String applicationName,
      String versionLabel,
      String templateName,
      String environmentId,
      String environmentName,
      String platformArn,
      String requestId,
      String severity,
      DateTime startTime,
      DateTime endTime,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeEvents', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (versionLabel != null) 'VersionLabel': versionLabel,
      if (templateName != null) 'TemplateName': templateName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (requestId != null) 'RequestId': requestId,
      if (severity != null) 'Severity': severity,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return EventDescriptionsMessage.fromJson(response_);
  }

  /// Retrieves detailed information about the health of instances in your AWS
  /// Elastic Beanstalk. This operation requires
  /// [enhanced health reporting](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html).
  ///
  /// [environmentName]: Specify the AWS Elastic Beanstalk environment by name.
  ///
  /// [environmentId]: Specify the AWS Elastic Beanstalk environment by ID.
  ///
  /// [attributeNames]: Specifies the response elements you wish to receive. To
  /// retrieve all attributes, set to `All`. If no attribute names are
  /// specified, returns a list of instances.
  ///
  /// [nextToken]: Specify the pagination token returned by a previous call.
  Future<DescribeInstancesHealthResult> describeInstancesHealth(
      {String environmentName,
      String environmentId,
      List<String> attributeNames,
      String nextToken}) async {
    var response_ = await _client.send('DescribeInstancesHealth', {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (attributeNames != null) 'AttributeNames': attributeNames,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeInstancesHealthResult.fromJson(response_);
  }

  /// Describes the version of the platform.
  ///
  /// [platformArn]: The ARN of the version of the platform.
  Future<DescribePlatformVersionResult> describePlatformVersion(
      {String platformArn}) async {
    var response_ = await _client.send('DescribePlatformVersion', {
      if (platformArn != null) 'PlatformArn': platformArn,
    });
    return DescribePlatformVersionResult.fromJson(response_);
  }

  /// Returns a list of the available solution stack names, with the public
  /// version first and then in reverse chronological order.
  Future<ListAvailableSolutionStacksResultMessage>
      listAvailableSolutionStacks() async {
    var response_ = await _client.send('ListAvailableSolutionStacks', {});
    return ListAvailableSolutionStacksResultMessage.fromJson(response_);
  }

  /// Lists the available platforms.
  ///
  /// [filters]: List only the platforms where the platform member value relates
  /// to one of the supplied values.
  ///
  /// [maxRecords]: The maximum number of platform values returned in one call.
  ///
  /// [nextToken]: The starting index into the remaining list of platforms. Use
  /// the `NextToken` value from a previous `ListPlatformVersion` call.
  Future<ListPlatformVersionsResult> listPlatformVersions(
      {List<PlatformFilter> filters, int maxRecords, String nextToken}) async {
    var response_ = await _client.send('ListPlatformVersions', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListPlatformVersionsResult.fromJson(response_);
  }

  /// Returns the tags applied to an AWS Elastic Beanstalk resource. The
  /// response contains a list of tag key-value pairs.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see
  /// [Tagging Resources in Your Elastic Beanstalk Environment](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html).
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resouce for which a
  /// tag list is requested.
  ///
  /// Must be the ARN of an Elastic Beanstalk environment.
  Future<ResourceTagsDescriptionMessage> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ResourceTagsDescriptionMessage.fromJson(response_);
  }

  /// Deletes and recreates all of the AWS resources (for example: the Auto
  /// Scaling group, load balancer, etc.) for a specified environment and forces
  /// a restart.
  ///
  /// [environmentId]: The ID of the environment to rebuild.
  ///
  ///  Condition: You must specify either this or an EnvironmentName, or both.
  /// If you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to rebuild.
  ///
  ///  Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  Future<void> rebuildEnvironment(
      {String environmentId, String environmentName}) async {
    await _client.send('RebuildEnvironment', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
    });
  }

  /// Initiates a request to compile the specified type of information of the
  /// deployed environment.
  ///
  ///  Setting the `InfoType` to `tail` compiles the last lines from the
  /// application server log files of every Amazon EC2 instance in your
  /// environment.
  ///
  ///  Setting the `InfoType` to `bundle` compresses the application server log
  /// files for every Amazon EC2 instance into a `.zip` file. Legacy and .NET
  /// containers do not support bundle logs.
  ///
  ///  Use RetrieveEnvironmentInfo to obtain the set of logs.
  ///
  /// Related Topics
  ///
  /// *    RetrieveEnvironmentInfo
  ///
  /// [environmentId]: The ID of the environment of the requested data.
  ///
  /// If no such environment is found, `RequestEnvironmentInfo` returns an
  /// `InvalidParameterValue` error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment of the requested data.
  ///
  /// If no such environment is found, `RequestEnvironmentInfo` returns an
  /// `InvalidParameterValue` error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [infoType]: The type of information to request.
  Future<void> requestEnvironmentInfo(String infoType,
      {String environmentId, String environmentName}) async {
    await _client.send('RequestEnvironmentInfo', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      'InfoType': infoType,
    });
  }

  /// Causes the environment to restart the application container server running
  /// on each Amazon EC2 instance.
  ///
  /// [environmentId]: The ID of the environment to restart the server for.
  ///
  ///  Condition: You must specify either this or an EnvironmentName, or both.
  /// If you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to restart the server for.
  ///
  ///  Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  Future<void> restartAppServer(
      {String environmentId, String environmentName}) async {
    await _client.send('RestartAppServer', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
    });
  }

  /// Retrieves the compiled information from a RequestEnvironmentInfo request.
  ///
  /// Related Topics
  ///
  /// *    RequestEnvironmentInfo
  ///
  /// [environmentId]: The ID of the data's environment.
  ///
  /// If no such environment is found, returns an `InvalidParameterValue` error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the data's environment.
  ///
  ///  If no such environment is found, returns an `InvalidParameterValue`
  /// error.
  ///
  ///  Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [infoType]: The type of information to retrieve.
  Future<RetrieveEnvironmentInfoResultMessage> retrieveEnvironmentInfo(
      String infoType,
      {String environmentId,
      String environmentName}) async {
    var response_ = await _client.send('RetrieveEnvironmentInfo', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      'InfoType': infoType,
    });
    return RetrieveEnvironmentInfoResultMessage.fromJson(response_);
  }

  /// Swaps the CNAMEs of two environments.
  ///
  /// [sourceEnvironmentId]: The ID of the source environment.
  ///
  ///  Condition: You must specify at least the `SourceEnvironmentID` or the
  /// `SourceEnvironmentName`. You may also specify both. If you specify the
  /// `SourceEnvironmentId`, you must specify the `DestinationEnvironmentId`.
  ///
  /// [sourceEnvironmentName]: The name of the source environment.
  ///
  ///  Condition: You must specify at least the `SourceEnvironmentID` or the
  /// `SourceEnvironmentName`. You may also specify both. If you specify the
  /// `SourceEnvironmentName`, you must specify the
  /// `DestinationEnvironmentName`.
  ///
  /// [destinationEnvironmentId]: The ID of the destination environment.
  ///
  ///  Condition: You must specify at least the `DestinationEnvironmentID` or
  /// the `DestinationEnvironmentName`. You may also specify both. You must
  /// specify the `SourceEnvironmentId` with the `DestinationEnvironmentId`.
  ///
  /// [destinationEnvironmentName]: The name of the destination environment.
  ///
  ///  Condition: You must specify at least the `DestinationEnvironmentID` or
  /// the `DestinationEnvironmentName`. You may also specify both. You must
  /// specify the `SourceEnvironmentName` with the `DestinationEnvironmentName`.
  Future<void> swapEnvironmentCnamEs(
      {String sourceEnvironmentId,
      String sourceEnvironmentName,
      String destinationEnvironmentId,
      String destinationEnvironmentName}) async {
    await _client.send('SwapEnvironmentCNAMEs', {
      if (sourceEnvironmentId != null)
        'SourceEnvironmentId': sourceEnvironmentId,
      if (sourceEnvironmentName != null)
        'SourceEnvironmentName': sourceEnvironmentName,
      if (destinationEnvironmentId != null)
        'DestinationEnvironmentId': destinationEnvironmentId,
      if (destinationEnvironmentName != null)
        'DestinationEnvironmentName': destinationEnvironmentName,
    });
  }

  /// Terminates the specified environment.
  ///
  /// [environmentId]: The ID of the environment to terminate.
  ///
  ///  Condition: You must specify either this or an EnvironmentName, or both.
  /// If you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to terminate.
  ///
  ///  Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [terminateResources]: Indicates whether the associated AWS resources
  /// should shut down when the environment is terminated:
  ///
  /// *    `true`: The specified environment as well as the associated AWS
  /// resources, such as Auto Scaling group and LoadBalancer, are terminated.
  ///
  /// *    `false`: AWS Elastic Beanstalk resource management is removed from
  /// the environment, but the AWS resources continue to operate.
  ///
  ///
  ///  For more information, see the
  /// [AWS Elastic Beanstalk User Guide.](https://docs.aws.amazon.com/elasticbeanstalk/latest/ug/)
  ///
  ///
  ///  Default: `true`
  ///
  ///  Valid Values: `true` | `false`
  ///
  /// [forceTerminate]: Terminates the target environment even if another
  /// environment in the same group is dependent on it.
  Future<EnvironmentDescription> terminateEnvironment(
      {String environmentId,
      String environmentName,
      bool terminateResources,
      bool forceTerminate}) async {
    var response_ = await _client.send('TerminateEnvironment', {
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (terminateResources != null) 'TerminateResources': terminateResources,
      if (forceTerminate != null) 'ForceTerminate': forceTerminate,
    });
    return EnvironmentDescription.fromJson(response_);
  }

  /// Updates the specified application to have the specified properties.
  ///
  ///
  ///
  /// If a property (for example, `description`) is not provided, the value
  /// remains unchanged. To clear these properties, specify an empty string.
  ///
  /// [applicationName]: The name of the application to update. If no such
  /// application is found, `UpdateApplication` returns an
  /// `InvalidParameterValue` error.
  ///
  /// [description]: A new description for the application.
  ///
  /// Default: If not specified, AWS Elastic Beanstalk does not update the
  /// description.
  Future<ApplicationDescriptionMessage> updateApplication(
      String applicationName,
      {String description}) async {
    var response_ = await _client.send('UpdateApplication', {
      'ApplicationName': applicationName,
      if (description != null) 'Description': description,
    });
    return ApplicationDescriptionMessage.fromJson(response_);
  }

  /// Modifies lifecycle settings for an application.
  ///
  /// [applicationName]: The name of the application.
  ///
  /// [resourceLifecycleConfig]: The lifecycle configuration.
  Future<ApplicationResourceLifecycleDescriptionMessage>
      updateApplicationResourceLifecycle(
          {@required
              String applicationName,
          @required
              ApplicationResourceLifecycleConfig
                  resourceLifecycleConfig}) async {
    var response_ = await _client.send('UpdateApplicationResourceLifecycle', {
      'ApplicationName': applicationName,
      'ResourceLifecycleConfig': resourceLifecycleConfig,
    });
    return ApplicationResourceLifecycleDescriptionMessage.fromJson(response_);
  }

  /// Updates the specified application version to have the specified
  /// properties.
  ///
  ///
  ///
  /// If a property (for example, `description`) is not provided, the value
  /// remains unchanged. To clear properties, specify an empty string.
  ///
  /// [applicationName]: The name of the application associated with this
  /// version.
  ///
  ///  If no application is found with this name, `UpdateApplication` returns an
  /// `InvalidParameterValue` error.
  ///
  /// [versionLabel]: The name of the version to update.
  ///
  /// If no application version is found with this label, `UpdateApplication`
  /// returns an `InvalidParameterValue` error.
  ///
  /// [description]: A new description for this version.
  Future<ApplicationVersionDescriptionMessage> updateApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      String description}) async {
    var response_ = await _client.send('UpdateApplicationVersion', {
      'ApplicationName': applicationName,
      'VersionLabel': versionLabel,
      if (description != null) 'Description': description,
    });
    return ApplicationVersionDescriptionMessage.fromJson(response_);
  }

  /// Updates the specified configuration template to have the specified
  /// properties or configuration option values.
  ///
  ///  If a property (for example, `ApplicationName`) is not provided, its value
  /// remains unchanged. To clear such properties, specify an empty string.
  ///
  /// Related Topics
  ///
  /// *    DescribeConfigurationOptions
  ///
  /// [applicationName]: The name of the application associated with the
  /// configuration template to update.
  ///
  ///  If no application is found with this name, `UpdateConfigurationTemplate`
  /// returns an `InvalidParameterValue` error.
  ///
  /// [templateName]: The name of the configuration template to update.
  ///
  ///  If no configuration template is found with this name,
  /// `UpdateConfigurationTemplate` returns an `InvalidParameterValue` error.
  ///
  /// [description]: A new description for the configuration.
  ///
  /// [optionSettings]: A list of configuration option settings to update with
  /// the new specified option value.
  ///
  /// [optionsToRemove]: A list of configuration options to remove from the
  /// configuration set.
  ///
  ///  Constraint: You can remove only `UserDefined` configuration options.
  Future<ConfigurationSettingsDescription> updateConfigurationTemplate(
      {@required String applicationName,
      @required String templateName,
      String description,
      List<ConfigurationOptionSetting> optionSettings,
      List<OptionSpecification> optionsToRemove}) async {
    var response_ = await _client.send('UpdateConfigurationTemplate', {
      'ApplicationName': applicationName,
      'TemplateName': templateName,
      if (description != null) 'Description': description,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (optionsToRemove != null) 'OptionsToRemove': optionsToRemove,
    });
    return ConfigurationSettingsDescription.fromJson(response_);
  }

  /// Updates the environment description, deploys a new application version,
  /// updates the configuration settings to an entirely new configuration
  /// template, or updates select configuration option values in the running
  /// environment.
  ///
  ///  Attempting to update both the release and configuration is not allowed
  /// and AWS Elastic Beanstalk returns an `InvalidParameterCombination` error.
  ///
  ///  When updating the configuration settings to a new template or individual
  /// settings, a draft configuration is created and
  /// DescribeConfigurationSettings for this environment returns two setting
  /// descriptions with different `DeploymentStatus` values.
  ///
  /// [applicationName]: The name of the application with which the environment
  /// is associated.
  ///
  /// [environmentId]: The ID of the environment to update.
  ///
  /// If no environment with this ID exists, AWS Elastic Beanstalk returns an
  /// `InvalidParameterValue` error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [environmentName]: The name of the environment to update. If no
  /// environment with this name exists, AWS Elastic Beanstalk returns an
  /// `InvalidParameterValue` error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// `MissingRequiredParameter` error.
  ///
  /// [groupName]: The name of the group to which the target environment
  /// belongs. Specify a group name only if the environment's name is specified
  /// in an environment manifest and not with the environment name or
  /// environment ID parameters. See
  /// [Environment Manifest (env.yaml)](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html)
  /// for details.
  ///
  /// [description]: If this parameter is specified, AWS Elastic Beanstalk
  /// updates the description of this environment.
  ///
  /// [tier]: This specifies the tier to use to update the environment.
  ///
  /// Condition: At this time, if you change the tier version, name, or type,
  /// AWS Elastic Beanstalk returns `InvalidParameterValue` error.
  ///
  /// [versionLabel]: If this parameter is specified, AWS Elastic Beanstalk
  /// deploys the named application version to the environment. If no such
  /// application version is found, returns an `InvalidParameterValue` error.
  ///
  /// [templateName]: If this parameter is specified, AWS Elastic Beanstalk
  /// deploys this configuration template to the environment. If no such
  /// configuration template is found, AWS Elastic Beanstalk returns an
  /// `InvalidParameterValue` error.
  ///
  /// [solutionStackName]: This specifies the platform version that the
  /// environment will run after the environment is updated.
  ///
  /// [platformArn]: The ARN of the platform, if used.
  ///
  /// [optionSettings]: If specified, AWS Elastic Beanstalk updates the
  /// configuration set associated with the running environment and sets the
  /// specified configuration options to the requested value.
  ///
  /// [optionsToRemove]: A list of custom user-defined configuration options to
  /// remove from the configuration set for this environment.
  Future<EnvironmentDescription> updateEnvironment(
      {String applicationName,
      String environmentId,
      String environmentName,
      String groupName,
      String description,
      EnvironmentTier tier,
      String versionLabel,
      String templateName,
      String solutionStackName,
      String platformArn,
      List<ConfigurationOptionSetting> optionSettings,
      List<OptionSpecification> optionsToRemove}) async {
    var response_ = await _client.send('UpdateEnvironment', {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (groupName != null) 'GroupName': groupName,
      if (description != null) 'Description': description,
      if (tier != null) 'Tier': tier,
      if (versionLabel != null) 'VersionLabel': versionLabel,
      if (templateName != null) 'TemplateName': templateName,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (optionsToRemove != null) 'OptionsToRemove': optionsToRemove,
    });
    return EnvironmentDescription.fromJson(response_);
  }

  /// Update the list of tags applied to an AWS Elastic Beanstalk resource. Two
  /// lists can be passed: `TagsToAdd` for tags to add or update, and
  /// `TagsToRemove`.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see
  /// [Tagging Resources in Your Elastic Beanstalk Environment](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html).
  ///
  /// If you create a custom IAM user policy to control permission to this
  /// operation, specify one of the following two virtual actions (or both)
  /// instead of the API operation name:
  ///
  /// elasticbeanstalk:AddTags
  ///
  /// Controls permission to call `UpdateTagsForResource` and pass a list of
  /// tags to add in the `TagsToAdd` parameter.
  ///
  /// elasticbeanstalk:RemoveTags
  ///
  /// Controls permission to call `UpdateTagsForResource` and pass a list of tag
  /// keys to remove in the `TagsToRemove` parameter.
  ///
  /// For details about creating a custom user policy, see
  /// [Creating a Custom User Policy](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies).
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resouce to be
  /// updated.
  ///
  /// Must be the ARN of an Elastic Beanstalk environment.
  ///
  /// [tagsToAdd]: A list of tags to add or update.
  ///
  /// If a key of an existing tag is added, the tag's value is updated.
  ///
  /// [tagsToRemove]: A list of tag keys to remove.
  ///
  /// If a tag key doesn't exist, it is silently ignored.
  Future<void> updateTagsForResource(String resourceArn,
      {List<Tag> tagsToAdd, List<String> tagsToRemove}) async {
    await _client.send('UpdateTagsForResource', {
      'ResourceArn': resourceArn,
      if (tagsToAdd != null) 'TagsToAdd': tagsToAdd,
      if (tagsToRemove != null) 'TagsToRemove': tagsToRemove,
    });
  }

  /// Takes a set of configuration settings and either a configuration template
  /// or environment, and determines whether those values are valid.
  ///
  /// This action returns a list of messages indicating any errors or warnings
  /// associated with the selection of option values.
  ///
  /// [applicationName]: The name of the application that the configuration
  /// template or environment belongs to.
  ///
  /// [templateName]: The name of the configuration template to validate the
  /// settings against.
  ///
  /// Condition: You cannot specify both this and an environment name.
  ///
  /// [environmentName]: The name of the environment to validate the settings
  /// against.
  ///
  /// Condition: You cannot specify both this and a configuration template name.
  ///
  /// [optionSettings]: A list of the options and desired values to evaluate.
  Future<ConfigurationSettingsValidationMessages> validateConfigurationSettings(
      {@required String applicationName,
      String templateName,
      String environmentName,
      @required List<ConfigurationOptionSetting> optionSettings}) async {
    var response_ = await _client.send('ValidateConfigurationSettings', {
      'ApplicationName': applicationName,
      if (templateName != null) 'TemplateName': templateName,
      if (environmentName != null) 'EnvironmentName': environmentName,
      'OptionSettings': optionSettings,
    });
    return ConfigurationSettingsValidationMessages.fromJson(response_);
  }
}

/// Describes the properties of an application.
class ApplicationDescription {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The name of the application.
  final String applicationName;

  /// User-defined description of the application.
  final String description;

  /// The date when the application was created.
  final DateTime dateCreated;

  /// The date when the application was last modified.
  final DateTime dateUpdated;

  /// The names of the versions for this application.
  final List<String> versions;

  /// The names of the configuration templates associated with this application.
  final List<String> configurationTemplates;

  /// The lifecycle settings for the application.
  final ApplicationResourceLifecycleConfig resourceLifecycleConfig;

  ApplicationDescription({
    this.applicationArn,
    this.applicationName,
    this.description,
    this.dateCreated,
    this.dateUpdated,
    this.versions,
    this.configurationTemplates,
    this.resourceLifecycleConfig,
  });
  static ApplicationDescription fromJson(Map<String, dynamic> json) =>
      ApplicationDescription(
        applicationArn: json.containsKey('ApplicationArn')
            ? json['ApplicationArn'] as String
            : null,
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateUpdated: json.containsKey('DateUpdated')
            ? DateTime.parse(json['DateUpdated'])
            : null,
        versions: json.containsKey('Versions')
            ? (json['Versions'] as List).map((e) => e as String).toList()
            : null,
        configurationTemplates: json.containsKey('ConfigurationTemplates')
            ? (json['ConfigurationTemplates'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        resourceLifecycleConfig: json.containsKey('ResourceLifecycleConfig')
            ? ApplicationResourceLifecycleConfig.fromJson(
                json['ResourceLifecycleConfig'])
            : null,
      );
}

/// Result message containing a single description of an application.
class ApplicationDescriptionMessage {
  ///  The ApplicationDescription of the application.
  final ApplicationDescription application;

  ApplicationDescriptionMessage({
    this.application,
  });
  static ApplicationDescriptionMessage fromJson(Map<String, dynamic> json) =>
      ApplicationDescriptionMessage(
        application: json.containsKey('Application')
            ? ApplicationDescription.fromJson(json['Application'])
            : null,
      );
}

/// Result message containing a list of application descriptions.
class ApplicationDescriptionsMessage {
  /// This parameter contains a list of ApplicationDescription.
  final List<ApplicationDescription> applications;

  ApplicationDescriptionsMessage({
    this.applications,
  });
  static ApplicationDescriptionsMessage fromJson(Map<String, dynamic> json) =>
      ApplicationDescriptionsMessage(
        applications: json.containsKey('Applications')
            ? (json['Applications'] as List)
                .map((e) => ApplicationDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Application request metrics for an AWS Elastic Beanstalk environment.
class ApplicationMetrics {
  /// The amount of time that the metrics cover (usually 10 seconds). For
  /// example, you might have 5 requests (`request_count`) within the most
  /// recent time slice of 10 seconds (`duration`).
  final int duration;

  /// Average number of requests handled by the web server per second over the
  /// last 10 seconds.
  final int requestCount;

  /// Represents the percentage of requests over the last 10 seconds that
  /// resulted in each type of status code response.
  final StatusCodes statusCodes;

  /// Represents the average latency for the slowest X percent of requests over
  /// the last 10 seconds. Latencies are in seconds with one millisecond
  /// resolution.
  final Latency latency;

  ApplicationMetrics({
    this.duration,
    this.requestCount,
    this.statusCodes,
    this.latency,
  });
  static ApplicationMetrics fromJson(Map<String, dynamic> json) =>
      ApplicationMetrics(
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        requestCount: json.containsKey('RequestCount')
            ? json['RequestCount'] as int
            : null,
        statusCodes: json.containsKey('StatusCodes')
            ? StatusCodes.fromJson(json['StatusCodes'])
            : null,
        latency: json.containsKey('Latency')
            ? Latency.fromJson(json['Latency'])
            : null,
      );
}

/// The resource lifecycle configuration for an application. Defines lifecycle
/// settings for resources that belong to the application, and the service role
/// that Elastic Beanstalk assumes in order to apply lifecycle settings. The
/// version lifecycle configuration defines lifecycle settings for application
/// versions.
class ApplicationResourceLifecycleConfig {
  /// The ARN of an IAM service role that Elastic Beanstalk has permission to
  /// assume.
  ///
  /// The `ServiceRole` property is required the first time that you provide a
  /// `VersionLifecycleConfig` for the application in one of the supporting
  /// calls (`CreateApplication` or `UpdateApplicationResourceLifecycle`). After
  /// you provide it once, in either one of the calls, Elastic Beanstalk
  /// persists the Service Role with the application, and you don't need to
  /// specify it again in subsequent `UpdateApplicationResourceLifecycle` calls.
  /// You can, however, specify it in subsequent calls to change the Service
  /// Role to another value.
  final String serviceRole;

  /// The application version lifecycle configuration.
  final ApplicationVersionLifecycleConfig versionLifecycleConfig;

  ApplicationResourceLifecycleConfig({
    this.serviceRole,
    this.versionLifecycleConfig,
  });
  static ApplicationResourceLifecycleConfig fromJson(
          Map<String, dynamic> json) =>
      ApplicationResourceLifecycleConfig(
        serviceRole: json.containsKey('ServiceRole')
            ? json['ServiceRole'] as String
            : null,
        versionLifecycleConfig: json.containsKey('VersionLifecycleConfig')
            ? ApplicationVersionLifecycleConfig.fromJson(
                json['VersionLifecycleConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ApplicationResourceLifecycleDescriptionMessage {
  /// The name of the application.
  final String applicationName;

  /// The lifecycle configuration.
  final ApplicationResourceLifecycleConfig resourceLifecycleConfig;

  ApplicationResourceLifecycleDescriptionMessage({
    this.applicationName,
    this.resourceLifecycleConfig,
  });
  static ApplicationResourceLifecycleDescriptionMessage fromJson(
          Map<String, dynamic> json) =>
      ApplicationResourceLifecycleDescriptionMessage(
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        resourceLifecycleConfig: json.containsKey('ResourceLifecycleConfig')
            ? ApplicationResourceLifecycleConfig.fromJson(
                json['ResourceLifecycleConfig'])
            : null,
      );
}

/// Describes the properties of an application version.
class ApplicationVersionDescription {
  /// The Amazon Resource Name (ARN) of the application version.
  final String applicationVersionArn;

  /// The name of the application to which the application version belongs.
  final String applicationName;

  /// The description of the application version.
  final String description;

  /// A unique identifier for the application version.
  final String versionLabel;

  /// If the version's source code was retrieved from AWS CodeCommit, the
  /// location of the source code for the application version.
  final SourceBuildInformation sourceBuildInformation;

  /// Reference to the artifact from the AWS CodeBuild build.
  final String buildArn;

  /// The storage location of the application version's source bundle in Amazon
  /// S3.
  final S3Location sourceBundle;

  /// The creation date of the application version.
  final DateTime dateCreated;

  /// The last modified date of the application version.
  final DateTime dateUpdated;

  /// The processing status of the application version. Reflects the state of
  /// the application version during its creation. Many of the values are only
  /// applicable if you specified `True` for the `Process` parameter of the
  /// `CreateApplicationVersion` action. The following list describes the
  /// possible values.
  ///
  /// *    `Unprocessed` – Application version wasn't pre-processed or
  /// validated. Elastic Beanstalk will validate configuration files during
  /// deployment of the application version to an environment.
  ///
  /// *    `Processing` – Elastic Beanstalk is currently processing the
  /// application version.
  ///
  /// *    `Building` – Application version is currently undergoing an AWS
  /// CodeBuild build.
  ///
  /// *    `Processed` – Elastic Beanstalk was successfully pre-processed and
  /// validated.
  ///
  /// *    `Failed` – Either the AWS CodeBuild build failed or configuration
  /// files didn't pass validation. This application version isn't usable.
  final String status;

  ApplicationVersionDescription({
    this.applicationVersionArn,
    this.applicationName,
    this.description,
    this.versionLabel,
    this.sourceBuildInformation,
    this.buildArn,
    this.sourceBundle,
    this.dateCreated,
    this.dateUpdated,
    this.status,
  });
  static ApplicationVersionDescription fromJson(Map<String, dynamic> json) =>
      ApplicationVersionDescription(
        applicationVersionArn: json.containsKey('ApplicationVersionArn')
            ? json['ApplicationVersionArn'] as String
            : null,
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        versionLabel: json.containsKey('VersionLabel')
            ? json['VersionLabel'] as String
            : null,
        sourceBuildInformation: json.containsKey('SourceBuildInformation')
            ? SourceBuildInformation.fromJson(json['SourceBuildInformation'])
            : null,
        buildArn:
            json.containsKey('BuildArn') ? json['BuildArn'] as String : null,
        sourceBundle: json.containsKey('SourceBundle')
            ? S3Location.fromJson(json['SourceBundle'])
            : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateUpdated: json.containsKey('DateUpdated')
            ? DateTime.parse(json['DateUpdated'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Result message wrapping a single description of an application version.
class ApplicationVersionDescriptionMessage {
  ///  The ApplicationVersionDescription of the application version.
  final ApplicationVersionDescription applicationVersion;

  ApplicationVersionDescriptionMessage({
    this.applicationVersion,
  });
  static ApplicationVersionDescriptionMessage fromJson(
          Map<String, dynamic> json) =>
      ApplicationVersionDescriptionMessage(
        applicationVersion: json.containsKey('ApplicationVersion')
            ? ApplicationVersionDescription.fromJson(json['ApplicationVersion'])
            : null,
      );
}

/// Result message wrapping a list of application version descriptions.
class ApplicationVersionDescriptionsMessage {
  /// List of `ApplicationVersionDescription` objects sorted in order of
  /// creation.
  final List<ApplicationVersionDescription> applicationVersions;

  /// In a paginated request, the token that you can pass in a subsequent
  /// request to get the next response page.
  final String nextToken;

  ApplicationVersionDescriptionsMessage({
    this.applicationVersions,
    this.nextToken,
  });
  static ApplicationVersionDescriptionsMessage fromJson(
          Map<String, dynamic> json) =>
      ApplicationVersionDescriptionsMessage(
        applicationVersions: json.containsKey('ApplicationVersions')
            ? (json['ApplicationVersions'] as List)
                .map((e) => ApplicationVersionDescription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The application version lifecycle settings for an application. Defines the
/// rules that Elastic Beanstalk applies to an application's versions in order
/// to avoid hitting the per-region limit for application versions.
///
/// When Elastic Beanstalk deletes an application version from its database, you
/// can no longer deploy that version to an environment. The source bundle
/// remains in S3 unless you configure the rule to delete it.
class ApplicationVersionLifecycleConfig {
  /// Specify a max count rule to restrict the number of application versions
  /// that are retained for an application.
  final MaxCountRule maxCountRule;

  /// Specify a max age rule to restrict the length of time that application
  /// versions are retained for an application.
  final MaxAgeRule maxAgeRule;

  ApplicationVersionLifecycleConfig({
    this.maxCountRule,
    this.maxAgeRule,
  });
  static ApplicationVersionLifecycleConfig fromJson(
          Map<String, dynamic> json) =>
      ApplicationVersionLifecycleConfig(
        maxCountRule: json.containsKey('MaxCountRule')
            ? MaxCountRule.fromJson(json['MaxCountRule'])
            : null,
        maxAgeRule: json.containsKey('MaxAgeRule')
            ? MaxAgeRule.fromJson(json['MaxAgeRule'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The result message containing information about the managed action.
class ApplyEnvironmentManagedActionResult {
  /// The action ID of the managed action.
  final String actionId;

  /// A description of the managed action.
  final String actionDescription;

  /// The type of managed action.
  final String actionType;

  /// The status of the managed action.
  final String status;

  ApplyEnvironmentManagedActionResult({
    this.actionId,
    this.actionDescription,
    this.actionType,
    this.status,
  });
  static ApplyEnvironmentManagedActionResult fromJson(
          Map<String, dynamic> json) =>
      ApplyEnvironmentManagedActionResult(
        actionId:
            json.containsKey('ActionId') ? json['ActionId'] as String : null,
        actionDescription: json.containsKey('ActionDescription')
            ? json['ActionDescription'] as String
            : null,
        actionType: json.containsKey('ActionType')
            ? json['ActionType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Describes an Auto Scaling launch configuration.
class AutoScalingGroup {
  /// The name of the `AutoScalingGroup` .
  final String name;

  AutoScalingGroup({
    this.name,
  });
  static AutoScalingGroup fromJson(Map<String, dynamic> json) =>
      AutoScalingGroup(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Settings for an AWS CodeBuild build.
class BuildConfiguration {
  /// The name of the artifact of the CodeBuild build. If provided, Elastic
  /// Beanstalk stores the build artifact in the S3 location
  /// _S3-bucket_/resources/_application-name_/codebuild/codebuild-_version-label_-_artifact-name_.zip.
  /// If not provided, Elastic Beanstalk stores the build artifact in the S3
  /// location
  /// _S3-bucket_/resources/_application-name_/codebuild/codebuild-_version-label_.zip.
  final String artifactName;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that enables AWS CodeBuild to interact with dependent AWS
  /// services on behalf of the AWS account.
  final String codeBuildServiceRole;

  /// Information about the compute resources the build project will use.
  ///
  /// *    `BUILD_GENERAL1_SMALL: Use up to 3 GB memory and 2 vCPUs for builds`
  ///
  /// *    `BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for builds`
  ///
  /// *    `BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for builds`
  final String computeType;

  /// The ID of the Docker image to use for this build project.
  final String image;

  /// How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// until timing out any related build that does not get marked as completed.
  /// The default is 60 minutes.
  final int timeoutInMinutes;

  BuildConfiguration({
    this.artifactName,
    @required this.codeBuildServiceRole,
    this.computeType,
    @required this.image,
    this.timeoutInMinutes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The builder used to build the custom platform.
class Builder {
  /// The ARN of the builder.
  final String arn;

  Builder({
    this.arn,
  });
  static Builder fromJson(Map<String, dynamic> json) => Builder(
        arn: json.containsKey('ARN') ? json['ARN'] as String : null,
      );
}

/// CPU utilization metrics for an instance.
class CpuUtilization {
  /// Percentage of time that the CPU has spent in the `User` state over the
  /// last 10 seconds.
  final double user;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the `Nice` state over the
  /// last 10 seconds.
  final double nice;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the `System` state over the
  /// last 10 seconds.
  final double system;

  /// Percentage of time that the CPU has spent in the `Idle` state over the
  /// last 10 seconds.
  final double idle;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the `I/O Wait` state over the
  /// last 10 seconds.
  final double ioWait;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the `IRQ` state over the last
  /// 10 seconds.
  final double irq;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the `SoftIRQ` state over the
  /// last 10 seconds.
  final double softIrq;

  /// Available on Windows environments only.
  ///
  /// Percentage of time that the CPU has spent in the `Privileged` state over
  /// the last 10 seconds.
  final double privileged;

  CpuUtilization({
    this.user,
    this.nice,
    this.system,
    this.idle,
    this.ioWait,
    this.irq,
    this.softIrq,
    this.privileged,
  });
  static CpuUtilization fromJson(Map<String, dynamic> json) => CpuUtilization(
        user: json.containsKey('User') ? json['User'] as double : null,
        nice: json.containsKey('Nice') ? json['Nice'] as double : null,
        system: json.containsKey('System') ? json['System'] as double : null,
        idle: json.containsKey('Idle') ? json['Idle'] as double : null,
        ioWait: json.containsKey('IOWait') ? json['IOWait'] as double : null,
        irq: json.containsKey('IRQ') ? json['IRQ'] as double : null,
        softIrq: json.containsKey('SoftIRQ') ? json['SoftIRQ'] as double : null,
        privileged: json.containsKey('Privileged')
            ? json['Privileged'] as double
            : null,
      );
}

/// Indicates if the specified CNAME is available.
class CheckDnsAvailabilityResultMessage {
  /// Indicates if the specified CNAME is available:
  ///
  /// *    `true` : The CNAME is available.
  ///
  /// *    `false` : The CNAME is not available.
  final bool available;

  /// The fully qualified CNAME to reserve when CreateEnvironment is called with
  /// the provided prefix.
  final String fullyQualifiedCname;

  CheckDnsAvailabilityResultMessage({
    this.available,
    this.fullyQualifiedCname,
  });
  static CheckDnsAvailabilityResultMessage fromJson(
          Map<String, dynamic> json) =>
      CheckDnsAvailabilityResultMessage(
        available:
            json.containsKey('Available') ? json['Available'] as bool : null,
        fullyQualifiedCname: json.containsKey('FullyQualifiedCNAME')
            ? json['FullyQualifiedCNAME'] as String
            : null,
      );
}

/// Describes the possible values for a configuration option.
class ConfigurationOptionDescription {
  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// The name of the configuration option.
  final String name;

  /// The default value for this configuration option.
  final String defaultValue;

  /// An indication of which action is required if the value for this
  /// configuration option changes:
  ///
  /// *    `NoInterruption` : There is no interruption to the environment or
  /// application availability.
  ///
  /// *    `RestartEnvironment` : The environment is entirely restarted, all AWS
  /// resources are deleted and recreated, and the environment is unavailable
  /// during the process.
  ///
  /// *    `RestartApplicationServer` : The environment is available the entire
  /// time. However, a short application outage occurs when the application
  /// servers on the running Amazon EC2 instances are restarted.
  final String changeSeverity;

  /// An indication of whether the user defined this configuration option:
  ///
  /// *    `true` : This configuration option was defined by the user. It is a
  /// valid choice for specifying if this as an `Option to Remove` when updating
  /// configuration settings.
  ///
  /// *    `false` : This configuration was not defined by the user.
  ///
  ///
  ///  Constraint: You can remove only `UserDefined` options from a
  /// configuration.
  ///
  ///  Valid Values: `true` | `false`
  final bool userDefined;

  /// An indication of which type of values this option has and whether it is
  /// allowable to select one or more than one of the possible values:
  ///
  /// *    `Scalar` : Values for this option are a single selection from the
  /// possible values, or an unformatted string, or numeric value governed by
  /// the `MIN/MAX/Regex` constraints.
  ///
  /// *    `List` : Values for this option are multiple selections from the
  /// possible values.
  ///
  /// *    `Boolean` : Values for this option are either `true` or `false` .
  ///
  /// *    `Json` : Values for this option are a JSON representation of a
  /// `ConfigDocument`.
  final String valueType;

  /// If specified, values for the configuration option are selected from this
  /// list.
  final List<String> valueOptions;

  /// If specified, the configuration option must be a numeric value greater
  /// than this value.
  final int minValue;

  /// If specified, the configuration option must be a numeric value less than
  /// this value.
  final int maxValue;

  /// If specified, the configuration option must be a string value no longer
  /// than this value.
  final int maxLength;

  /// If specified, the configuration option must be a string value that
  /// satisfies this regular expression.
  final OptionRestrictionRegex regex;

  ConfigurationOptionDescription({
    this.namespace,
    this.name,
    this.defaultValue,
    this.changeSeverity,
    this.userDefined,
    this.valueType,
    this.valueOptions,
    this.minValue,
    this.maxValue,
    this.maxLength,
    this.regex,
  });
  static ConfigurationOptionDescription fromJson(Map<String, dynamic> json) =>
      ConfigurationOptionDescription(
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        changeSeverity: json.containsKey('ChangeSeverity')
            ? json['ChangeSeverity'] as String
            : null,
        userDefined: json.containsKey('UserDefined')
            ? json['UserDefined'] as bool
            : null,
        valueType:
            json.containsKey('ValueType') ? json['ValueType'] as String : null,
        valueOptions: json.containsKey('ValueOptions')
            ? (json['ValueOptions'] as List).map((e) => e as String).toList()
            : null,
        minValue: json.containsKey('MinValue') ? json['MinValue'] as int : null,
        maxValue: json.containsKey('MaxValue') ? json['MaxValue'] as int : null,
        maxLength:
            json.containsKey('MaxLength') ? json['MaxLength'] as int : null,
        regex: json.containsKey('Regex')
            ? OptionRestrictionRegex.fromJson(json['Regex'])
            : null,
      );
}

///  A specification identifying an individual configuration option along with
/// its current value. For a list of possible option values, go to
/// [Option Values](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html)
/// in the _AWS Elastic Beanstalk Developer Guide_.
class ConfigurationOptionSetting {
  /// A unique resource name for a time-based scaling configuration option.
  final String resourceName;

  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// The name of the configuration option.
  final String optionName;

  /// The current value for the configuration option.
  final String value;

  ConfigurationOptionSetting({
    this.resourceName,
    this.namespace,
    this.optionName,
    this.value,
  });
  static ConfigurationOptionSetting fromJson(Map<String, dynamic> json) =>
      ConfigurationOptionSetting(
        resourceName: json.containsKey('ResourceName')
            ? json['ResourceName'] as String
            : null,
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        optionName: json.containsKey('OptionName')
            ? json['OptionName'] as String
            : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the settings for a specified configuration set.
class ConfigurationOptionsDescription {
  /// The name of the solution stack these configuration options belong to.
  final String solutionStackName;

  /// The ARN of the platform.
  final String platformArn;

  ///  A list of ConfigurationOptionDescription.
  final List<ConfigurationOptionDescription> options;

  ConfigurationOptionsDescription({
    this.solutionStackName,
    this.platformArn,
    this.options,
  });
  static ConfigurationOptionsDescription fromJson(Map<String, dynamic> json) =>
      ConfigurationOptionsDescription(
        solutionStackName: json.containsKey('SolutionStackName')
            ? json['SolutionStackName'] as String
            : null,
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        options: json.containsKey('Options')
            ? (json['Options'] as List)
                .map((e) => ConfigurationOptionDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes the settings for a configuration set.
class ConfigurationSettingsDescription {
  /// The name of the solution stack this configuration set uses.
  final String solutionStackName;

  /// The ARN of the platform.
  final String platformArn;

  /// The name of the application associated with this configuration set.
  final String applicationName;

  ///  If not `null`, the name of the configuration template for this
  /// configuration set.
  final String templateName;

  /// Describes this configuration set.
  final String description;

  ///  If not `null`, the name of the environment for this configuration set.
  final String environmentName;

  ///  If this configuration set is associated with an environment, the
  /// `DeploymentStatus` parameter indicates the deployment status of this
  /// configuration set:
  ///
  /// *    `null`: This configuration is not associated with a running
  /// environment.
  ///
  /// *    `pending`: This is a draft configuration that is not deployed to the
  /// associated environment but is in the process of deploying.
  ///
  /// *    `deployed`: This is the configuration that is currently deployed to
  /// the associated running environment.
  ///
  /// *    `failed`: This is a draft configuration that failed to successfully
  /// deploy.
  final String deploymentStatus;

  /// The date (in UTC time) when this configuration set was created.
  final DateTime dateCreated;

  /// The date (in UTC time) when this configuration set was last modified.
  final DateTime dateUpdated;

  /// A list of the configuration options and their values in this configuration
  /// set.
  final List<ConfigurationOptionSetting> optionSettings;

  ConfigurationSettingsDescription({
    this.solutionStackName,
    this.platformArn,
    this.applicationName,
    this.templateName,
    this.description,
    this.environmentName,
    this.deploymentStatus,
    this.dateCreated,
    this.dateUpdated,
    this.optionSettings,
  });
  static ConfigurationSettingsDescription fromJson(Map<String, dynamic> json) =>
      ConfigurationSettingsDescription(
        solutionStackName: json.containsKey('SolutionStackName')
            ? json['SolutionStackName'] as String
            : null,
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        templateName: json.containsKey('TemplateName')
            ? json['TemplateName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
        deploymentStatus: json.containsKey('DeploymentStatus')
            ? json['DeploymentStatus'] as String
            : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateUpdated: json.containsKey('DateUpdated')
            ? DateTime.parse(json['DateUpdated'])
            : null,
        optionSettings: json.containsKey('OptionSettings')
            ? (json['OptionSettings'] as List)
                .map((e) => ConfigurationOptionSetting.fromJson(e))
                .toList()
            : null,
      );
}

/// The results from a request to change the configuration settings of an
/// environment.
class ConfigurationSettingsDescriptions {
  ///  A list of ConfigurationSettingsDescription.
  final List<ConfigurationSettingsDescription> configurationSettings;

  ConfigurationSettingsDescriptions({
    this.configurationSettings,
  });
  static ConfigurationSettingsDescriptions fromJson(
          Map<String, dynamic> json) =>
      ConfigurationSettingsDescriptions(
        configurationSettings: json.containsKey('ConfigurationSettings')
            ? (json['ConfigurationSettings'] as List)
                .map((e) => ConfigurationSettingsDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Provides a list of validation messages.
class ConfigurationSettingsValidationMessages {
  ///  A list of ValidationMessage.
  final List<ValidationMessage> messages;

  ConfigurationSettingsValidationMessages({
    this.messages,
  });
  static ConfigurationSettingsValidationMessages fromJson(
          Map<String, dynamic> json) =>
      ConfigurationSettingsValidationMessages(
        messages: json.containsKey('Messages')
            ? (json['Messages'] as List)
                .map((e) => ValidationMessage.fromJson(e))
                .toList()
            : null,
      );
}

class CreatePlatformVersionResult {
  /// Detailed information about the new version of the custom platform.
  final PlatformSummary platformSummary;

  /// The builder used to create the custom platform.
  final Builder builder;

  CreatePlatformVersionResult({
    this.platformSummary,
    this.builder,
  });
  static CreatePlatformVersionResult fromJson(Map<String, dynamic> json) =>
      CreatePlatformVersionResult(
        platformSummary: json.containsKey('PlatformSummary')
            ? PlatformSummary.fromJson(json['PlatformSummary'])
            : null,
        builder: json.containsKey('Builder')
            ? Builder.fromJson(json['Builder'])
            : null,
      );
}

/// Results of a CreateStorageLocationResult call.
class CreateStorageLocationResultMessage {
  /// The name of the Amazon S3 bucket created.
  final String s3Bucket;

  CreateStorageLocationResultMessage({
    this.s3Bucket,
  });
  static CreateStorageLocationResultMessage fromJson(
          Map<String, dynamic> json) =>
      CreateStorageLocationResultMessage(
        s3Bucket:
            json.containsKey('S3Bucket') ? json['S3Bucket'] as String : null,
      );
}

/// A custom AMI available to platforms.
class CustomAmi {
  /// The type of virtualization used to create the custom AMI.
  final String virtualizationType;

  /// THe ID of the image used to create the custom AMI.
  final String imageId;

  CustomAmi({
    this.virtualizationType,
    this.imageId,
  });
  static CustomAmi fromJson(Map<String, dynamic> json) => CustomAmi(
        virtualizationType: json.containsKey('VirtualizationType')
            ? json['VirtualizationType'] as String
            : null,
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
      );
}

class DeletePlatformVersionResult {
  /// Detailed information about the version of the custom platform.
  final PlatformSummary platformSummary;

  DeletePlatformVersionResult({
    this.platformSummary,
  });
  static DeletePlatformVersionResult fromJson(Map<String, dynamic> json) =>
      DeletePlatformVersionResult(
        platformSummary: json.containsKey('PlatformSummary')
            ? PlatformSummary.fromJson(json['PlatformSummary'])
            : null,
      );
}

/// Information about an application version deployment.
class Deployment {
  /// The version label of the application version in the deployment.
  final String versionLabel;

  /// The ID of the deployment. This number increases by one each time that you
  /// deploy source code or change instance configuration settings.
  final BigInt deploymentId;

  /// The status of the deployment:
  ///
  /// *    `In Progress` : The deployment is in progress.
  ///
  /// *    `Deployed` : The deployment succeeded.
  ///
  /// *    `Failed` : The deployment failed.
  final String status;

  /// For in-progress deployments, the time that the deployment started.
  ///
  /// For completed deployments, the time that the deployment ended.
  final DateTime deploymentTime;

  Deployment({
    this.versionLabel,
    this.deploymentId,
    this.status,
    this.deploymentTime,
  });
  static Deployment fromJson(Map<String, dynamic> json) => Deployment(
        versionLabel: json.containsKey('VersionLabel')
            ? json['VersionLabel'] as String
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? BigInt.from(json['DeploymentId'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        deploymentTime: json.containsKey('DeploymentTime')
            ? DateTime.parse(json['DeploymentTime'])
            : null,
      );
}

class DescribeAccountAttributesResult {
  /// The Elastic Beanstalk resource quotas associated with the calling AWS
  /// account.
  final ResourceQuotas resourceQuotas;

  DescribeAccountAttributesResult({
    this.resourceQuotas,
  });
  static DescribeAccountAttributesResult fromJson(Map<String, dynamic> json) =>
      DescribeAccountAttributesResult(
        resourceQuotas: json.containsKey('ResourceQuotas')
            ? ResourceQuotas.fromJson(json['ResourceQuotas'])
            : null,
      );
}

/// Health details for an AWS Elastic Beanstalk environment.
class DescribeEnvironmentHealthResult {
  /// The environment's name.
  final String environmentName;

  /// The
  /// [health status](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html)
  /// of the environment. For example, `Ok`.
  final String healthStatus;

  /// The environment's operational status. `Ready`, `Launching`, `Updating`,
  /// `Terminating`, or `Terminated`.
  final String status;

  /// The
  /// [health color](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html)
  /// of the environment.
  final String color;

  /// Descriptions of the data that contributed to the environment's current
  /// health status.
  final List<String> causes;

  /// Application request metrics for the environment.
  final ApplicationMetrics applicationMetrics;

  /// Summary health information for the instances in the environment.
  final InstanceHealthSummary instancesHealth;

  /// The date and time that the health information was retrieved.
  final DateTime refreshedAt;

  DescribeEnvironmentHealthResult({
    this.environmentName,
    this.healthStatus,
    this.status,
    this.color,
    this.causes,
    this.applicationMetrics,
    this.instancesHealth,
    this.refreshedAt,
  });
  static DescribeEnvironmentHealthResult fromJson(Map<String, dynamic> json) =>
      DescribeEnvironmentHealthResult(
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
        healthStatus: json.containsKey('HealthStatus')
            ? json['HealthStatus'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        color: json.containsKey('Color') ? json['Color'] as String : null,
        causes: json.containsKey('Causes')
            ? (json['Causes'] as List).map((e) => e as String).toList()
            : null,
        applicationMetrics: json.containsKey('ApplicationMetrics')
            ? ApplicationMetrics.fromJson(json['ApplicationMetrics'])
            : null,
        instancesHealth: json.containsKey('InstancesHealth')
            ? InstanceHealthSummary.fromJson(json['InstancesHealth'])
            : null,
        refreshedAt: json.containsKey('RefreshedAt')
            ? DateTime.parse(json['RefreshedAt'])
            : null,
      );
}

/// A result message containing a list of completed and failed managed actions.
class DescribeEnvironmentManagedActionHistoryResult {
  /// A list of completed and failed managed actions.
  final List<ManagedActionHistoryItem> managedActionHistoryItems;

  /// A pagination token that you pass to
  /// DescribeEnvironmentManagedActionHistory to get the next page of results.
  final String nextToken;

  DescribeEnvironmentManagedActionHistoryResult({
    this.managedActionHistoryItems,
    this.nextToken,
  });
  static DescribeEnvironmentManagedActionHistoryResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEnvironmentManagedActionHistoryResult(
        managedActionHistoryItems: json.containsKey('ManagedActionHistoryItems')
            ? (json['ManagedActionHistoryItems'] as List)
                .map((e) => ManagedActionHistoryItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The result message containing a list of managed actions.
class DescribeEnvironmentManagedActionsResult {
  /// A list of upcoming and in-progress managed actions.
  final List<ManagedAction> managedActions;

  DescribeEnvironmentManagedActionsResult({
    this.managedActions,
  });
  static DescribeEnvironmentManagedActionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEnvironmentManagedActionsResult(
        managedActions: json.containsKey('ManagedActions')
            ? (json['ManagedActions'] as List)
                .map((e) => ManagedAction.fromJson(e))
                .toList()
            : null,
      );
}

/// Detailed health information about the Amazon EC2 instances in an AWS Elastic
/// Beanstalk environment.
class DescribeInstancesHealthResult {
  /// Detailed health information about each instance.
  ///
  /// The output differs slightly between Linux and Windows environments. There
  /// is a difference in the members that are supported under the
  /// `<CPUUtilization>` type.
  final List<SingleInstanceHealth> instanceHealthList;

  /// The date and time that the health information was retrieved.
  final DateTime refreshedAt;

  /// Pagination token for the next page of results, if available.
  final String nextToken;

  DescribeInstancesHealthResult({
    this.instanceHealthList,
    this.refreshedAt,
    this.nextToken,
  });
  static DescribeInstancesHealthResult fromJson(Map<String, dynamic> json) =>
      DescribeInstancesHealthResult(
        instanceHealthList: json.containsKey('InstanceHealthList')
            ? (json['InstanceHealthList'] as List)
                .map((e) => SingleInstanceHealth.fromJson(e))
                .toList()
            : null,
        refreshedAt: json.containsKey('RefreshedAt')
            ? DateTime.parse(json['RefreshedAt'])
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribePlatformVersionResult {
  /// Detailed information about the version of the platform.
  final PlatformDescription platformDescription;

  DescribePlatformVersionResult({
    this.platformDescription,
  });
  static DescribePlatformVersionResult fromJson(Map<String, dynamic> json) =>
      DescribePlatformVersionResult(
        platformDescription: json.containsKey('PlatformDescription')
            ? PlatformDescription.fromJson(json['PlatformDescription'])
            : null,
      );
}

/// Describes the properties of an environment.
class EnvironmentDescription {
  /// The name of this environment.
  final String environmentName;

  /// The ID of this environment.
  final String environmentId;

  /// The name of the application associated with this environment.
  final String applicationName;

  /// The application version deployed in this environment.
  final String versionLabel;

  ///  The name of the `SolutionStack` deployed with this environment.
  final String solutionStackName;

  /// The ARN of the platform.
  final String platformArn;

  /// The name of the configuration template used to originally launch this
  /// environment.
  final String templateName;

  /// Describes this environment.
  final String description;

  /// For load-balanced, autoscaling environments, the URL to the LoadBalancer.
  /// For single-instance environments, the IP address of the instance.
  final String endpointUrl;

  /// The URL to the CNAME for this environment.
  final String cname;

  /// The creation date for this environment.
  final DateTime dateCreated;

  /// The last modified date for this environment.
  final DateTime dateUpdated;

  /// The current operational status of the environment:
  ///
  /// *    `Launching`: Environment is in the process of initial deployment.
  ///
  /// *    `Updating`: Environment is in the process of updating its
  /// configuration settings or application version.
  ///
  /// *    `Ready`: Environment is available to have an action performed on it,
  /// such as update or terminate.
  ///
  /// *    `Terminating`: Environment is in the shut-down process.
  ///
  /// *    `Terminated`: Environment is not running.
  final String status;

  /// Indicates if there is an in-progress environment configuration update or
  /// application version deployment that you can cancel.
  ///
  ///  `true:` There is an update in progress.
  ///
  ///  `false:` There are no updates currently in progress.
  final bool abortableOperationInProgress;

  /// Describes the health status of the environment. AWS Elastic Beanstalk
  /// indicates the failure levels for a running environment:
  ///
  /// *    `Red`: Indicates the environment is not responsive. Occurs when three
  /// or more consecutive failures occur for an environment.
  ///
  /// *    `Yellow`: Indicates that something is wrong. Occurs when two
  /// consecutive failures occur for an environment.
  ///
  /// *    `Green`: Indicates the environment is healthy and fully functional.
  ///
  /// *    `Grey`: Default health for a new environment. The environment is not
  /// fully launched and health checks have not started or health checks are
  /// suspended during an `UpdateEnvironment` or `RestartEnvironment` request.
  ///
  ///
  ///  Default: `Grey`
  final String health;

  /// Returns the health status of the application running in your environment.
  /// For more information, see
  /// [Health Colors and Statuses](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html).
  final String healthStatus;

  /// The description of the AWS resources used by this environment.
  final EnvironmentResourcesDescription resources;

  /// Describes the current tier of this environment.
  final EnvironmentTier tier;

  /// A list of links to other environments in the same group.
  final List<EnvironmentLink> environmentLinks;

  /// The environment's Amazon Resource Name (ARN), which can be used in other
  /// API requests that require an ARN.
  final String environmentArn;

  EnvironmentDescription({
    this.environmentName,
    this.environmentId,
    this.applicationName,
    this.versionLabel,
    this.solutionStackName,
    this.platformArn,
    this.templateName,
    this.description,
    this.endpointUrl,
    this.cname,
    this.dateCreated,
    this.dateUpdated,
    this.status,
    this.abortableOperationInProgress,
    this.health,
    this.healthStatus,
    this.resources,
    this.tier,
    this.environmentLinks,
    this.environmentArn,
  });
  static EnvironmentDescription fromJson(Map<String, dynamic> json) =>
      EnvironmentDescription(
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
        environmentId: json.containsKey('EnvironmentId')
            ? json['EnvironmentId'] as String
            : null,
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        versionLabel: json.containsKey('VersionLabel')
            ? json['VersionLabel'] as String
            : null,
        solutionStackName: json.containsKey('SolutionStackName')
            ? json['SolutionStackName'] as String
            : null,
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        templateName: json.containsKey('TemplateName')
            ? json['TemplateName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        endpointUrl: json.containsKey('EndpointURL')
            ? json['EndpointURL'] as String
            : null,
        cname: json.containsKey('CNAME') ? json['CNAME'] as String : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateUpdated: json.containsKey('DateUpdated')
            ? DateTime.parse(json['DateUpdated'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        abortableOperationInProgress:
            json.containsKey('AbortableOperationInProgress')
                ? json['AbortableOperationInProgress'] as bool
                : null,
        health: json.containsKey('Health') ? json['Health'] as String : null,
        healthStatus: json.containsKey('HealthStatus')
            ? json['HealthStatus'] as String
            : null,
        resources: json.containsKey('Resources')
            ? EnvironmentResourcesDescription.fromJson(json['Resources'])
            : null,
        tier: json.containsKey('Tier')
            ? EnvironmentTier.fromJson(json['Tier'])
            : null,
        environmentLinks: json.containsKey('EnvironmentLinks')
            ? (json['EnvironmentLinks'] as List)
                .map((e) => EnvironmentLink.fromJson(e))
                .toList()
            : null,
        environmentArn: json.containsKey('EnvironmentArn')
            ? json['EnvironmentArn'] as String
            : null,
      );
}

/// Result message containing a list of environment descriptions.
class EnvironmentDescriptionsMessage {
  ///  Returns an EnvironmentDescription list.
  final List<EnvironmentDescription> environments;

  /// In a paginated request, the token that you can pass in a subsequent
  /// request to get the next response page.
  final String nextToken;

  EnvironmentDescriptionsMessage({
    this.environments,
    this.nextToken,
  });
  static EnvironmentDescriptionsMessage fromJson(Map<String, dynamic> json) =>
      EnvironmentDescriptionsMessage(
        environments: json.containsKey('Environments')
            ? (json['Environments'] as List)
                .map((e) => EnvironmentDescription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The information retrieved from the Amazon EC2 instances.
class EnvironmentInfoDescription {
  /// The type of information retrieved.
  final String infoType;

  /// The Amazon EC2 Instance ID for this information.
  final String ec2InstanceId;

  /// The time stamp when this information was retrieved.
  final DateTime sampleTimestamp;

  /// The retrieved information. Currently contains a presigned Amazon S3 URL.
  /// The files are deleted after 15 minutes.
  ///
  /// Anyone in possession of this URL can access the files before they are
  /// deleted. Make the URL available only to trusted parties.
  final String message;

  EnvironmentInfoDescription({
    this.infoType,
    this.ec2InstanceId,
    this.sampleTimestamp,
    this.message,
  });
  static EnvironmentInfoDescription fromJson(Map<String, dynamic> json) =>
      EnvironmentInfoDescription(
        infoType:
            json.containsKey('InfoType') ? json['InfoType'] as String : null,
        ec2InstanceId: json.containsKey('Ec2InstanceId')
            ? json['Ec2InstanceId'] as String
            : null,
        sampleTimestamp: json.containsKey('SampleTimestamp')
            ? DateTime.parse(json['SampleTimestamp'])
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// A link to another environment, defined in the environment's manifest. Links
/// provide connection information in system properties that can be used to
/// connect to another environment in the same group. See
/// [Environment Manifest (env.yaml)](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html)
/// for details.
class EnvironmentLink {
  /// The name of the link.
  final String linkName;

  /// The name of the linked environment (the dependency).
  final String environmentName;

  EnvironmentLink({
    this.linkName,
    this.environmentName,
  });
  static EnvironmentLink fromJson(Map<String, dynamic> json) => EnvironmentLink(
        linkName:
            json.containsKey('LinkName') ? json['LinkName'] as String : null,
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
      );
}

/// Describes the AWS resources in use by this environment. This data is live.
class EnvironmentResourceDescription {
  /// The name of the environment.
  final String environmentName;

  ///  The `AutoScalingGroups` used by this environment.
  final List<AutoScalingGroup> autoScalingGroups;

  /// The Amazon EC2 instances used by this environment.
  final List<Instance> instances;

  /// The Auto Scaling launch configurations in use by this environment.
  final List<LaunchConfiguration> launchConfigurations;

  /// The Amazon EC2 launch templates in use by this environment.
  final List<LaunchTemplate> launchTemplates;

  /// The LoadBalancers in use by this environment.
  final List<LoadBalancer> loadBalancers;

  /// The `AutoScaling` triggers in use by this environment.
  final List<Trigger> triggers;

  /// The queues used by this environment.
  final List<Queue> queues;

  EnvironmentResourceDescription({
    this.environmentName,
    this.autoScalingGroups,
    this.instances,
    this.launchConfigurations,
    this.launchTemplates,
    this.loadBalancers,
    this.triggers,
    this.queues,
  });
  static EnvironmentResourceDescription fromJson(Map<String, dynamic> json) =>
      EnvironmentResourceDescription(
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
        autoScalingGroups: json.containsKey('AutoScalingGroups')
            ? (json['AutoScalingGroups'] as List)
                .map((e) => AutoScalingGroup.fromJson(e))
                .toList()
            : null,
        instances: json.containsKey('Instances')
            ? (json['Instances'] as List)
                .map((e) => Instance.fromJson(e))
                .toList()
            : null,
        launchConfigurations: json.containsKey('LaunchConfigurations')
            ? (json['LaunchConfigurations'] as List)
                .map((e) => LaunchConfiguration.fromJson(e))
                .toList()
            : null,
        launchTemplates: json.containsKey('LaunchTemplates')
            ? (json['LaunchTemplates'] as List)
                .map((e) => LaunchTemplate.fromJson(e))
                .toList()
            : null,
        loadBalancers: json.containsKey('LoadBalancers')
            ? (json['LoadBalancers'] as List)
                .map((e) => LoadBalancer.fromJson(e))
                .toList()
            : null,
        triggers: json.containsKey('Triggers')
            ? (json['Triggers'] as List)
                .map((e) => Trigger.fromJson(e))
                .toList()
            : null,
        queues: json.containsKey('Queues')
            ? (json['Queues'] as List).map((e) => Queue.fromJson(e)).toList()
            : null,
      );
}

/// Result message containing a list of environment resource descriptions.
class EnvironmentResourceDescriptionsMessage {
  ///  A list of EnvironmentResourceDescription.
  final EnvironmentResourceDescription environmentResources;

  EnvironmentResourceDescriptionsMessage({
    this.environmentResources,
  });
  static EnvironmentResourceDescriptionsMessage fromJson(
          Map<String, dynamic> json) =>
      EnvironmentResourceDescriptionsMessage(
        environmentResources: json.containsKey('EnvironmentResources')
            ? EnvironmentResourceDescription.fromJson(
                json['EnvironmentResources'])
            : null,
      );
}

/// Describes the AWS resources in use by this environment. This data is not
/// live data.
class EnvironmentResourcesDescription {
  /// Describes the LoadBalancer.
  final LoadBalancerDescription loadBalancer;

  EnvironmentResourcesDescription({
    this.loadBalancer,
  });
  static EnvironmentResourcesDescription fromJson(Map<String, dynamic> json) =>
      EnvironmentResourcesDescription(
        loadBalancer: json.containsKey('LoadBalancer')
            ? LoadBalancerDescription.fromJson(json['LoadBalancer'])
            : null,
      );
}

/// Describes the properties of an environment tier
class EnvironmentTier {
  /// The name of this environment tier.
  ///
  /// Valid values:
  ///
  /// *   For _Web server tier_ – `WebServer`
  ///
  /// *   For _Worker tier_ – `Worker`
  final String name;

  /// The type of this environment tier.
  ///
  /// Valid values:
  ///
  /// *   For _Web server tier_ – `Standard`
  ///
  /// *   For _Worker tier_ – `SQS/HTTP`
  final String type;

  /// The version of this environment tier. When you don't set a value to it,
  /// Elastic Beanstalk uses the latest compatible worker tier version.
  ///
  ///
  ///
  /// This member is deprecated. Any specific version that you set may become
  /// out of date. We recommend leaving it unspecified.
  final String version;

  EnvironmentTier({
    this.name,
    this.type,
    this.version,
  });
  static EnvironmentTier fromJson(Map<String, dynamic> json) => EnvironmentTier(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an event.
class EventDescription {
  /// The date when the event occurred.
  final DateTime eventDate;

  /// The event message.
  final String message;

  /// The application associated with the event.
  final String applicationName;

  /// The release label for the application version associated with this event.
  final String versionLabel;

  /// The name of the configuration associated with this event.
  final String templateName;

  /// The name of the environment associated with this event.
  final String environmentName;

  /// The ARN of the platform.
  final String platformArn;

  /// The web service request ID for the activity of this event.
  final String requestId;

  /// The severity level of this event.
  final String severity;

  EventDescription({
    this.eventDate,
    this.message,
    this.applicationName,
    this.versionLabel,
    this.templateName,
    this.environmentName,
    this.platformArn,
    this.requestId,
    this.severity,
  });
  static EventDescription fromJson(Map<String, dynamic> json) =>
      EventDescription(
        eventDate: json.containsKey('EventDate')
            ? DateTime.parse(json['EventDate'])
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        applicationName: json.containsKey('ApplicationName')
            ? json['ApplicationName'] as String
            : null,
        versionLabel: json.containsKey('VersionLabel')
            ? json['VersionLabel'] as String
            : null,
        templateName: json.containsKey('TemplateName')
            ? json['TemplateName'] as String
            : null,
        environmentName: json.containsKey('EnvironmentName')
            ? json['EnvironmentName'] as String
            : null,
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        requestId:
            json.containsKey('RequestId') ? json['RequestId'] as String : null,
        severity:
            json.containsKey('Severity') ? json['Severity'] as String : null,
      );
}

/// Result message wrapping a list of event descriptions.
class EventDescriptionsMessage {
  ///  A list of EventDescription.
  final List<EventDescription> events;

  ///  If returned, this indicates that there are more results to obtain. Use
  /// this token in the next DescribeEvents call to get the next batch of
  /// events.
  final String nextToken;

  EventDescriptionsMessage({
    this.events,
    this.nextToken,
  });
  static EventDescriptionsMessage fromJson(Map<String, dynamic> json) =>
      EventDescriptionsMessage(
        events: json.containsKey('Events')
            ? (json['Events'] as List)
                .map((e) => EventDescription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The description of an Amazon EC2 instance.
class Instance {
  /// The ID of the Amazon EC2 instance.
  final String id;

  Instance({
    this.id,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance(
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// Represents summary information about the health of an instance. For more
/// information, see
/// [Health Colors and Statuses](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html).
class InstanceHealthSummary {
  ///  **Grey.** AWS Elastic Beanstalk and the health agent are reporting no
  /// data on an instance.
  final int noData;

  ///  **Grey.** AWS Elastic Beanstalk and the health agent are reporting an
  /// insufficient amount of data on an instance.
  final int unknown;

  ///  **Grey.** An operation is in progress on an instance within the command
  /// timeout.
  final int pending;

  ///  **Green.** An instance is passing health checks and the health agent is
  /// not reporting any problems.
  final int ok;

  ///  **Green.** An operation is in progress on an instance.
  final int info;

  ///  **Yellow.** The health agent is reporting a moderate number of request
  /// failures or other issues for an instance or environment.
  final int warning;

  ///  **Red.** The health agent is reporting a high number of request failures
  /// or other issues for an instance or environment.
  final int degraded;

  ///  **Red.** The health agent is reporting a very high number of request
  /// failures or other issues for an instance or environment.
  final int severe;

  InstanceHealthSummary({
    this.noData,
    this.unknown,
    this.pending,
    this.ok,
    this.info,
    this.warning,
    this.degraded,
    this.severe,
  });
  static InstanceHealthSummary fromJson(Map<String, dynamic> json) =>
      InstanceHealthSummary(
        noData: json.containsKey('NoData') ? json['NoData'] as int : null,
        unknown: json.containsKey('Unknown') ? json['Unknown'] as int : null,
        pending: json.containsKey('Pending') ? json['Pending'] as int : null,
        ok: json.containsKey('Ok') ? json['Ok'] as int : null,
        info: json.containsKey('Info') ? json['Info'] as int : null,
        warning: json.containsKey('Warning') ? json['Warning'] as int : null,
        degraded: json.containsKey('Degraded') ? json['Degraded'] as int : null,
        severe: json.containsKey('Severe') ? json['Severe'] as int : null,
      );
}

/// Represents the average latency for the slowest X percent of requests over
/// the last 10 seconds.
class Latency {
  /// The average latency for the slowest 0.1 percent of requests over the last
  /// 10 seconds.
  final double p999;

  /// The average latency for the slowest 1 percent of requests over the last 10
  /// seconds.
  final double p99;

  /// The average latency for the slowest 5 percent of requests over the last 10
  /// seconds.
  final double p95;

  /// The average latency for the slowest 10 percent of requests over the last
  /// 10 seconds.
  final double p90;

  /// The average latency for the slowest 15 percent of requests over the last
  /// 10 seconds.
  final double p85;

  /// The average latency for the slowest 25 percent of requests over the last
  /// 10 seconds.
  final double p75;

  /// The average latency for the slowest 50 percent of requests over the last
  /// 10 seconds.
  final double p50;

  /// The average latency for the slowest 90 percent of requests over the last
  /// 10 seconds.
  final double p10;

  Latency({
    this.p999,
    this.p99,
    this.p95,
    this.p90,
    this.p85,
    this.p75,
    this.p50,
    this.p10,
  });
  static Latency fromJson(Map<String, dynamic> json) => Latency(
        p999: json.containsKey('P999') ? json['P999'] as double : null,
        p99: json.containsKey('P99') ? json['P99'] as double : null,
        p95: json.containsKey('P95') ? json['P95'] as double : null,
        p90: json.containsKey('P90') ? json['P90'] as double : null,
        p85: json.containsKey('P85') ? json['P85'] as double : null,
        p75: json.containsKey('P75') ? json['P75'] as double : null,
        p50: json.containsKey('P50') ? json['P50'] as double : null,
        p10: json.containsKey('P10') ? json['P10'] as double : null,
      );
}

/// Describes an Auto Scaling launch configuration.
class LaunchConfiguration {
  /// The name of the launch configuration.
  final String name;

  LaunchConfiguration({
    this.name,
  });
  static LaunchConfiguration fromJson(Map<String, dynamic> json) =>
      LaunchConfiguration(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Describes an Amazon EC2 launch template.
class LaunchTemplate {
  /// The ID of the launch template.
  final String id;

  LaunchTemplate({
    this.id,
  });
  static LaunchTemplate fromJson(Map<String, dynamic> json) => LaunchTemplate(
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// A list of available AWS Elastic Beanstalk solution stacks.
class ListAvailableSolutionStacksResultMessage {
  /// A list of available solution stacks.
  final List<String> solutionStacks;

  ///  A list of available solution stacks and their SolutionStackDescription.
  final List<SolutionStackDescription> solutionStackDetails;

  ListAvailableSolutionStacksResultMessage({
    this.solutionStacks,
    this.solutionStackDetails,
  });
  static ListAvailableSolutionStacksResultMessage fromJson(
          Map<String, dynamic> json) =>
      ListAvailableSolutionStacksResultMessage(
        solutionStacks: json.containsKey('SolutionStacks')
            ? (json['SolutionStacks'] as List).map((e) => e as String).toList()
            : null,
        solutionStackDetails: json.containsKey('SolutionStackDetails')
            ? (json['SolutionStackDetails'] as List)
                .map((e) => SolutionStackDescription.fromJson(e))
                .toList()
            : null,
      );
}

class ListPlatformVersionsResult {
  /// Detailed information about the platforms.
  final List<PlatformSummary> platformSummaryList;

  /// The starting index into the remaining list of platforms. if this value is
  /// not `null`, you can use it in a subsequent `ListPlatformVersion` call.
  final String nextToken;

  ListPlatformVersionsResult({
    this.platformSummaryList,
    this.nextToken,
  });
  static ListPlatformVersionsResult fromJson(Map<String, dynamic> json) =>
      ListPlatformVersionsResult(
        platformSummaryList: json.containsKey('PlatformSummaryList')
            ? (json['PlatformSummaryList'] as List)
                .map((e) => PlatformSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes the properties of a Listener for the LoadBalancer.
class Listener {
  /// The protocol that is used by the Listener.
  final String protocol;

  /// The port that is used by the Listener.
  final int port;

  Listener({
    this.protocol,
    this.port,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener(
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
      );
}

/// Describes a LoadBalancer.
class LoadBalancer {
  /// The name of the LoadBalancer.
  final String name;

  LoadBalancer({
    this.name,
  });
  static LoadBalancer fromJson(Map<String, dynamic> json) => LoadBalancer(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Describes the details of a LoadBalancer.
class LoadBalancerDescription {
  /// The name of the LoadBalancer.
  final String loadBalancerName;

  /// The domain name of the LoadBalancer.
  final String domain;

  /// A list of Listeners used by the LoadBalancer.
  final List<Listener> listeners;

  LoadBalancerDescription({
    this.loadBalancerName,
    this.domain,
    this.listeners,
  });
  static LoadBalancerDescription fromJson(Map<String, dynamic> json) =>
      LoadBalancerDescription(
        loadBalancerName: json.containsKey('LoadBalancerName')
            ? json['LoadBalancerName'] as String
            : null,
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        listeners: json.containsKey('Listeners')
            ? (json['Listeners'] as List)
                .map((e) => Listener.fromJson(e))
                .toList()
            : null,
      );
}

/// The record of an upcoming or in-progress managed action.
class ManagedAction {
  /// A unique identifier for the managed action.
  final String actionId;

  /// A description of the managed action.
  final String actionDescription;

  /// The type of managed action.
  final String actionType;

  /// The status of the managed action. If the action is `Scheduled`, you can
  /// apply it immediately with ApplyEnvironmentManagedAction.
  final String status;

  /// The start time of the maintenance window in which the managed action will
  /// execute.
  final DateTime windowStartTime;

  ManagedAction({
    this.actionId,
    this.actionDescription,
    this.actionType,
    this.status,
    this.windowStartTime,
  });
  static ManagedAction fromJson(Map<String, dynamic> json) => ManagedAction(
        actionId:
            json.containsKey('ActionId') ? json['ActionId'] as String : null,
        actionDescription: json.containsKey('ActionDescription')
            ? json['ActionDescription'] as String
            : null,
        actionType: json.containsKey('ActionType')
            ? json['ActionType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        windowStartTime: json.containsKey('WindowStartTime')
            ? DateTime.parse(json['WindowStartTime'])
            : null,
      );
}

/// The record of a completed or failed managed action.
class ManagedActionHistoryItem {
  /// A unique identifier for the managed action.
  final String actionId;

  /// The type of the managed action.
  final String actionType;

  /// A description of the managed action.
  final String actionDescription;

  /// If the action failed, the type of failure.
  final String failureType;

  /// The status of the action.
  final String status;

  /// If the action failed, a description of the failure.
  final String failureDescription;

  /// The date and time that the action started executing.
  final DateTime executedTime;

  /// The date and time that the action finished executing.
  final DateTime finishedTime;

  ManagedActionHistoryItem({
    this.actionId,
    this.actionType,
    this.actionDescription,
    this.failureType,
    this.status,
    this.failureDescription,
    this.executedTime,
    this.finishedTime,
  });
  static ManagedActionHistoryItem fromJson(Map<String, dynamic> json) =>
      ManagedActionHistoryItem(
        actionId:
            json.containsKey('ActionId') ? json['ActionId'] as String : null,
        actionType: json.containsKey('ActionType')
            ? json['ActionType'] as String
            : null,
        actionDescription: json.containsKey('ActionDescription')
            ? json['ActionDescription'] as String
            : null,
        failureType: json.containsKey('FailureType')
            ? json['FailureType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        failureDescription: json.containsKey('FailureDescription')
            ? json['FailureDescription'] as String
            : null,
        executedTime: json.containsKey('ExecutedTime')
            ? DateTime.parse(json['ExecutedTime'])
            : null,
        finishedTime: json.containsKey('FinishedTime')
            ? DateTime.parse(json['FinishedTime'])
            : null,
      );
}

/// A lifecycle rule that deletes application versions after the specified
/// number of days.
class MaxAgeRule {
  /// Specify `true` to apply the rule, or `false` to disable it.
  final bool enabled;

  /// Specify the number of days to retain an application versions.
  final int maxAgeInDays;

  /// Set to `true` to delete a version's source bundle from Amazon S3 when
  /// Elastic Beanstalk deletes the application version.
  final bool deleteSourceFromS3;

  MaxAgeRule({
    @required this.enabled,
    this.maxAgeInDays,
    this.deleteSourceFromS3,
  });
  static MaxAgeRule fromJson(Map<String, dynamic> json) => MaxAgeRule(
        enabled: json['Enabled'] as bool,
        maxAgeInDays: json.containsKey('MaxAgeInDays')
            ? json['MaxAgeInDays'] as int
            : null,
        deleteSourceFromS3: json.containsKey('DeleteSourceFromS3')
            ? json['DeleteSourceFromS3'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A lifecycle rule that deletes the oldest application version when the
/// maximum count is exceeded.
class MaxCountRule {
  /// Specify `true` to apply the rule, or `false` to disable it.
  final bool enabled;

  /// Specify the maximum number of application versions to retain.
  final int maxCount;

  /// Set to `true` to delete a version's source bundle from Amazon S3 when
  /// Elastic Beanstalk deletes the application version.
  final bool deleteSourceFromS3;

  MaxCountRule({
    @required this.enabled,
    this.maxCount,
    this.deleteSourceFromS3,
  });
  static MaxCountRule fromJson(Map<String, dynamic> json) => MaxCountRule(
        enabled: json['Enabled'] as bool,
        maxCount: json.containsKey('MaxCount') ? json['MaxCount'] as int : null,
        deleteSourceFromS3: json.containsKey('DeleteSourceFromS3')
            ? json['DeleteSourceFromS3'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A regular expression representing a restriction on a string configuration
/// option value.
class OptionRestrictionRegex {
  /// The regular expression pattern that a string configuration option value
  /// with this restriction must match.
  final String pattern;

  /// A unique name representing this regular expression.
  final String label;

  OptionRestrictionRegex({
    this.pattern,
    this.label,
  });
  static OptionRestrictionRegex fromJson(Map<String, dynamic> json) =>
      OptionRestrictionRegex(
        pattern: json.containsKey('Pattern') ? json['Pattern'] as String : null,
        label: json.containsKey('Label') ? json['Label'] as String : null,
      );
}

/// A specification identifying an individual configuration option.
class OptionSpecification {
  /// A unique resource name for a time-based scaling configuration option.
  final String resourceName;

  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// The name of the configuration option.
  final String optionName;

  OptionSpecification({
    this.resourceName,
    this.namespace,
    this.optionName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Detailed information about a platform.
class PlatformDescription {
  /// The ARN of the platform.
  final String platformArn;

  /// The AWS account ID of the person who created the platform.
  final String platformOwner;

  /// The name of the platform.
  final String platformName;

  /// The version of the platform.
  final String platformVersion;

  /// The name of the solution stack used by the platform.
  final String solutionStackName;

  /// The status of the platform.
  final String platformStatus;

  /// The date when the platform was created.
  final DateTime dateCreated;

  /// The date when the platform was last updated.
  final DateTime dateUpdated;

  /// The category of the platform.
  final String platformCategory;

  /// The description of the platform.
  final String description;

  /// Information about the maintainer of the platform.
  final String maintainer;

  /// The operating system used by the platform.
  final String operatingSystemName;

  /// The version of the operating system used by the platform.
  final String operatingSystemVersion;

  /// The programming languages supported by the platform.
  final List<PlatformProgrammingLanguage> programmingLanguages;

  /// The frameworks supported by the platform.
  final List<PlatformFramework> frameworks;

  /// The custom AMIs supported by the platform.
  final List<CustomAmi> customAmiList;

  /// The tiers supported by the platform.
  final List<String> supportedTierList;

  /// The additions supported by the platform.
  final List<String> supportedAddonList;

  PlatformDescription({
    this.platformArn,
    this.platformOwner,
    this.platformName,
    this.platformVersion,
    this.solutionStackName,
    this.platformStatus,
    this.dateCreated,
    this.dateUpdated,
    this.platformCategory,
    this.description,
    this.maintainer,
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.programmingLanguages,
    this.frameworks,
    this.customAmiList,
    this.supportedTierList,
    this.supportedAddonList,
  });
  static PlatformDescription fromJson(Map<String, dynamic> json) =>
      PlatformDescription(
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        platformOwner: json.containsKey('PlatformOwner')
            ? json['PlatformOwner'] as String
            : null,
        platformName: json.containsKey('PlatformName')
            ? json['PlatformName'] as String
            : null,
        platformVersion: json.containsKey('PlatformVersion')
            ? json['PlatformVersion'] as String
            : null,
        solutionStackName: json.containsKey('SolutionStackName')
            ? json['SolutionStackName'] as String
            : null,
        platformStatus: json.containsKey('PlatformStatus')
            ? json['PlatformStatus'] as String
            : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateUpdated: json.containsKey('DateUpdated')
            ? DateTime.parse(json['DateUpdated'])
            : null,
        platformCategory: json.containsKey('PlatformCategory')
            ? json['PlatformCategory'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        maintainer: json.containsKey('Maintainer')
            ? json['Maintainer'] as String
            : null,
        operatingSystemName: json.containsKey('OperatingSystemName')
            ? json['OperatingSystemName'] as String
            : null,
        operatingSystemVersion: json.containsKey('OperatingSystemVersion')
            ? json['OperatingSystemVersion'] as String
            : null,
        programmingLanguages: json.containsKey('ProgrammingLanguages')
            ? (json['ProgrammingLanguages'] as List)
                .map((e) => PlatformProgrammingLanguage.fromJson(e))
                .toList()
            : null,
        frameworks: json.containsKey('Frameworks')
            ? (json['Frameworks'] as List)
                .map((e) => PlatformFramework.fromJson(e))
                .toList()
            : null,
        customAmiList: json.containsKey('CustomAmiList')
            ? (json['CustomAmiList'] as List)
                .map((e) => CustomAmi.fromJson(e))
                .toList()
            : null,
        supportedTierList: json.containsKey('SupportedTierList')
            ? (json['SupportedTierList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        supportedAddonList: json.containsKey('SupportedAddonList')
            ? (json['SupportedAddonList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Specify criteria to restrict the results when listing custom platforms.
///
/// The filter is evaluated as the expression:
///
///  `Type` `Operator` `Values[i]`
class PlatformFilter {
  /// The custom platform attribute to which the filter values are applied.
  ///
  /// Valid Values: `PlatformName` | `PlatformVersion` | `PlatformStatus` |
  /// `PlatformOwner`
  final String type;

  /// The operator to apply to the `Type` with each of the `Values`.
  ///
  ///  Valid Values: `=` (equal to) | `!=` (not equal to) | `<` (less than) |
  /// `<=` (less than or equal to) | `>` (greater than) | `>=` (greater than or
  /// equal to) | `contains` | `begins_with` | `ends_with`
  final String operator;

  /// The list of values applied to the custom platform attribute.
  final List<String> values;

  PlatformFilter({
    this.type,
    this.operator,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A framework supported by the custom platform.
class PlatformFramework {
  /// The name of the framework.
  final String name;

  /// The version of the framework.
  final String version;

  PlatformFramework({
    this.name,
    this.version,
  });
  static PlatformFramework fromJson(Map<String, dynamic> json) =>
      PlatformFramework(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
}

/// A programming language supported by the platform.
class PlatformProgrammingLanguage {
  /// The name of the programming language.
  final String name;

  /// The version of the programming language.
  final String version;

  PlatformProgrammingLanguage({
    this.name,
    this.version,
  });
  static PlatformProgrammingLanguage fromJson(Map<String, dynamic> json) =>
      PlatformProgrammingLanguage(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
}

/// Detailed information about a platform.
class PlatformSummary {
  /// The ARN of the platform.
  final String platformArn;

  /// The AWS account ID of the person who created the platform.
  final String platformOwner;

  /// The status of the platform. You can create an environment from the
  /// platform once it is ready.
  final String platformStatus;

  /// The category of platform.
  final String platformCategory;

  /// The operating system used by the platform.
  final String operatingSystemName;

  /// The version of the operating system used by the platform.
  final String operatingSystemVersion;

  /// The tiers in which the platform runs.
  final List<String> supportedTierList;

  /// The additions associated with the platform.
  final List<String> supportedAddonList;

  PlatformSummary({
    this.platformArn,
    this.platformOwner,
    this.platformStatus,
    this.platformCategory,
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.supportedTierList,
    this.supportedAddonList,
  });
  static PlatformSummary fromJson(Map<String, dynamic> json) => PlatformSummary(
        platformArn: json.containsKey('PlatformArn')
            ? json['PlatformArn'] as String
            : null,
        platformOwner: json.containsKey('PlatformOwner')
            ? json['PlatformOwner'] as String
            : null,
        platformStatus: json.containsKey('PlatformStatus')
            ? json['PlatformStatus'] as String
            : null,
        platformCategory: json.containsKey('PlatformCategory')
            ? json['PlatformCategory'] as String
            : null,
        operatingSystemName: json.containsKey('OperatingSystemName')
            ? json['OperatingSystemName'] as String
            : null,
        operatingSystemVersion: json.containsKey('OperatingSystemVersion')
            ? json['OperatingSystemVersion'] as String
            : null,
        supportedTierList: json.containsKey('SupportedTierList')
            ? (json['SupportedTierList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        supportedAddonList: json.containsKey('SupportedAddonList')
            ? (json['SupportedAddonList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Describes a queue.
class Queue {
  /// The name of the queue.
  final String name;

  /// The URL of the queue.
  final String url;

  Queue({
    this.name,
    this.url,
  });
  static Queue fromJson(Map<String, dynamic> json) => Queue(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        url: json.containsKey('URL') ? json['URL'] as String : null,
      );
}

/// The AWS Elastic Beanstalk quota information for a single resource type in an
/// AWS account. It reflects the resource's limits for this account.
class ResourceQuota {
  /// The maximum number of instances of this Elastic Beanstalk resource type
  /// that an AWS account can use.
  final int maximum;

  ResourceQuota({
    this.maximum,
  });
  static ResourceQuota fromJson(Map<String, dynamic> json) => ResourceQuota(
        maximum: json.containsKey('Maximum') ? json['Maximum'] as int : null,
      );
}

/// A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS
/// account. They reflect Elastic Beanstalk resource limits for this account.
class ResourceQuotas {
  /// The quota for applications in the AWS account.
  final ResourceQuota applicationQuota;

  /// The quota for application versions in the AWS account.
  final ResourceQuota applicationVersionQuota;

  /// The quota for environments in the AWS account.
  final ResourceQuota environmentQuota;

  /// The quota for configuration templates in the AWS account.
  final ResourceQuota configurationTemplateQuota;

  /// The quota for custom platforms in the AWS account.
  final ResourceQuota customPlatformQuota;

  ResourceQuotas({
    this.applicationQuota,
    this.applicationVersionQuota,
    this.environmentQuota,
    this.configurationTemplateQuota,
    this.customPlatformQuota,
  });
  static ResourceQuotas fromJson(Map<String, dynamic> json) => ResourceQuotas(
        applicationQuota: json.containsKey('ApplicationQuota')
            ? ResourceQuota.fromJson(json['ApplicationQuota'])
            : null,
        applicationVersionQuota: json.containsKey('ApplicationVersionQuota')
            ? ResourceQuota.fromJson(json['ApplicationVersionQuota'])
            : null,
        environmentQuota: json.containsKey('EnvironmentQuota')
            ? ResourceQuota.fromJson(json['EnvironmentQuota'])
            : null,
        configurationTemplateQuota:
            json.containsKey('ConfigurationTemplateQuota')
                ? ResourceQuota.fromJson(json['ConfigurationTemplateQuota'])
                : null,
        customPlatformQuota: json.containsKey('CustomPlatformQuota')
            ? ResourceQuota.fromJson(json['CustomPlatformQuota'])
            : null,
      );
}

class ResourceTagsDescriptionMessage {
  /// The Amazon Resource Name (ARN) of the resouce for which a tag list was
  /// requested.
  final String resourceArn;

  /// A list of tag key-value pairs.
  final List<Tag> resourceTags;

  ResourceTagsDescriptionMessage({
    this.resourceArn,
    this.resourceTags,
  });
  static ResourceTagsDescriptionMessage fromJson(Map<String, dynamic> json) =>
      ResourceTagsDescriptionMessage(
        resourceArn: json.containsKey('ResourceArn')
            ? json['ResourceArn'] as String
            : null,
        resourceTags: json.containsKey('ResourceTags')
            ? (json['ResourceTags'] as List)
                .map((e) => Tag.fromJson(e))
                .toList()
            : null,
      );
}

/// Result message containing a description of the requested environment info.
class RetrieveEnvironmentInfoResultMessage {
  ///  The EnvironmentInfoDescription of the environment.
  final List<EnvironmentInfoDescription> environmentInfo;

  RetrieveEnvironmentInfoResultMessage({
    this.environmentInfo,
  });
  static RetrieveEnvironmentInfoResultMessage fromJson(
          Map<String, dynamic> json) =>
      RetrieveEnvironmentInfoResultMessage(
        environmentInfo: json.containsKey('EnvironmentInfo')
            ? (json['EnvironmentInfo'] as List)
                .map((e) => EnvironmentInfoDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// The bucket and key of an item stored in Amazon S3.
class S3Location {
  /// The Amazon S3 bucket where the data is located.
  final String s3Bucket;

  /// The Amazon S3 key where the data is located.
  final String s3Key;

  S3Location({
    this.s3Bucket,
    this.s3Key,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location(
        s3Bucket:
            json.containsKey('S3Bucket') ? json['S3Bucket'] as String : null,
        s3Key: json.containsKey('S3Key') ? json['S3Key'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Detailed health information about an Amazon EC2 instance in your Elastic
/// Beanstalk environment.
class SingleInstanceHealth {
  /// The ID of the Amazon EC2 instance.
  final String instanceId;

  /// Returns the health status of the specified instance. For more information,
  /// see
  /// [Health Colors and Statuses](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html).
  final String healthStatus;

  /// Represents the color indicator that gives you information about the health
  /// of the EC2 instance. For more information, see
  /// [Health Colors and Statuses](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html).
  final String color;

  /// Represents the causes, which provide more information about the current
  /// health status.
  final List<String> causes;

  /// The time at which the EC2 instance was launched.
  final DateTime launchedAt;

  /// Request metrics from your application.
  final ApplicationMetrics applicationMetrics;

  /// Operating system metrics from the instance.
  final SystemStatus system;

  /// Information about the most recent deployment to an instance.
  final Deployment deployment;

  /// The availability zone in which the instance runs.
  final String availabilityZone;

  /// The instance's type.
  final String instanceType;

  SingleInstanceHealth({
    this.instanceId,
    this.healthStatus,
    this.color,
    this.causes,
    this.launchedAt,
    this.applicationMetrics,
    this.system,
    this.deployment,
    this.availabilityZone,
    this.instanceType,
  });
  static SingleInstanceHealth fromJson(Map<String, dynamic> json) =>
      SingleInstanceHealth(
        instanceId: json.containsKey('InstanceId')
            ? json['InstanceId'] as String
            : null,
        healthStatus: json.containsKey('HealthStatus')
            ? json['HealthStatus'] as String
            : null,
        color: json.containsKey('Color') ? json['Color'] as String : null,
        causes: json.containsKey('Causes')
            ? (json['Causes'] as List).map((e) => e as String).toList()
            : null,
        launchedAt: json.containsKey('LaunchedAt')
            ? DateTime.parse(json['LaunchedAt'])
            : null,
        applicationMetrics: json.containsKey('ApplicationMetrics')
            ? ApplicationMetrics.fromJson(json['ApplicationMetrics'])
            : null,
        system: json.containsKey('System')
            ? SystemStatus.fromJson(json['System'])
            : null,
        deployment: json.containsKey('Deployment')
            ? Deployment.fromJson(json['Deployment'])
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
      );
}

/// Describes the solution stack.
class SolutionStackDescription {
  /// The name of the solution stack.
  final String solutionStackName;

  /// The permitted file types allowed for a solution stack.
  final List<String> permittedFileTypes;

  SolutionStackDescription({
    this.solutionStackName,
    this.permittedFileTypes,
  });
  static SolutionStackDescription fromJson(Map<String, dynamic> json) =>
      SolutionStackDescription(
        solutionStackName: json.containsKey('SolutionStackName')
            ? json['SolutionStackName'] as String
            : null,
        permittedFileTypes: json.containsKey('PermittedFileTypes')
            ? (json['PermittedFileTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Location of the source code for an application version.
class SourceBuildInformation {
  /// The type of repository.
  ///
  /// *    `Git`
  ///
  /// *    `Zip`
  final String sourceType;

  /// Location where the repository is stored.
  ///
  /// *    `CodeCommit`
  ///
  /// *    `S3`
  final String sourceRepository;

  /// The location of the source code, as a formatted string, depending on the
  /// value of `SourceRepository`
  ///
  /// *   For `CodeCommit`, the format is the repository name and commit ID,
  /// separated by a forward slash. For example,
  /// `my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a`.
  ///
  /// *   For `S3`, the format is the S3 bucket name and object key, separated
  /// by a forward slash. For example, `my-s3-bucket/Folders/my-source-file`.
  final String sourceLocation;

  SourceBuildInformation({
    @required this.sourceType,
    @required this.sourceRepository,
    @required this.sourceLocation,
  });
  static SourceBuildInformation fromJson(Map<String, dynamic> json) =>
      SourceBuildInformation(
        sourceType: json['SourceType'] as String,
        sourceRepository: json['SourceRepository'] as String,
        sourceLocation: json['SourceLocation'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A specification for an environment configuration
class SourceConfiguration {
  /// The name of the application associated with the configuration.
  final String applicationName;

  /// The name of the configuration template.
  final String templateName;

  SourceConfiguration({
    this.applicationName,
    this.templateName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the percentage of requests over the last 10 seconds that resulted
/// in each type of status code response. For more information, see
/// [Status Code Definitions](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html).
class StatusCodes {
  /// The percentage of requests over the last 10 seconds that resulted in a 2xx
  /// (200, 201, etc.) status code.
  final int status2xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 3xx
  /// (300, 301, etc.) status code.
  final int status3xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 4xx
  /// (400, 401, etc.) status code.
  final int status4xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 5xx
  /// (500, 501, etc.) status code.
  final int status5xx;

  StatusCodes({
    this.status2xx,
    this.status3xx,
    this.status4xx,
    this.status5xx,
  });
  static StatusCodes fromJson(Map<String, dynamic> json) => StatusCodes(
        status2xx:
            json.containsKey('Status2xx') ? json['Status2xx'] as int : null,
        status3xx:
            json.containsKey('Status3xx') ? json['Status3xx'] as int : null,
        status4xx:
            json.containsKey('Status4xx') ? json['Status4xx'] as int : null,
        status5xx:
            json.containsKey('Status5xx') ? json['Status5xx'] as int : null,
      );
}

/// CPU utilization and load average metrics for an Amazon EC2 instance.
class SystemStatus {
  /// CPU utilization metrics for the instance.
  final CpuUtilization cpuUtilization;

  /// Load average in the last 1-minute, 5-minute, and 15-minute periods. For
  /// more information, see
  /// [Operating System Metrics](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-metrics.html#health-enhanced-metrics-os).
  final List<double> loadAverage;

  SystemStatus({
    this.cpuUtilization,
    this.loadAverage,
  });
  static SystemStatus fromJson(Map<String, dynamic> json) => SystemStatus(
        cpuUtilization: json.containsKey('CPUUtilization')
            ? CpuUtilization.fromJson(json['CPUUtilization'])
            : null,
        loadAverage: json.containsKey('LoadAverage')
            ? (json['LoadAverage'] as List).map((e) => e as double).toList()
            : null,
      );
}

/// Describes a tag applied to a resource in an environment.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a trigger.
class Trigger {
  /// The name of the trigger.
  final String name;

  Trigger({
    this.name,
  });
  static Trigger fromJson(Map<String, dynamic> json) => Trigger(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// An error or warning for a desired configuration option value.
class ValidationMessage {
  /// A message describing the error or warning.
  final String message;

  /// An indication of the severity of this message:
  ///
  /// *    `error`: This message indicates that this is not a valid setting for
  /// an option.
  ///
  /// *    `warning`: This message is providing information you should take into
  /// account.
  final String severity;

  /// The namespace to which the option belongs.
  final String namespace;

  /// The name of the option.
  final String optionName;

  ValidationMessage({
    this.message,
    this.severity,
    this.namespace,
    this.optionName,
  });
  static ValidationMessage fromJson(Map<String, dynamic> json) =>
      ValidationMessage(
        message: json.containsKey('Message') ? json['Message'] as String : null,
        severity:
            json.containsKey('Severity') ? json['Severity'] as String : null,
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        optionName: json.containsKey('OptionName')
            ? json['OptionName'] as String
            : null,
      );
}
