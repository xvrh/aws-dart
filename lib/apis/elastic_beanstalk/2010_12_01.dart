import 'package:meta/meta.dart';

/// AWS Elastic Beanstalk
///
/// AWS Elastic Beanstalk makes it easy for you to create, deploy, and manage
/// scalable, fault-tolerant applications running on the Amazon Web Services
/// cloud.
///
/// For more information about this product, go to the [AWS Elastic
/// Beanstalk](http://aws.amazon.com/elasticbeanstalk/) details page. The
/// location of the latest AWS Elastic Beanstalk WSDL is
/// [http://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl](http://elasticbeanstalk.s3.amazonaws.com/doc/2010-12-01/AWSElasticBeanstalk.wsdl).
/// To install the Software Development Kits (SDKs), Integrated Development
/// Environment (IDE) Toolkits, and command line tools that enable you to access
/// the API, go to [Tools for Amazon Web
/// Services](http://aws.amazon.com/tools/).
///
///  **Endpoints**
///
/// For a list of region-specific endpoints that AWS Elastic Beanstalk supports,
/// go to [Regions and
/// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region)
/// in the _Amazon Web Services Glossary_.
class ElasticBeanstalkApi {
  /// Cancels in-progress environment configuration update or application
  /// version deployment.
  Future<void> abortEnvironmentUpdate(
      {String environmentId, String environmentName}) async {}

  /// Applies a scheduled managed action immediately. A managed action can be
  /// applied only if its status is `Scheduled`. Get the status and action ID of
  /// a managed action with DescribeEnvironmentManagedActions.
  Future<void> applyEnvironmentManagedAction(String actionId,
      {String environmentName, String environmentId}) async {}

  /// Checks if the specified CNAME is available.
  Future<void> checkDnsAvailability(String cnamePrefix) async {}

  /// Create or update a group of environments that each run a separate
  /// component of a single application. Takes a list of version labels that
  /// specify application source bundles for each of the environments to create
  /// or update. The name of each environment and other required information
  /// must be included in the source bundles in an environment manifest named
  /// `env.yaml`. See [Compose
  /// Environments](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html)
  /// for details.
  Future<void> composeEnvironments(
      {String applicationName,
      String groupName,
      List<String> versionLabels}) async {}

