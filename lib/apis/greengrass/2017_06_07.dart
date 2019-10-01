import 'package:meta/meta.dart';

/// AWS IoT Greengrass seamlessly extends AWS onto physical devices so they can
/// act locally on the data they generate, while still using the cloud for
/// management, analytics, and durable storage. AWS IoT Greengrass ensures your
/// devices can respond quickly to local events and operate with intermittent
/// connectivity. AWS IoT Greengrass minimizes the cost of transmitting data to
/// the cloud by allowing you to author AWS Lambda functions that execute
/// locally.
class GreengrassApi {
  /// Associates a role with a group. Your Greengrass core will use the role to
  /// access AWS cloud services. The role's permissions should allow Greengrass
  /// core Lambda functions to perform actions against the cloud.
  Future<void> associateRoleToGroup(
      {@required String groupId, @required String roleArn}) async {}

  /// Associates a role with your account. AWS IoT Greengrass will use the role
  /// to access your Lambda functions and AWS IoT resources. This is necessary
  /// for deployments to succeed. The role must have at least minimum
  /// permissions in the policy ''AWSGreengrassResourceAccessRolePolicy''.
  Future<void> associateServiceRoleToAccount(String roleArn) async {}

  /// Creates a connector definition. You may provide the initial version of the
  /// connector definition now or use ''CreateConnectorDefinitionVersion'' at a
  /// later time.
  Future<void> createConnectorDefinition(
      {String amznClientToken,
      ConnectorDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a connector definition which has already been
  /// defined.
  Future<void> createConnectorDefinitionVersion(String connectorDefinitionId,
      {String amznClientToken, List<Connector> connectors}) async {}

  /// Creates a core definition. You may provide the initial version of the core
  /// definition now or use ''CreateCoreDefinitionVersion'' at a later time.
  /// Greengrass groups must each contain exactly one Greengrass core.
  Future<void> createCoreDefinition(
      {String amznClientToken,
      CoreDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a core definition that has already been defined.
  /// Greengrass groups must each contain exactly one Greengrass core.
  Future<void> createCoreDefinitionVersion(String coreDefinitionId,
      {String amznClientToken, List<Core> cores}) async {}

  /// Creates a deployment. ''CreateDeployment'' requests are idempotent with
  /// respect to the ''X-Amzn-Client-Token'' token and the request parameters.
  Future<void> createDeployment(
      {String amznClientToken,
      String deploymentId,
      @required String deploymentType,
      @required String groupId,
      String groupVersionId}) async {}

  /// Creates a device definition. You may provide the initial version of the
  /// device definition now or use ''CreateDeviceDefinitionVersion'' at a later
  /// time.
  Future<void> createDeviceDefinition(
      {String amznClientToken,
      DeviceDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a device definition that has already been defined.
  Future<void> createDeviceDefinitionVersion(String deviceDefinitionId,
      {String amznClientToken, List<Device> devices}) async {}

  /// Creates a Lambda function definition which contains a list of Lambda
  /// functions and their configurations to be used in a group. You can create
  /// an initial version of the definition by providing a list of Lambda
  /// functions and their configurations now, or use
  /// ''CreateFunctionDefinitionVersion'' later.
  Future<void> createFunctionDefinition(
      {String amznClientToken,
      FunctionDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a Lambda function definition that has already been
  /// defined.
  Future<void> createFunctionDefinitionVersion(String functionDefinitionId,
      {String amznClientToken,
      FunctionDefaultConfig defaultConfig,
      List<Function> functions}) async {}

  /// Creates a group. You may provide the initial version of the group or use
  /// ''CreateGroupVersion'' at a later time. Tip: You can use the
  /// ''gg\_group\_setup'' package
  /// (https://github.com/awslabs/aws-greengrass-group-setup) as a library or
  /// command-line application to create and deploy Greengrass groups.
  Future<void> createGroup(
      {String amznClientToken,
      GroupVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a CA for the group. If a CA already exists, it will rotate the
  /// existing CA.
  Future<void> createGroupCertificateAuthority(String groupId,
      {String amznClientToken}) async {}

  /// Creates a version of a group which has already been defined.
  Future<void> createGroupVersion(String groupId,
      {String amznClientToken,
      String connectorDefinitionVersionArn,
      String coreDefinitionVersionArn,
      String deviceDefinitionVersionArn,
      String functionDefinitionVersionArn,
      String loggerDefinitionVersionArn,
      String resourceDefinitionVersionArn,
      String subscriptionDefinitionVersionArn}) async {}

  /// Creates a logger definition. You may provide the initial version of the
  /// logger definition now or use ''CreateLoggerDefinitionVersion'' at a later
  /// time.
  Future<void> createLoggerDefinition(
      {String amznClientToken,
      LoggerDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a logger definition that has already been defined.
  Future<void> createLoggerDefinitionVersion(String loggerDefinitionId,
      {String amznClientToken, List<Logger> loggers}) async {}

  /// Creates a resource definition which contains a list of resources to be
  /// used in a group. You can create an initial version of the definition by
  /// providing a list of resources now, or use
  /// ''CreateResourceDefinitionVersion'' later.
  Future<void> createResourceDefinition(
      {String amznClientToken,
      ResourceDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a resource definition that has already been defined.
  Future<void> createResourceDefinitionVersion(String resourceDefinitionId,
      {String amznClientToken, List<Resource> resources}) async {}

  /// Creates a software update for a core or group of cores (specified as an
  /// IoT thing group.) Use this to update the OTA Agent as well as the
  /// Greengrass core software. It makes use of the IoT Jobs feature which
  /// provides additional commands to manage a Greengrass core software update
  /// job.
  Future<void> createSoftwareUpdateJob(
      {String amznClientToken,
      @required String s3UrlSignerRole,
      @required String softwareToUpdate,
      String updateAgentLogLevel,
      @required List<String> updateTargets,
      @required String updateTargetsArchitecture,
      @required String updateTargetsOperatingSystem}) async {}

  /// Creates a subscription definition. You may provide the initial version of
  /// the subscription definition now or use
  /// ''CreateSubscriptionDefinitionVersion'' at a later time.
  Future<void> createSubscriptionDefinition(
      {String amznClientToken,
      SubscriptionDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Creates a version of a subscription definition which has already been
  /// defined.
  Future<void> createSubscriptionDefinitionVersion(
      String subscriptionDefinitionId,
      {String amznClientToken,
      List<Subscription> subscriptions}) async {}

  /// Deletes a connector definition.
  Future<void> deleteConnectorDefinition(String connectorDefinitionId) async {}

  /// Deletes a core definition.
  Future<void> deleteCoreDefinition(String coreDefinitionId) async {}

  /// Deletes a device definition.
  Future<void> deleteDeviceDefinition(String deviceDefinitionId) async {}

  /// Deletes a Lambda function definition.
  Future<void> deleteFunctionDefinition(String functionDefinitionId) async {}

  /// Deletes a group.
  Future<void> deleteGroup(String groupId) async {}

  /// Deletes a logger definition.
  Future<void> deleteLoggerDefinition(String loggerDefinitionId) async {}

  /// Deletes a resource definition.
  Future<void> deleteResourceDefinition(String resourceDefinitionId) async {}

  /// Deletes a subscription definition.
  Future<void> deleteSubscriptionDefinition(
      String subscriptionDefinitionId) async {}

  /// Disassociates the role from a group.
  Future<void> disassociateRoleFromGroup(String groupId) async {}

  /// Disassociates the service role from your account. Without a service role,
  /// deployments will not work.
  Future<void> disassociateServiceRoleFromAccount() async {}

  /// Retrieves the role associated with a particular group.
  Future<void> getAssociatedRole(String groupId) async {}

  /// Returns the status of a bulk deployment.
  Future<void> getBulkDeploymentStatus(String bulkDeploymentId) async {}

  /// Retrieves the connectivity information for a core.
  Future<void> getConnectivityInfo(String thingName) async {}

  /// Retrieves information about a connector definition.
  Future<void> getConnectorDefinition(String connectorDefinitionId) async {}

  /// Retrieves information about a connector definition version, including the
  /// connectors that the version contains. Connectors are prebuilt modules that
  /// interact with local infrastructure, device protocols, AWS, and other cloud
  /// services.
  Future<void> getConnectorDefinitionVersion(
      {@required String connectorDefinitionId,
      @required String connectorDefinitionVersionId,
      String nextToken}) async {}

  /// Retrieves information about a core definition version.
  Future<void> getCoreDefinition(String coreDefinitionId) async {}

  /// Retrieves information about a core definition version.
  Future<void> getCoreDefinitionVersion(
      {@required String coreDefinitionId,
      @required String coreDefinitionVersionId}) async {}

  /// Returns the status of a deployment.
  Future<void> getDeploymentStatus(
      {@required String deploymentId, @required String groupId}) async {}

  /// Retrieves information about a device definition.
  Future<void> getDeviceDefinition(String deviceDefinitionId) async {}

  /// Retrieves information about a device definition version.
  Future<void> getDeviceDefinitionVersion(
      {@required String deviceDefinitionId,
      @required String deviceDefinitionVersionId,
      String nextToken}) async {}

  /// Retrieves information about a Lambda function definition, including its
  /// creation time and latest version.
  Future<void> getFunctionDefinition(String functionDefinitionId) async {}

  /// Retrieves information about a Lambda function definition version,
  /// including which Lambda functions are included in the version and their
  /// configurations.
  Future<void> getFunctionDefinitionVersion(
      {@required String functionDefinitionId,
      @required String functionDefinitionVersionId,
      String nextToken}) async {}

  /// Retrieves information about a group.
  Future<void> getGroup(String groupId) async {}

  /// Retreives the CA associated with a group. Returns the public key of the
  /// CA.
  Future<void> getGroupCertificateAuthority(
      {@required String certificateAuthorityId,
      @required String groupId}) async {}

  /// Retrieves the current configuration for the CA used by the group.
  Future<void> getGroupCertificateConfiguration(String groupId) async {}

  /// Retrieves information about a group version.
  Future<void> getGroupVersion(
      {@required String groupId, @required String groupVersionId}) async {}

  /// Retrieves information about a logger definition.
  Future<void> getLoggerDefinition(String loggerDefinitionId) async {}

  /// Retrieves information about a logger definition version.
  Future<void> getLoggerDefinitionVersion(
      {@required String loggerDefinitionId,
      @required String loggerDefinitionVersionId,
      String nextToken}) async {}

  /// Retrieves information about a resource definition, including its creation
  /// time and latest version.
  Future<void> getResourceDefinition(String resourceDefinitionId) async {}

  /// Retrieves information about a resource definition version, including which
  /// resources are included in the version.
  Future<void> getResourceDefinitionVersion(
      {@required String resourceDefinitionId,
      @required String resourceDefinitionVersionId}) async {}

  /// Retrieves the service role that is attached to your account.
  Future<void> getServiceRoleForAccount() async {}

  /// Retrieves information about a subscription definition.
  Future<void> getSubscriptionDefinition(
      String subscriptionDefinitionId) async {}

  /// Retrieves information about a subscription definition version.
  Future<void> getSubscriptionDefinitionVersion(
      {String nextToken,
      @required String subscriptionDefinitionId,
      @required String subscriptionDefinitionVersionId}) async {}

  /// Gets a paginated list of the deployments that have been started in a bulk
  /// deployment operation, and their current deployment status.
  Future<void> listBulkDeploymentDetailedReports(String bulkDeploymentId,
      {String maxResults, String nextToken}) async {}

  /// Returns a list of bulk deployments.
  Future<void> listBulkDeployments(
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a connector definition, which are containers for
  /// connectors. Connectors run on the Greengrass core and contain built-in
  /// integration with local infrastructure, device protocols, AWS, and other
  /// cloud services.
  Future<void> listConnectorDefinitionVersions(String connectorDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of connector definitions.
  Future<void> listConnectorDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a core definition.
  Future<void> listCoreDefinitionVersions(String coreDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of core definitions.
  Future<void> listCoreDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Returns a history of deployments for the group.
  Future<void> listDeployments(String groupId,
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a device definition.
  Future<void> listDeviceDefinitionVersions(String deviceDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of device definitions.
  Future<void> listDeviceDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a Lambda function definition.
  Future<void> listFunctionDefinitionVersions(String functionDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of Lambda function definitions.
  Future<void> listFunctionDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Retrieves the current CAs for a group.
  Future<void> listGroupCertificateAuthorities(String groupId) async {}

  /// Lists the versions of a group.
  Future<void> listGroupVersions(String groupId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of groups.
  Future<void> listGroups({String maxResults, String nextToken}) async {}

  /// Lists the versions of a logger definition.
  Future<void> listLoggerDefinitionVersions(String loggerDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of logger definitions.
  Future<void> listLoggerDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a resource definition.
  Future<void> listResourceDefinitionVersions(String resourceDefinitionId,
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of resource definitions.
  Future<void> listResourceDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Lists the versions of a subscription definition.
  Future<void> listSubscriptionDefinitionVersions(
      String subscriptionDefinitionId,
      {String maxResults,
      String nextToken}) async {}

  /// Retrieves a list of subscription definitions.
  Future<void> listSubscriptionDefinitions(
      {String maxResults, String nextToken}) async {}

  /// Retrieves a list of resource tags for a resource arn.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Resets a group's deployments.
  Future<void> resetDeployments(String groupId,
      {String amznClientToken, bool force}) async {}

  /// Deploys multiple groups in one operation. This action starts the bulk
  /// deployment of a specified set of group versions. Each group version
  /// deployment will be triggered with an adaptive rate that has a fixed upper
  /// limit. We recommend that you include an ''X-Amzn-Client-Token'' token in
  /// every ''StartBulkDeployment'' request. These requests are idempotent with
  /// respect to the token and the request parameters.
  Future<void> startBulkDeployment(
      {String amznClientToken,
      @required String executionRoleArn,
      @required String inputFileUri,
      Map<String, String> tags}) async {}

  /// Stops the execution of a bulk deployment. This action returns a status of
  /// ''Stopping'' until the deployment is stopped. You cannot start a new bulk
  /// deployment while a previous deployment is in the ''Stopping'' state. This
  /// action doesn't rollback completed deployments or cancel pending
  /// deployments.
  Future<void> stopBulkDeployment(String bulkDeploymentId) async {}

  /// Add resource tags to a Greengrass Resource. Valid resources are Group,
  /// Connector, Core, Device, Function, Logger, Subscription, and Resource
  /// Defintions, and also BulkDeploymentIds.
  Future<void> tagResource(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Remove resource tags from a Greengrass Resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the connectivity information for the core. Any devices that belong
  /// to the group which has this core will receive this information in order to
  /// find the location of the core and connect to it.
  Future<void> updateConnectivityInfo(String thingName,
      {List<ConnectivityInfo> connectivityInfo}) async {}

  /// Updates a connector definition.
  Future<void> updateConnectorDefinition(String connectorDefinitionId,
      {String name}) async {}

  /// Updates a core definition.
  Future<void> updateCoreDefinition(String coreDefinitionId,
      {String name}) async {}

  /// Updates a device definition.
  Future<void> updateDeviceDefinition(String deviceDefinitionId,
      {String name}) async {}

  /// Updates a Lambda function definition.
  Future<void> updateFunctionDefinition(String functionDefinitionId,
      {String name}) async {}

  /// Updates a group.
  Future<void> updateGroup(String groupId, {String name}) async {}

  /// Updates the Certificate expiry time for a group.
  Future<void> updateGroupCertificateConfiguration(String groupId,
      {String certificateExpiryInMilliseconds}) async {}

  /// Updates a logger definition.
  Future<void> updateLoggerDefinition(String loggerDefinitionId,
      {String name}) async {}

  /// Updates a resource definition.
  Future<void> updateResourceDefinition(String resourceDefinitionId,
      {String name}) async {}

  /// Updates a subscription definition.
  Future<void> updateSubscriptionDefinition(String subscriptionDefinitionId,
      {String name}) async {}
}

class AssociateRoleToGroupResponse {}

class AssociateServiceRoleToAccountResponse {}

class BulkDeployment {}

class BulkDeploymentMetrics {}

class BulkDeploymentResult {}

class ConnectivityInfo {}

class Connector {}

class ConnectorDefinitionVersion {}

class Core {}

class CoreDefinitionVersion {}

class CreateConnectorDefinitionResponse {}

class CreateConnectorDefinitionVersionResponse {}

class CreateCoreDefinitionResponse {}

class CreateCoreDefinitionVersionResponse {}

class CreateDeploymentResponse {}

class CreateDeviceDefinitionResponse {}

class CreateDeviceDefinitionVersionResponse {}

class CreateFunctionDefinitionResponse {}

class CreateFunctionDefinitionVersionResponse {}

class CreateGroupCertificateAuthorityResponse {}

class CreateGroupResponse {}

class CreateGroupVersionResponse {}

class CreateLoggerDefinitionResponse {}

class CreateLoggerDefinitionVersionResponse {}

class CreateResourceDefinitionResponse {}

class CreateResourceDefinitionVersionResponse {}

class CreateSoftwareUpdateJobResponse {}

class CreateSubscriptionDefinitionResponse {}

class CreateSubscriptionDefinitionVersionResponse {}

class DefinitionInformation {}

class DeleteConnectorDefinitionResponse {}

class DeleteCoreDefinitionResponse {}

class DeleteDeviceDefinitionResponse {}

class DeleteFunctionDefinitionResponse {}

class DeleteGroupResponse {}

class DeleteLoggerDefinitionResponse {}

class DeleteResourceDefinitionResponse {}

class DeleteSubscriptionDefinitionResponse {}

class Deployment {}

class Device {}

class DeviceDefinitionVersion {}

class DisassociateRoleFromGroupResponse {}

class DisassociateServiceRoleFromAccountResponse {}

class ErrorDetail {}

class Function {}

class FunctionConfiguration {}

class FunctionConfigurationEnvironment {}

class FunctionDefaultConfig {}

class FunctionDefaultExecutionConfig {}

class FunctionDefinitionVersion {}

class FunctionExecutionConfig {}

class FunctionRunAsConfig {}

class GetAssociatedRoleResponse {}

class GetBulkDeploymentStatusResponse {}

class GetConnectivityInfoResponse {}

class GetConnectorDefinitionResponse {}

class GetConnectorDefinitionVersionResponse {}

class GetCoreDefinitionResponse {}

class GetCoreDefinitionVersionResponse {}

class GetDeploymentStatusResponse {}

class GetDeviceDefinitionResponse {}

class GetDeviceDefinitionVersionResponse {}

class GetFunctionDefinitionResponse {}

class GetFunctionDefinitionVersionResponse {}

class GetGroupCertificateAuthorityResponse {}

class GetGroupCertificateConfigurationResponse {}

class GetGroupResponse {}

class GetGroupVersionResponse {}

class GetLoggerDefinitionResponse {}

class GetLoggerDefinitionVersionResponse {}

class GetResourceDefinitionResponse {}

class GetResourceDefinitionVersionResponse {}

class GetServiceRoleForAccountResponse {}

class GetSubscriptionDefinitionResponse {}

class GetSubscriptionDefinitionVersionResponse {}

class GroupCertificateAuthorityProperties {}

class GroupInformation {}

class GroupOwnerSetting {}

class GroupVersion {}

class ListBulkDeploymentDetailedReportsResponse {}

class ListBulkDeploymentsResponse {}

class ListConnectorDefinitionVersionsResponse {}

class ListConnectorDefinitionsResponse {}

class ListCoreDefinitionVersionsResponse {}

class ListCoreDefinitionsResponse {}

class ListDeploymentsResponse {}

class ListDeviceDefinitionVersionsResponse {}

class ListDeviceDefinitionsResponse {}

class ListFunctionDefinitionVersionsResponse {}

class ListFunctionDefinitionsResponse {}

class ListGroupCertificateAuthoritiesResponse {}

class ListGroupVersionsResponse {}

class ListGroupsResponse {}

class ListLoggerDefinitionVersionsResponse {}

class ListLoggerDefinitionsResponse {}

class ListResourceDefinitionVersionsResponse {}

class ListResourceDefinitionsResponse {}

class ListSubscriptionDefinitionVersionsResponse {}

class ListSubscriptionDefinitionsResponse {}

class ListTagsForResourceResponse {}

class LocalDeviceResourceData {}

class LocalVolumeResourceData {}

class Logger {}

class LoggerDefinitionVersion {}

class ResetDeploymentsResponse {}

class Resource {}

class ResourceAccessPolicy {}

class ResourceDataContainer {}

class ResourceDefinitionVersion {}

class S3MachineLearningModelResourceData {}

class SageMakerMachineLearningModelResourceData {}

class SecretsManagerSecretResourceData {}

class StartBulkDeploymentResponse {}

class StopBulkDeploymentResponse {}

class Subscription {}

class SubscriptionDefinitionVersion {}

class UpdateConnectivityInfoResponse {}

class UpdateConnectorDefinitionResponse {}

class UpdateCoreDefinitionResponse {}

class UpdateDeviceDefinitionResponse {}

class UpdateFunctionDefinitionResponse {}

class UpdateGroupCertificateConfigurationResponse {}

class UpdateGroupResponse {}

class UpdateLoggerDefinitionResponse {}

class UpdateResourceDefinitionResponse {}

class UpdateSubscriptionDefinitionResponse {}

class VersionInformation {}