  ///  Creates an application that has one configuration template named
  /// `default` and no application versions.
  Future<void> createApplication(String applicationName,
      {String description,
      ApplicationResourceLifecycleConfig resourceLifecycleConfig,
      List<Tag> tags}) async {}

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
  Future<void> createApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      String description,
      SourceBuildInformation sourceBuildInformation,
      S3Location sourceBundle,
      BuildConfiguration buildConfiguration,
      bool autoCreateApplication,
      bool process,
      List<Tag> tags}) async {}

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
  Future<void> createConfigurationTemplate(
      {@required String applicationName,
      @required String templateName,
      String solutionStackName,
      String platformArn,
      SourceConfiguration sourceConfiguration,
      String environmentId,
      String description,
      List<ConfigurationOptionSetting> optionSettings,
      List<Tag> tags}) async {}

  /// Launches an environment for the specified application using the specified
  /// configuration.
  Future<void> createEnvironment(String applicationName,
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
      List<OptionSpecification> optionsToRemove}) async {}

  /// Create a new version of your custom platform.
  Future<void> createPlatformVersion(
      {@required String platformName,
      @required String platformVersion,
      @required S3Location platformDefinitionBundle,
      String environmentName,
      List<ConfigurationOptionSetting> optionSettings,
      List<Tag> tags}) async {}

  /// Creates a bucket in Amazon S3 to store application versions, logs, and
  /// other files used by Elastic Beanstalk environments. The Elastic Beanstalk
  /// console and EB CLI call this API the first time you create an environment
  /// in a region. If the storage location already exists,
  /// `CreateStorageLocation` still returns the bucket name but does not create
  /// a new bucket.
  Future<void> createStorageLocation() async {}

  /// Deletes the specified application along with all associated versions and
  /// configurations. The application versions will not be deleted from your
  /// Amazon S3 bucket.
  ///
  ///
  ///
  /// You cannot delete an application that has a running environment.
  Future<void> deleteApplication(String applicationName,
      {bool terminateEnvByForce}) async {}

  /// Deletes the specified version from the specified application.
  ///
  ///
  ///
  /// You cannot delete an application version that is associated with a running
  /// environment.
  Future<void> deleteApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      bool deleteSourceBundle}) async {}

  /// Deletes the specified configuration template.
  ///
  ///
  ///
  /// When you launch an environment using a configuration template, the
  /// environment gets a copy of the template. You can delete or modify the
  /// environment's copy of the template without affecting the running
  /// environment.
  Future<void> deleteConfigurationTemplate(
      {@required String applicationName,
      @required String templateName}) async {}

  /// Deletes the draft configuration associated with the running environment.
  ///
  /// Updating a running environment with any configuration changes creates a
  /// draft configuration set. You can get the draft configuration using
  /// DescribeConfigurationSettings while the update is in progress or if the
  /// update fails. The `DeploymentStatus` for the draft configuration indicates
  /// whether the deployment is in process or has failed. The draft
  /// configuration remains in existence until it is deleted with this action.
  Future<void> deleteEnvironmentConfiguration(
      {@required String applicationName,
      @required String environmentName}) async {}

  /// Deletes the specified version of a custom platform.
  Future<void> deletePlatformVersion({String platformArn}) async {}

  /// Returns attributes related to AWS Elastic Beanstalk that are associated
  /// with the calling AWS account.
  ///
  /// The result currently has one set of attributes—resource quotas.
  Future<void> describeAccountAttributes() async {}

  /// Retrieve a list of application versions.
  Future<void> describeApplicationVersions(
      {String applicationName,
      List<String> versionLabels,
      int maxRecords,
      String nextToken}) async {}

  /// Returns the descriptions of existing applications.
  Future<void> describeApplications({List<String> applicationNames}) async {}

  /// Describes the configuration options that are used in a particular
  /// configuration template or environment, or that a specified solution stack
  /// defines. The description includes the values the options, their default
  /// values, and an indication of the required action on a running environment
  /// if an option value is changed.
  Future<void> describeConfigurationOptions(
      {String applicationName,
      String templateName,
      String environmentName,
      String solutionStackName,
      String platformArn,
      List<OptionSpecification> options}) async {}

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
  Future<void> describeConfigurationSettings(String applicationName,
      {String templateName, String environmentName}) async {}

  /// Returns information about the overall health of the specified environment.
  /// The **DescribeEnvironmentHealth** operation is only available with AWS
  /// Elastic Beanstalk Enhanced Health.
  Future<void> describeEnvironmentHealth(
      {String environmentName,
      String environmentId,
      List<String> attributeNames}) async {}

  /// Lists an environment's completed and failed managed actions.
  Future<void> describeEnvironmentManagedActionHistory(
      {String environmentId,
      String environmentName,
      String nextToken,
      int maxItems}) async {}

  /// Lists an environment's upcoming and in-progress managed actions.
  Future<void> describeEnvironmentManagedActions(
      {String environmentName, String environmentId, String status}) async {}

  /// Returns AWS resources for this environment.
  Future<void> describeEnvironmentResources(
      {String environmentId, String environmentName}) async {}

  /// Returns descriptions for existing environments.
  Future<void> describeEnvironments(
      {String applicationName,
      String versionLabel,
      List<String> environmentIds,
      List<String> environmentNames,
      bool includeDeleted,
      DateTime includedDeletedBackTo,
      int maxRecords,
      String nextToken}) async {}

  /// Returns list of event descriptions matching criteria up to the last 6
  /// weeks.
  ///
  ///
  ///
  /// This action returns the most recent 1,000 events from the specified
  /// `NextToken`.
  Future<void> describeEvents(
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
      String nextToken}) async {}

  /// Retrieves detailed information about the health of instances in your AWS
  /// Elastic Beanstalk. This operation requires [enhanced health
  /// reporting](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html).
  Future<void> describeInstancesHealth(
      {String environmentName,
      String environmentId,
      List<String> attributeNames,
      String nextToken}) async {}

  /// Describes the version of the platform.
  Future<void> describePlatformVersion({String platformArn}) async {}

  /// Returns a list of the available solution stack names, with the public
  /// version first and then in reverse chronological order.
  Future<void> listAvailableSolutionStacks() async {}

  /// Lists the available platforms.
  Future<void> listPlatformVersions(
      {List<PlatformFilter> filters, int maxRecords, String nextToken}) async {}

  /// Returns the tags applied to an AWS Elastic Beanstalk resource. The
  /// response contains a list of tag key-value pairs.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see [Tagging
  /// Resources in Your Elastic Beanstalk
  /// Environment](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html).
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Deletes and recreates all of the AWS resources (for example: the Auto
  /// Scaling group, load balancer, etc.) for a specified environment and forces
  /// a restart.
  Future<void> rebuildEnvironment(
      {String environmentId, String environmentName}) async {}

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
  Future<void> requestEnvironmentInfo(String infoType,
      {String environmentId, String environmentName}) async {}

  /// Causes the environment to restart the application container server running
  /// on each Amazon EC2 instance.
  Future<void> restartAppServer(
      {String environmentId, String environmentName}) async {}

  /// Retrieves the compiled information from a RequestEnvironmentInfo request.
  ///
  /// Related Topics
  ///
  /// *    RequestEnvironmentInfo
  Future<void> retrieveEnvironmentInfo(String infoType,
      {String environmentId, String environmentName}) async {}

  /// Swaps the CNAMEs of two environments.
  Future<void> swapEnvironmentCnamEs(
      {String sourceEnvironmentId,
      String sourceEnvironmentName,
      String destinationEnvironmentId,
      String destinationEnvironmentName}) async {}

  /// Terminates the specified environment.
  Future<void> terminateEnvironment(
      {String environmentId,
      String environmentName,
      bool terminateResources,
      bool forceTerminate}) async {}

  /// Updates the specified application to have the specified properties.
  ///
  ///
  ///
  /// If a property (for example, `description`) is not provided, the value
  /// remains unchanged. To clear these properties, specify an empty string.
  Future<void> updateApplication(String applicationName,
      {String description}) async {}

  /// Modifies lifecycle settings for an application.
  Future<void> updateApplicationResourceLifecycle(
      {@required
          String applicationName,
      @required
          ApplicationResourceLifecycleConfig resourceLifecycleConfig}) async {}

  /// Updates the specified application version to have the specified
  /// properties.
  ///
  ///
  ///
  /// If a property (for example, `description`) is not provided, the value
  /// remains unchanged. To clear properties, specify an empty string.
  Future<void> updateApplicationVersion(
      {@required String applicationName,
      @required String versionLabel,
      String description}) async {}

  /// Updates the specified configuration template to have the specified
  /// properties or configuration option values.
  ///
  ///  If a property (for example, `ApplicationName`) is not provided, its value
  /// remains unchanged. To clear such properties, specify an empty string.
  ///
  /// Related Topics
  ///
  /// *    DescribeConfigurationOptions
  Future<void> updateConfigurationTemplate(
      {@required String applicationName,
      @required String templateName,
      String description,
      List<ConfigurationOptionSetting> optionSettings,
      List<OptionSpecification> optionsToRemove}) async {}

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
  Future<void> updateEnvironment(
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
      List<OptionSpecification> optionsToRemove}) async {}

  /// Update the list of tags applied to an AWS Elastic Beanstalk resource. Two
  /// lists can be passed: `TagsToAdd` for tags to add or update, and
  /// `TagsToRemove`.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see [Tagging
  /// Resources in Your Elastic Beanstalk
  /// Environment](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html).
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
  /// For details about creating a custom user policy, see [Creating a Custom
  /// User
  /// Policy](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies).
  Future<void> updateTagsForResource(String resourceArn,
      {List<Tag> tagsToAdd, List<String> tagsToRemove}) async {}

  /// Takes a set of configuration settings and either a configuration template
  /// or environment, and determines whether those values are valid.
  ///
  /// This action returns a list of messages indicating any errors or warnings
  /// associated with the selection of option values.
  Future<void> validateConfigurationSettings(
      {@required String applicationName,
      String templateName,
      String environmentName,
      @required List<ConfigurationOptionSetting> optionSettings}) async {}
}

class ApplicationDescription {}

class ApplicationDescriptionMessage {}

class ApplicationDescriptionsMessage {}

class ApplicationMetrics {}

class ApplicationResourceLifecycleConfig {}

class ApplicationResourceLifecycleDescriptionMessage {}

class ApplicationVersionDescription {}

class ApplicationVersionDescriptionMessage {}

class ApplicationVersionDescriptionsMessage {}

class ApplicationVersionLifecycleConfig {}

class ApplyEnvironmentManagedActionResult {}

class AutoScalingGroup {}

class BuildConfiguration {}

class Builder {}

class CpuUtilization {}

class CheckDnsAvailabilityResultMessage {}

class ConfigurationOptionDescription {}

class ConfigurationOptionSetting {}

class ConfigurationOptionsDescription {}

class ConfigurationSettingsDescription {}

class ConfigurationSettingsDescriptions {}

class ConfigurationSettingsValidationMessages {}

class CreatePlatformVersionResult {}

class CreateStorageLocationResultMessage {}

class CustomAmi {}

class DeletePlatformVersionResult {}

class Deployment {}

class DescribeAccountAttributesResult {}

class DescribeEnvironmentHealthResult {}

class DescribeEnvironmentManagedActionHistoryResult {}

class DescribeEnvironmentManagedActionsResult {}

class DescribeInstancesHealthResult {}

class DescribePlatformVersionResult {}

class EnvironmentDescription {}

class EnvironmentDescriptionsMessage {}

class EnvironmentInfoDescription {}

class EnvironmentLink {}

class EnvironmentResourceDescription {}

class EnvironmentResourceDescriptionsMessage {}

class EnvironmentResourcesDescription {}

class EnvironmentTier {}

class EventDescription {}

class EventDescriptionsMessage {}

class Instance {}

class InstanceHealthSummary {}

class Latency {}

class LaunchConfiguration {}

class LaunchTemplate {}

class ListAvailableSolutionStacksResultMessage {}

class ListPlatformVersionsResult {}

class Listener {}

class LoadBalancer {}

class LoadBalancerDescription {}

class ManagedAction {}

class ManagedActionHistoryItem {}

class MaxAgeRule {}

class MaxCountRule {}

class OptionRestrictionRegex {}

class OptionSpecification {}

class PlatformDescription {}

class PlatformFilter {}

class PlatformFramework {}

class PlatformProgrammingLanguage {}

class PlatformSummary {}

class Queue {}

class ResourceQuota {}

class ResourceQuotas {}

class ResourceTagsDescriptionMessage {}

class RetrieveEnvironmentInfoResultMessage {}

class S3Location {}

class SingleInstanceHealth {}

class SolutionStackDescription {}

class SourceBuildInformation {}

class SourceConfiguration {}

class StatusCodes {}

class SystemStatus {}

class Tag {}

class Trigger {}

class ValidationMessage {}
