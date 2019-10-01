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
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [roleArn]: The ARN of the role you wish to associate with this group. The
  /// existence of the role is not validated.
  Future<AssociateRoleToGroupResponse> associateRoleToGroup(
      {@required String groupId, @required String roleArn}) async {
    return AssociateRoleToGroupResponse.fromJson({});
  }

  /// Associates a role with your account. AWS IoT Greengrass will use the role
  /// to access your Lambda functions and AWS IoT resources. This is necessary
  /// for deployments to succeed. The role must have at least minimum
  /// permissions in the policy ''AWSGreengrassResourceAccessRolePolicy''.
  ///
  /// [roleArn]: The ARN of the service role you wish to associate with your
  /// account.
  Future<AssociateServiceRoleToAccountResponse> associateServiceRoleToAccount(
      String roleArn) async {
    return AssociateServiceRoleToAccountResponse.fromJson({});
  }

  /// Creates a connector definition. You may provide the initial version of the
  /// connector definition now or use ''CreateConnectorDefinitionVersion'' at a
  /// later time.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the connector
  /// definition.
  ///
  /// [name]: The name of the connector definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateConnectorDefinitionResponse> createConnectorDefinition(
      {String amznClientToken,
      ConnectorDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateConnectorDefinitionResponse.fromJson({});
  }

  /// Creates a version of a connector definition which has already been
  /// defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  ///
  /// [connectors]: A list of references to connectors in this version, with
  /// their corresponding configuration settings.
  Future<CreateConnectorDefinitionVersionResponse>
      createConnectorDefinitionVersion(String connectorDefinitionId,
          {String amznClientToken, List<Connector> connectors}) async {
    return CreateConnectorDefinitionVersionResponse.fromJson({});
  }

  /// Creates a core definition. You may provide the initial version of the core
  /// definition now or use ''CreateCoreDefinitionVersion'' at a later time.
  /// Greengrass groups must each contain exactly one Greengrass core.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the core
  /// definition.
  ///
  /// [name]: The name of the core definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateCoreDefinitionResponse> createCoreDefinition(
      {String amznClientToken,
      CoreDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateCoreDefinitionResponse.fromJson({});
  }

  /// Creates a version of a core definition that has already been defined.
  /// Greengrass groups must each contain exactly one Greengrass core.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  ///
  /// [cores]: A list of cores in the core definition version.
  Future<CreateCoreDefinitionVersionResponse> createCoreDefinitionVersion(
      String coreDefinitionId,
      {String amznClientToken,
      List<Core> cores}) async {
    return CreateCoreDefinitionVersionResponse.fromJson({});
  }

  /// Creates a deployment. ''CreateDeployment'' requests are idempotent with
  /// respect to the ''X-Amzn-Client-Token'' token and the request parameters.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [deploymentId]: The ID of the deployment if you wish to redeploy a
  /// previous deployment.
  ///
  /// [deploymentType]: The type of deployment. When used for
  /// ''CreateDeployment'', only ''NewDeployment'' and ''Redeployment'' are
  /// valid.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [groupVersionId]: The ID of the group version to be deployed.
  Future<CreateDeploymentResponse> createDeployment(
      {String amznClientToken,
      String deploymentId,
      @required String deploymentType,
      @required String groupId,
      String groupVersionId}) async {
    return CreateDeploymentResponse.fromJson({});
  }

  /// Creates a device definition. You may provide the initial version of the
  /// device definition now or use ''CreateDeviceDefinitionVersion'' at a later
  /// time.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the device
  /// definition.
  ///
  /// [name]: The name of the device definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateDeviceDefinitionResponse> createDeviceDefinition(
      {String amznClientToken,
      DeviceDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateDeviceDefinitionResponse.fromJson({});
  }

  /// Creates a version of a device definition that has already been defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  ///
  /// [devices]: A list of devices in the definition version.
  Future<CreateDeviceDefinitionVersionResponse> createDeviceDefinitionVersion(
      String deviceDefinitionId,
      {String amznClientToken,
      List<Device> devices}) async {
    return CreateDeviceDefinitionVersionResponse.fromJson({});
  }

  /// Creates a Lambda function definition which contains a list of Lambda
  /// functions and their configurations to be used in a group. You can create
  /// an initial version of the definition by providing a list of Lambda
  /// functions and their configurations now, or use
  /// ''CreateFunctionDefinitionVersion'' later.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the function
  /// definition.
  ///
  /// [name]: The name of the function definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateFunctionDefinitionResponse> createFunctionDefinition(
      {String amznClientToken,
      FunctionDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateFunctionDefinitionResponse.fromJson({});
  }

  /// Creates a version of a Lambda function definition that has already been
  /// defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [defaultConfig]: The default configuration that applies to all Lambda
  /// functions in this function definition version. Individual Lambda functions
  /// can override these settings.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  ///
  /// [functions]: A list of Lambda functions in this function definition
  /// version.
  Future<CreateFunctionDefinitionVersionResponse>
      createFunctionDefinitionVersion(String functionDefinitionId,
          {String amznClientToken,
          FunctionDefaultConfig defaultConfig,
          List<Function> functions}) async {
    return CreateFunctionDefinitionVersionResponse.fromJson({});
  }

  /// Creates a group. You may provide the initial version of the group or use
  /// ''CreateGroupVersion'' at a later time. Tip: You can use the
  /// ''gg\_group\_setup'' package
  /// (https://github.com/awslabs/aws-greengrass-group-setup) as a library or
  /// command-line application to create and deploy Greengrass groups.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the group.
  ///
  /// [name]: The name of the group.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateGroupResponse> createGroup(
      {String amznClientToken,
      GroupVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateGroupResponse.fromJson({});
  }

  /// Creates a CA for the group. If a CA already exists, it will rotate the
  /// existing CA.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<CreateGroupCertificateAuthorityResponse>
      createGroupCertificateAuthority(String groupId,
          {String amznClientToken}) async {
    return CreateGroupCertificateAuthorityResponse.fromJson({});
  }

  /// Creates a version of a group which has already been defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [connectorDefinitionVersionArn]: The ARN of the connector definition
  /// version for this group.
  ///
  /// [coreDefinitionVersionArn]: The ARN of the core definition version for
  /// this group.
  ///
  /// [deviceDefinitionVersionArn]: The ARN of the device definition version for
  /// this group.
  ///
  /// [functionDefinitionVersionArn]: The ARN of the function definition version
  /// for this group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [loggerDefinitionVersionArn]: The ARN of the logger definition version for
  /// this group.
  ///
  /// [resourceDefinitionVersionArn]: The ARN of the resource definition version
  /// for this group.
  ///
  /// [subscriptionDefinitionVersionArn]: The ARN of the subscription definition
  /// version for this group.
  Future<CreateGroupVersionResponse> createGroupVersion(String groupId,
      {String amznClientToken,
      String connectorDefinitionVersionArn,
      String coreDefinitionVersionArn,
      String deviceDefinitionVersionArn,
      String functionDefinitionVersionArn,
      String loggerDefinitionVersionArn,
      String resourceDefinitionVersionArn,
      String subscriptionDefinitionVersionArn}) async {
    return CreateGroupVersionResponse.fromJson({});
  }

  /// Creates a logger definition. You may provide the initial version of the
  /// logger definition now or use ''CreateLoggerDefinitionVersion'' at a later
  /// time.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the logger
  /// definition.
  ///
  /// [name]: The name of the logger definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateLoggerDefinitionResponse> createLoggerDefinition(
      {String amznClientToken,
      LoggerDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateLoggerDefinitionResponse.fromJson({});
  }

  /// Creates a version of a logger definition that has already been defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  ///
  /// [loggers]: A list of loggers.
  Future<CreateLoggerDefinitionVersionResponse> createLoggerDefinitionVersion(
      String loggerDefinitionId,
      {String amznClientToken,
      List<Logger> loggers}) async {
    return CreateLoggerDefinitionVersionResponse.fromJson({});
  }

  /// Creates a resource definition which contains a list of resources to be
  /// used in a group. You can create an initial version of the definition by
  /// providing a list of resources now, or use
  /// ''CreateResourceDefinitionVersion'' later.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the resource
  /// definition.
  ///
  /// [name]: The name of the resource definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateResourceDefinitionResponse> createResourceDefinition(
      {String amznClientToken,
      ResourceDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateResourceDefinitionResponse.fromJson({});
  }

  /// Creates a version of a resource definition that has already been defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  ///
  /// [resources]: A list of resources.
  Future<CreateResourceDefinitionVersionResponse>
      createResourceDefinitionVersion(String resourceDefinitionId,
          {String amznClientToken, List<Resource> resources}) async {
    return CreateResourceDefinitionVersionResponse.fromJson({});
  }

  /// Creates a software update for a core or group of cores (specified as an
  /// IoT thing group.) Use this to update the OTA Agent as well as the
  /// Greengrass core software. It makes use of the IoT Jobs feature which
  /// provides additional commands to manage a Greengrass core software update
  /// job.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  Future<CreateSoftwareUpdateJobResponse> createSoftwareUpdateJob(
      {String amznClientToken,
      @required String s3UrlSignerRole,
      @required String softwareToUpdate,
      String updateAgentLogLevel,
      @required List<String> updateTargets,
      @required String updateTargetsArchitecture,
      @required String updateTargetsOperatingSystem}) async {
    return CreateSoftwareUpdateJobResponse.fromJson({});
  }

  /// Creates a subscription definition. You may provide the initial version of
  /// the subscription definition now or use
  /// ''CreateSubscriptionDefinitionVersion'' at a later time.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [initialVersion]: Information about the initial version of the
  /// subscription definition.
  ///
  /// [name]: The name of the subscription definition.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<CreateSubscriptionDefinitionResponse> createSubscriptionDefinition(
      {String amznClientToken,
      SubscriptionDefinitionVersion initialVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateSubscriptionDefinitionResponse.fromJson({});
  }

  /// Creates a version of a subscription definition which has already been
  /// defined.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  ///
  /// [subscriptions]: A list of subscriptions.
  Future<CreateSubscriptionDefinitionVersionResponse>
      createSubscriptionDefinitionVersion(String subscriptionDefinitionId,
          {String amznClientToken, List<Subscription> subscriptions}) async {
    return CreateSubscriptionDefinitionVersionResponse.fromJson({});
  }

  /// Deletes a connector definition.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  Future<DeleteConnectorDefinitionResponse> deleteConnectorDefinition(
      String connectorDefinitionId) async {
    return DeleteConnectorDefinitionResponse.fromJson({});
  }

  /// Deletes a core definition.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  Future<DeleteCoreDefinitionResponse> deleteCoreDefinition(
      String coreDefinitionId) async {
    return DeleteCoreDefinitionResponse.fromJson({});
  }

  /// Deletes a device definition.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  Future<DeleteDeviceDefinitionResponse> deleteDeviceDefinition(
      String deviceDefinitionId) async {
    return DeleteDeviceDefinitionResponse.fromJson({});
  }

  /// Deletes a Lambda function definition.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  Future<DeleteFunctionDefinitionResponse> deleteFunctionDefinition(
      String functionDefinitionId) async {
    return DeleteFunctionDefinitionResponse.fromJson({});
  }

  /// Deletes a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<DeleteGroupResponse> deleteGroup(String groupId) async {
    return DeleteGroupResponse.fromJson({});
  }

  /// Deletes a logger definition.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  Future<DeleteLoggerDefinitionResponse> deleteLoggerDefinition(
      String loggerDefinitionId) async {
    return DeleteLoggerDefinitionResponse.fromJson({});
  }

  /// Deletes a resource definition.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  Future<DeleteResourceDefinitionResponse> deleteResourceDefinition(
      String resourceDefinitionId) async {
    return DeleteResourceDefinitionResponse.fromJson({});
  }

  /// Deletes a subscription definition.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  Future<DeleteSubscriptionDefinitionResponse> deleteSubscriptionDefinition(
      String subscriptionDefinitionId) async {
    return DeleteSubscriptionDefinitionResponse.fromJson({});
  }

  /// Disassociates the role from a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<DisassociateRoleFromGroupResponse> disassociateRoleFromGroup(
      String groupId) async {
    return DisassociateRoleFromGroupResponse.fromJson({});
  }

  /// Disassociates the service role from your account. Without a service role,
  /// deployments will not work.
  Future<DisassociateServiceRoleFromAccountResponse>
      disassociateServiceRoleFromAccount() async {
    return DisassociateServiceRoleFromAccountResponse.fromJson({});
  }

  /// Retrieves the role associated with a particular group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<GetAssociatedRoleResponse> getAssociatedRole(String groupId) async {
    return GetAssociatedRoleResponse.fromJson({});
  }

  /// Returns the status of a bulk deployment.
  ///
  /// [bulkDeploymentId]: The ID of the bulk deployment.
  Future<GetBulkDeploymentStatusResponse> getBulkDeploymentStatus(
      String bulkDeploymentId) async {
    return GetBulkDeploymentStatusResponse.fromJson({});
  }

  /// Retrieves the connectivity information for a core.
  ///
  /// [thingName]: The thing name.
  Future<GetConnectivityInfoResponse> getConnectivityInfo(
      String thingName) async {
    return GetConnectivityInfoResponse.fromJson({});
  }

  /// Retrieves information about a connector definition.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  Future<GetConnectorDefinitionResponse> getConnectorDefinition(
      String connectorDefinitionId) async {
    return GetConnectorDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a connector definition version, including the
  /// connectors that the version contains. Connectors are prebuilt modules that
  /// interact with local infrastructure, device protocols, AWS, and other cloud
  /// services.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  ///
  /// [connectorDefinitionVersionId]: The ID of the connector definition
  /// version. This value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListConnectorDefinitionVersions'' requests. If the version is the last
  /// one that was associated with a connector definition, the value also maps
  /// to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<GetConnectorDefinitionVersionResponse> getConnectorDefinitionVersion(
      {@required String connectorDefinitionId,
      @required String connectorDefinitionVersionId,
      String nextToken}) async {
    return GetConnectorDefinitionVersionResponse.fromJson({});
  }

  /// Retrieves information about a core definition version.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  Future<GetCoreDefinitionResponse> getCoreDefinition(
      String coreDefinitionId) async {
    return GetCoreDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a core definition version.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  ///
  /// [coreDefinitionVersionId]: The ID of the core definition version. This
  /// value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListCoreDefinitionVersions'' requests. If the version is the last one
  /// that was associated with a core definition, the value also maps to the
  /// ''LatestVersion'' property of the corresponding ''DefinitionInformation''
  /// object.
  Future<GetCoreDefinitionVersionResponse> getCoreDefinitionVersion(
      {@required String coreDefinitionId,
      @required String coreDefinitionVersionId}) async {
    return GetCoreDefinitionVersionResponse.fromJson({});
  }

  /// Returns the status of a deployment.
  ///
  /// [deploymentId]: The ID of the deployment.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<GetDeploymentStatusResponse> getDeploymentStatus(
      {@required String deploymentId, @required String groupId}) async {
    return GetDeploymentStatusResponse.fromJson({});
  }

  /// Retrieves information about a device definition.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  Future<GetDeviceDefinitionResponse> getDeviceDefinition(
      String deviceDefinitionId) async {
    return GetDeviceDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a device definition version.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  ///
  /// [deviceDefinitionVersionId]: The ID of the device definition version. This
  /// value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListDeviceDefinitionVersions'' requests. If the version is the last one
  /// that was associated with a device definition, the value also maps to the
  /// ''LatestVersion'' property of the corresponding ''DefinitionInformation''
  /// object.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<GetDeviceDefinitionVersionResponse> getDeviceDefinitionVersion(
      {@required String deviceDefinitionId,
      @required String deviceDefinitionVersionId,
      String nextToken}) async {
    return GetDeviceDefinitionVersionResponse.fromJson({});
  }

  /// Retrieves information about a Lambda function definition, including its
  /// creation time and latest version.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  Future<GetFunctionDefinitionResponse> getFunctionDefinition(
      String functionDefinitionId) async {
    return GetFunctionDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a Lambda function definition version,
  /// including which Lambda functions are included in the version and their
  /// configurations.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  ///
  /// [functionDefinitionVersionId]: The ID of the function definition version.
  /// This value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListFunctionDefinitionVersions'' requests. If the version is the last
  /// one that was associated with a function definition, the value also maps to
  /// the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<GetFunctionDefinitionVersionResponse> getFunctionDefinitionVersion(
      {@required String functionDefinitionId,
      @required String functionDefinitionVersionId,
      String nextToken}) async {
    return GetFunctionDefinitionVersionResponse.fromJson({});
  }

  /// Retrieves information about a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<GetGroupResponse> getGroup(String groupId) async {
    return GetGroupResponse.fromJson({});
  }

  /// Retreives the CA associated with a group. Returns the public key of the
  /// CA.
  ///
  /// [certificateAuthorityId]: The ID of the certificate authority.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<GetGroupCertificateAuthorityResponse> getGroupCertificateAuthority(
      {@required String certificateAuthorityId,
      @required String groupId}) async {
    return GetGroupCertificateAuthorityResponse.fromJson({});
  }

  /// Retrieves the current configuration for the CA used by the group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<GetGroupCertificateConfigurationResponse>
      getGroupCertificateConfiguration(String groupId) async {
    return GetGroupCertificateConfigurationResponse.fromJson({});
  }

  /// Retrieves information about a group version.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [groupVersionId]: The ID of the group version. This value maps to the
  /// ''Version'' property of the corresponding ''VersionInformation'' object,
  /// which is returned by ''ListGroupVersions'' requests. If the version is the
  /// last one that was associated with a group, the value also maps to the
  /// ''LatestVersion'' property of the corresponding ''GroupInformation''
  /// object.
  Future<GetGroupVersionResponse> getGroupVersion(
      {@required String groupId, @required String groupVersionId}) async {
    return GetGroupVersionResponse.fromJson({});
  }

  /// Retrieves information about a logger definition.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  Future<GetLoggerDefinitionResponse> getLoggerDefinition(
      String loggerDefinitionId) async {
    return GetLoggerDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a logger definition version.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  ///
  /// [loggerDefinitionVersionId]: The ID of the logger definition version. This
  /// value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListLoggerDefinitionVersions'' requests. If the version is the last one
  /// that was associated with a logger definition, the value also maps to the
  /// ''LatestVersion'' property of the corresponding ''DefinitionInformation''
  /// object.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<GetLoggerDefinitionVersionResponse> getLoggerDefinitionVersion(
      {@required String loggerDefinitionId,
      @required String loggerDefinitionVersionId,
      String nextToken}) async {
    return GetLoggerDefinitionVersionResponse.fromJson({});
  }

  /// Retrieves information about a resource definition, including its creation
  /// time and latest version.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  Future<GetResourceDefinitionResponse> getResourceDefinition(
      String resourceDefinitionId) async {
    return GetResourceDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a resource definition version, including which
  /// resources are included in the version.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  ///
  /// [resourceDefinitionVersionId]: The ID of the resource definition version.
  /// This value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListResourceDefinitionVersions'' requests. If the version is the last
  /// one that was associated with a resource definition, the value also maps to
  /// the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  Future<GetResourceDefinitionVersionResponse> getResourceDefinitionVersion(
      {@required String resourceDefinitionId,
      @required String resourceDefinitionVersionId}) async {
    return GetResourceDefinitionVersionResponse.fromJson({});
  }

  /// Retrieves the service role that is attached to your account.
  Future<GetServiceRoleForAccountResponse> getServiceRoleForAccount() async {
    return GetServiceRoleForAccountResponse.fromJson({});
  }

  /// Retrieves information about a subscription definition.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  Future<GetSubscriptionDefinitionResponse> getSubscriptionDefinition(
      String subscriptionDefinitionId) async {
    return GetSubscriptionDefinitionResponse.fromJson({});
  }

  /// Retrieves information about a subscription definition version.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  ///
  /// [subscriptionDefinitionVersionId]: The ID of the subscription definition
  /// version. This value maps to the ''Version'' property of the corresponding
  /// ''VersionInformation'' object, which is returned by
  /// ''ListSubscriptionDefinitionVersions'' requests. If the version is the
  /// last one that was associated with a subscription definition, the value
  /// also maps to the ''LatestVersion'' property of the corresponding
  /// ''DefinitionInformation'' object.
  Future<GetSubscriptionDefinitionVersionResponse>
      getSubscriptionDefinitionVersion(
          {String nextToken,
          @required String subscriptionDefinitionId,
          @required String subscriptionDefinitionVersionId}) async {
    return GetSubscriptionDefinitionVersionResponse.fromJson({});
  }

  /// Gets a paginated list of the deployments that have been started in a bulk
  /// deployment operation, and their current deployment status.
  ///
  /// [bulkDeploymentId]: The ID of the bulk deployment.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListBulkDeploymentDetailedReportsResponse>
      listBulkDeploymentDetailedReports(String bulkDeploymentId,
          {String maxResults, String nextToken}) async {
    return ListBulkDeploymentDetailedReportsResponse.fromJson({});
  }

  /// Returns a list of bulk deployments.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListBulkDeploymentsResponse> listBulkDeployments(
      {String maxResults, String nextToken}) async {
    return ListBulkDeploymentsResponse.fromJson({});
  }

  /// Lists the versions of a connector definition, which are containers for
  /// connectors. Connectors run on the Greengrass core and contain built-in
  /// integration with local infrastructure, device protocols, AWS, and other
  /// cloud services.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListConnectorDefinitionVersionsResponse>
      listConnectorDefinitionVersions(String connectorDefinitionId,
          {String maxResults, String nextToken}) async {
    return ListConnectorDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of connector definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListConnectorDefinitionsResponse> listConnectorDefinitions(
      {String maxResults, String nextToken}) async {
    return ListConnectorDefinitionsResponse.fromJson({});
  }

  /// Lists the versions of a core definition.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListCoreDefinitionVersionsResponse> listCoreDefinitionVersions(
      String coreDefinitionId,
      {String maxResults,
      String nextToken}) async {
    return ListCoreDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of core definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListCoreDefinitionsResponse> listCoreDefinitions(
      {String maxResults, String nextToken}) async {
    return ListCoreDefinitionsResponse.fromJson({});
  }

  /// Returns a history of deployments for the group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListDeploymentsResponse> listDeployments(String groupId,
      {String maxResults, String nextToken}) async {
    return ListDeploymentsResponse.fromJson({});
  }

  /// Lists the versions of a device definition.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListDeviceDefinitionVersionsResponse> listDeviceDefinitionVersions(
      String deviceDefinitionId,
      {String maxResults,
      String nextToken}) async {
    return ListDeviceDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of device definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListDeviceDefinitionsResponse> listDeviceDefinitions(
      {String maxResults, String nextToken}) async {
    return ListDeviceDefinitionsResponse.fromJson({});
  }

  /// Lists the versions of a Lambda function definition.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListFunctionDefinitionVersionsResponse> listFunctionDefinitionVersions(
      String functionDefinitionId,
      {String maxResults,
      String nextToken}) async {
    return ListFunctionDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of Lambda function definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListFunctionDefinitionsResponse> listFunctionDefinitions(
      {String maxResults, String nextToken}) async {
    return ListFunctionDefinitionsResponse.fromJson({});
  }

  /// Retrieves the current CAs for a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<ListGroupCertificateAuthoritiesResponse>
      listGroupCertificateAuthorities(String groupId) async {
    return ListGroupCertificateAuthoritiesResponse.fromJson({});
  }

  /// Lists the versions of a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListGroupVersionsResponse> listGroupVersions(String groupId,
      {String maxResults, String nextToken}) async {
    return ListGroupVersionsResponse.fromJson({});
  }

  /// Retrieves a list of groups.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListGroupsResponse> listGroups(
      {String maxResults, String nextToken}) async {
    return ListGroupsResponse.fromJson({});
  }

  /// Lists the versions of a logger definition.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListLoggerDefinitionVersionsResponse> listLoggerDefinitionVersions(
      String loggerDefinitionId,
      {String maxResults,
      String nextToken}) async {
    return ListLoggerDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of logger definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListLoggerDefinitionsResponse> listLoggerDefinitions(
      {String maxResults, String nextToken}) async {
    return ListLoggerDefinitionsResponse.fromJson({});
  }

  /// Lists the versions of a resource definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  Future<ListResourceDefinitionVersionsResponse> listResourceDefinitionVersions(
      String resourceDefinitionId,
      {String maxResults,
      String nextToken}) async {
    return ListResourceDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of resource definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListResourceDefinitionsResponse> listResourceDefinitions(
      {String maxResults, String nextToken}) async {
    return ListResourceDefinitionsResponse.fromJson({});
  }

  /// Lists the versions of a subscription definition.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  Future<ListSubscriptionDefinitionVersionsResponse>
      listSubscriptionDefinitionVersions(String subscriptionDefinitionId,
          {String maxResults, String nextToken}) async {
    return ListSubscriptionDefinitionVersionsResponse.fromJson({});
  }

  /// Retrieves a list of subscription definitions.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token for the next set of results, or ''null'' if there
  /// are no additional results.
  Future<ListSubscriptionDefinitionsResponse> listSubscriptionDefinitions(
      {String maxResults, String nextToken}) async {
    return ListSubscriptionDefinitionsResponse.fromJson({});
  }

  /// Retrieves a list of resource tags for a resource arn.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Resets a group's deployments.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [force]: If true, performs a best-effort only core reset.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<ResetDeploymentsResponse> resetDeployments(String groupId,
      {String amznClientToken, bool force}) async {
    return ResetDeploymentsResponse.fromJson({});
  }

  /// Deploys multiple groups in one operation. This action starts the bulk
  /// deployment of a specified set of group versions. Each group version
  /// deployment will be triggered with an adaptive rate that has a fixed upper
  /// limit. We recommend that you include an ''X-Amzn-Client-Token'' token in
  /// every ''StartBulkDeployment'' request. These requests are idempotent with
  /// respect to the token and the request parameters.
  ///
  /// [amznClientToken]: A client token used to correlate requests and
  /// responses.
  ///
  /// [executionRoleArn]: The ARN of the execution role to associate with the
  /// bulk deployment operation. This IAM role must allow the
  /// ''greengrass:CreateDeployment'' action for all group versions that are
  /// listed in the input file. This IAM role must have access to the S3 bucket
  /// containing the input file.
  ///
  /// [inputFileUri]: The URI of the input file contained in the S3 bucket. The
  /// execution role must have ''getObject'' permissions on this bucket to
  /// access the input file. The input file is a JSON-serialized, line delimited
  /// file with UTF-8 encoding that provides a list of group and version IDs and
  /// the deployment type. This file must be less than 100 MB. Currently, AWS
  /// IoT Greengrass supports only ''NewDeployment'' deployment types.
  ///
  /// [tags]: Tag(s) to add to the new resource.
  Future<StartBulkDeploymentResponse> startBulkDeployment(
      {String amznClientToken,
      @required String executionRoleArn,
      @required String inputFileUri,
      Map<String, String> tags}) async {
    return StartBulkDeploymentResponse.fromJson({});
  }

  /// Stops the execution of a bulk deployment. This action returns a status of
  /// ''Stopping'' until the deployment is stopped. You cannot start a new bulk
  /// deployment while a previous deployment is in the ''Stopping'' state. This
  /// action doesn't rollback completed deployments or cancel pending
  /// deployments.
  ///
  /// [bulkDeploymentId]: The ID of the bulk deployment.
  Future<StopBulkDeploymentResponse> stopBulkDeployment(
      String bulkDeploymentId) async {
    return StopBulkDeploymentResponse.fromJson({});
  }

  /// Add resource tags to a Greengrass Resource. Valid resources are Group,
  /// Connector, Core, Device, Function, Logger, Subscription, and Resource
  /// Defintions, and also BulkDeploymentIds.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  Future<void> tagResource(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Remove resource tags from a Greengrass Resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tagKeys]: An array of tag keys to delete
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the connectivity information for the core. Any devices that belong
  /// to the group which has this core will receive this information in order to
  /// find the location of the core and connect to it.
  ///
  /// [connectivityInfo]: A list of connectivity info.
  ///
  /// [thingName]: The thing name.
  Future<UpdateConnectivityInfoResponse> updateConnectivityInfo(
      String thingName,
      {List<ConnectivityInfo> connectivityInfo}) async {
    return UpdateConnectivityInfoResponse.fromJson({});
  }

  /// Updates a connector definition.
  ///
  /// [connectorDefinitionId]: The ID of the connector definition.
  ///
  /// [name]: The name of the definition.
  Future<UpdateConnectorDefinitionResponse> updateConnectorDefinition(
      String connectorDefinitionId,
      {String name}) async {
    return UpdateConnectorDefinitionResponse.fromJson({});
  }

  /// Updates a core definition.
  ///
  /// [coreDefinitionId]: The ID of the core definition.
  ///
  /// [name]: The name of the definition.
  Future<UpdateCoreDefinitionResponse> updateCoreDefinition(
      String coreDefinitionId,
      {String name}) async {
    return UpdateCoreDefinitionResponse.fromJson({});
  }

  /// Updates a device definition.
  ///
  /// [deviceDefinitionId]: The ID of the device definition.
  ///
  /// [name]: The name of the definition.
  Future<UpdateDeviceDefinitionResponse> updateDeviceDefinition(
      String deviceDefinitionId,
      {String name}) async {
    return UpdateDeviceDefinitionResponse.fromJson({});
  }

  /// Updates a Lambda function definition.
  ///
  /// [functionDefinitionId]: The ID of the Lambda function definition.
  ///
  /// [name]: The name of the definition.
  Future<UpdateFunctionDefinitionResponse> updateFunctionDefinition(
      String functionDefinitionId,
      {String name}) async {
    return UpdateFunctionDefinitionResponse.fromJson({});
  }

  /// Updates a group.
  ///
  /// [groupId]: The ID of the Greengrass group.
  ///
  /// [name]: The name of the definition.
  Future<UpdateGroupResponse> updateGroup(String groupId, {String name}) async {
    return UpdateGroupResponse.fromJson({});
  }

  /// Updates the Certificate expiry time for a group.
  ///
  /// [certificateExpiryInMilliseconds]: The amount of time remaining before the
  /// certificate expires, in milliseconds.
  ///
  /// [groupId]: The ID of the Greengrass group.
  Future<UpdateGroupCertificateConfigurationResponse>
      updateGroupCertificateConfiguration(String groupId,
          {String certificateExpiryInMilliseconds}) async {
    return UpdateGroupCertificateConfigurationResponse.fromJson({});
  }

  /// Updates a logger definition.
  ///
  /// [loggerDefinitionId]: The ID of the logger definition.
  ///
  /// [name]: The name of the definition.
  Future<UpdateLoggerDefinitionResponse> updateLoggerDefinition(
      String loggerDefinitionId,
      {String name}) async {
    return UpdateLoggerDefinitionResponse.fromJson({});
  }

  /// Updates a resource definition.
  ///
  /// [name]: The name of the definition.
  ///
  /// [resourceDefinitionId]: The ID of the resource definition.
  Future<UpdateResourceDefinitionResponse> updateResourceDefinition(
      String resourceDefinitionId,
      {String name}) async {
    return UpdateResourceDefinitionResponse.fromJson({});
  }

  /// Updates a subscription definition.
  ///
  /// [name]: The name of the definition.
  ///
  /// [subscriptionDefinitionId]: The ID of the subscription definition.
  Future<UpdateSubscriptionDefinitionResponse> updateSubscriptionDefinition(
      String subscriptionDefinitionId,
      {String name}) async {
    return UpdateSubscriptionDefinitionResponse.fromJson({});
  }
}

class AssociateRoleToGroupResponse {
  /// The time, in milliseconds since the epoch, when the role ARN was
  /// associated with the group.
  final String associatedAt;

  AssociateRoleToGroupResponse({
    this.associatedAt,
  });
  static AssociateRoleToGroupResponse fromJson(Map<String, dynamic> json) =>
      AssociateRoleToGroupResponse();
}

class AssociateServiceRoleToAccountResponse {
  /// The time when the service role was associated with the account.
  final String associatedAt;

  AssociateServiceRoleToAccountResponse({
    this.associatedAt,
  });
  static AssociateServiceRoleToAccountResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateServiceRoleToAccountResponse();
}

class BulkDeployment {
  /// The ARN of the bulk deployment.
  final String bulkDeploymentArn;

  /// The ID of the bulk deployment.
  final String bulkDeploymentId;

  /// The time, in ISO format, when the deployment was created.
  final String createdAt;

  BulkDeployment({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
    this.createdAt,
  });
  static BulkDeployment fromJson(Map<String, dynamic> json) => BulkDeployment();
}

class BulkDeploymentMetrics {
  /// The total number of records that returned a non-retryable error. For
  /// example, this can occur if a group record from the input file uses an
  /// invalid format or specifies a nonexistent group version, or if the
  /// execution role doesn't grant permission to deploy a group or group
  /// version.
  final int invalidInputRecords;

  /// The total number of group records from the input file that have been
  /// processed so far, or attempted.
  final int recordsProcessed;

  /// The total number of deployment attempts that returned a retryable error.
  /// For example, a retry is triggered if the attempt to deploy a group returns
  /// a throttling error. ''StartBulkDeployment'' retries a group deployment up
  /// to five times.
  final int retryAttempts;

  BulkDeploymentMetrics({
    this.invalidInputRecords,
    this.recordsProcessed,
    this.retryAttempts,
  });
  static BulkDeploymentMetrics fromJson(Map<String, dynamic> json) =>
      BulkDeploymentMetrics();
}

class BulkDeploymentResult {
  /// The time, in ISO format, when the deployment was created.
  final String createdAt;

  /// The ARN of the group deployment.
  final String deploymentArn;

  /// The ID of the group deployment.
  final String deploymentId;

  /// The current status of the group deployment: ''InProgress'', ''Building'',
  /// ''Success'', or ''Failure''.
  final String deploymentStatus;

  /// The type of the deployment.
  final String deploymentType;

  /// Details about the error.
  final List<ErrorDetail> errorDetails;

  /// The error message for a failed deployment
  final String errorMessage;

  /// The ARN of the Greengrass group.
  final String groupArn;

  BulkDeploymentResult({
    this.createdAt,
    this.deploymentArn,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentType,
    this.errorDetails,
    this.errorMessage,
    this.groupArn,
  });
  static BulkDeploymentResult fromJson(Map<String, dynamic> json) =>
      BulkDeploymentResult();
}

class ConnectivityInfo {
  /// The endpoint for the Greengrass core. Can be an IP address or DNS.
  final String hostAddress;

  /// The ID of the connectivity information.
  final String id;

  /// Metadata for this endpoint.
  final String metadata;

  /// The port of the Greengrass core. Usually 8883.
  final int portNumber;

  ConnectivityInfo({
    this.hostAddress,
    this.id,
    this.metadata,
    this.portNumber,
  });
  static ConnectivityInfo fromJson(Map<String, dynamic> json) =>
      ConnectivityInfo();
}

class Connector {
  /// The ARN of the connector.
  final String connectorArn;

  /// A descriptive or arbitrary ID for the connector. This value must be unique
  /// within the connector definition version. Max length is 128 characters with
  /// pattern \[a-zA-Z0-9:_-\]+.
  final String id;

  /// The parameters or configuration that the connector uses.
  final Map<String, String> parameters;

  Connector({
    @required this.connectorArn,
    @required this.id,
    this.parameters,
  });
  static Connector fromJson(Map<String, dynamic> json) => Connector();
}

class ConnectorDefinitionVersion {
  /// A list of references to connectors in this version, with their
  /// corresponding configuration settings.
  final List<Connector> connectors;

  ConnectorDefinitionVersion({
    this.connectors,
  });
  static ConnectorDefinitionVersion fromJson(Map<String, dynamic> json) =>
      ConnectorDefinitionVersion();
}

class Core {
  /// The ARN of the certificate associated with the core.
  final String certificateArn;

  /// A descriptive or arbitrary ID for the core. This value must be unique
  /// within the core definition version. Max length is 128 characters with
  /// pattern ''\[a-zA-Z0-9:_-\]+''.
  final String id;

  /// If true, the core's local shadow is automatically synced with the cloud.
  final bool syncShadow;

  /// The ARN of the thing which is the core.
  final String thingArn;

  Core({
    @required this.certificateArn,
    @required this.id,
    this.syncShadow,
    @required this.thingArn,
  });
  static Core fromJson(Map<String, dynamic> json) => Core();
}

class CoreDefinitionVersion {
  /// A list of cores in the core definition version.
  final List<Core> cores;

  CoreDefinitionVersion({
    this.cores,
  });
  static CoreDefinitionVersion fromJson(Map<String, dynamic> json) =>
      CoreDefinitionVersion();
}

class CreateConnectorDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateConnectorDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateConnectorDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConnectorDefinitionResponse();
}

class CreateConnectorDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateConnectorDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConnectorDefinitionVersionResponse();
}

class CreateCoreDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateCoreDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateCoreDefinitionResponse fromJson(Map<String, dynamic> json) =>
      CreateCoreDefinitionResponse();
}

class CreateCoreDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateCoreDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateCoreDefinitionVersionResponse();
}

class CreateDeploymentResponse {
  /// The ARN of the deployment.
  final String deploymentArn;

  /// The ID of the deployment.
  final String deploymentId;

  CreateDeploymentResponse({
    this.deploymentArn,
    this.deploymentId,
  });
  static CreateDeploymentResponse fromJson(Map<String, dynamic> json) =>
      CreateDeploymentResponse();
}

class CreateDeviceDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateDeviceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateDeviceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      CreateDeviceDefinitionResponse();
}

class CreateDeviceDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateDeviceDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateDeviceDefinitionVersionResponse();
}

class CreateFunctionDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateFunctionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateFunctionDefinitionResponse fromJson(Map<String, dynamic> json) =>
      CreateFunctionDefinitionResponse();
}

class CreateFunctionDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateFunctionDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateFunctionDefinitionVersionResponse();
}

class CreateGroupCertificateAuthorityResponse {
  /// The ARN of the group certificate authority.
  final String groupCertificateAuthorityArn;

  CreateGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
  });
  static CreateGroupCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      CreateGroupCertificateAuthorityResponse();
}

class CreateGroupResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateGroupResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupResponse();
}

class CreateGroupVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateGroupVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupVersionResponse();
}

class CreateLoggerDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateLoggerDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateLoggerDefinitionResponse fromJson(Map<String, dynamic> json) =>
      CreateLoggerDefinitionResponse();
}

class CreateLoggerDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateLoggerDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateLoggerDefinitionVersionResponse();
}

class CreateResourceDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateResourceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateResourceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      CreateResourceDefinitionResponse();
}

class CreateResourceDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateResourceDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateResourceDefinitionVersionResponse();
}

class CreateSoftwareUpdateJobResponse {
  /// The IoT Job ARN corresponding to this update.
  final String iotJobArn;

  /// The IoT Job Id corresponding to this update.
  final String iotJobId;

  CreateSoftwareUpdateJobResponse({
    this.iotJobArn,
    this.iotJobId,
  });
  static CreateSoftwareUpdateJobResponse fromJson(Map<String, dynamic> json) =>
      CreateSoftwareUpdateJobResponse();
}

class CreateSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  CreateSubscriptionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static CreateSubscriptionDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSubscriptionDefinitionResponse();
}

class CreateSubscriptionDefinitionVersionResponse {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  CreateSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static CreateSubscriptionDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSubscriptionDefinitionVersionResponse();
}

class DefinitionInformation {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  DefinitionInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static DefinitionInformation fromJson(Map<String, dynamic> json) =>
      DefinitionInformation();
}

class DeleteConnectorDefinitionResponse {
  DeleteConnectorDefinitionResponse();
  static DeleteConnectorDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteConnectorDefinitionResponse();
}

class DeleteCoreDefinitionResponse {
  DeleteCoreDefinitionResponse();
  static DeleteCoreDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteCoreDefinitionResponse();
}

class DeleteDeviceDefinitionResponse {
  DeleteDeviceDefinitionResponse();
  static DeleteDeviceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteDeviceDefinitionResponse();
}

class DeleteFunctionDefinitionResponse {
  DeleteFunctionDefinitionResponse();
  static DeleteFunctionDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteFunctionDefinitionResponse();
}

class DeleteGroupResponse {
  DeleteGroupResponse();
  static DeleteGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteGroupResponse();
}

class DeleteLoggerDefinitionResponse {
  DeleteLoggerDefinitionResponse();
  static DeleteLoggerDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteLoggerDefinitionResponse();
}

class DeleteResourceDefinitionResponse {
  DeleteResourceDefinitionResponse();
  static DeleteResourceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteResourceDefinitionResponse();
}

class DeleteSubscriptionDefinitionResponse {
  DeleteSubscriptionDefinitionResponse();
  static DeleteSubscriptionDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteSubscriptionDefinitionResponse();
}

class Deployment {
  /// The time, in milliseconds since the epoch, when the deployment was
  /// created.
  final String createdAt;

  /// The ARN of the deployment.
  final String deploymentArn;

  /// The ID of the deployment.
  final String deploymentId;

  /// The type of the deployment.
  final String deploymentType;

  /// The ARN of the group for this deployment.
  final String groupArn;

  Deployment({
    this.createdAt,
    this.deploymentArn,
    this.deploymentId,
    this.deploymentType,
    this.groupArn,
  });
  static Deployment fromJson(Map<String, dynamic> json) => Deployment();
}

class Device {
  /// The ARN of the certificate associated with the device.
  final String certificateArn;

  /// A descriptive or arbitrary ID for the device. This value must be unique
  /// within the device definition version. Max length is 128 characters with
  /// pattern ''\[a-zA-Z0-9:_-\]+''.
  final String id;

  /// If true, the device's local shadow will be automatically synced with the
  /// cloud.
  final bool syncShadow;

  /// The thing ARN of the device.
  final String thingArn;

  Device({
    @required this.certificateArn,
    @required this.id,
    this.syncShadow,
    @required this.thingArn,
  });
  static Device fromJson(Map<String, dynamic> json) => Device();
}

class DeviceDefinitionVersion {
  /// A list of devices in the definition version.
  final List<Device> devices;

  DeviceDefinitionVersion({
    this.devices,
  });
  static DeviceDefinitionVersion fromJson(Map<String, dynamic> json) =>
      DeviceDefinitionVersion();
}

class DisassociateRoleFromGroupResponse {
  /// The time, in milliseconds since the epoch, when the role was disassociated
  /// from the group.
  final String disassociatedAt;

  DisassociateRoleFromGroupResponse({
    this.disassociatedAt,
  });
  static DisassociateRoleFromGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateRoleFromGroupResponse();
}

class DisassociateServiceRoleFromAccountResponse {
  /// The time when the service role was disassociated from the account.
  final String disassociatedAt;

  DisassociateServiceRoleFromAccountResponse({
    this.disassociatedAt,
  });
  static DisassociateServiceRoleFromAccountResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateServiceRoleFromAccountResponse();
}

class ErrorDetail {
  /// A detailed error code.
  final String detailedErrorCode;

  /// A detailed error message.
  final String detailedErrorMessage;

  ErrorDetail({
    this.detailedErrorCode,
    this.detailedErrorMessage,
  });
  static ErrorDetail fromJson(Map<String, dynamic> json) => ErrorDetail();
}

class Function {
  /// The ARN of the Lambda function.
  final String functionArn;

  /// The configuration of the Lambda function.
  final FunctionConfiguration functionConfiguration;

  /// A descriptive or arbitrary ID for the function. This value must be unique
  /// within the function definition version. Max length is 128 characters with
  /// pattern ''\[a-zA-Z0-9:_-\]+''.
  final String id;

  Function({
    this.functionArn,
    this.functionConfiguration,
    @required this.id,
  });
  static Function fromJson(Map<String, dynamic> json) => Function();
}

class FunctionConfiguration {
  /// The expected encoding type of the input payload for the function. The
  /// default is ''json''.
  final String encodingType;

  /// The environment configuration of the function.
  final FunctionConfigurationEnvironment environment;

  /// The execution arguments.
  final String execArgs;

  /// The name of the function executable.
  final String executable;

  /// The memory size, in KB, which the function requires. This setting is not
  /// applicable and should be cleared when you run the Lambda function without
  /// containerization.
  final int memorySize;

  /// True if the function is pinned. Pinned means the function is long-lived
  /// and starts when the core starts.
  final bool pinned;

  /// The allowed function execution time, after which Lambda should terminate
  /// the function. This timeout still applies to pinned Lambda functions for
  /// each request.
  final int timeout;

  FunctionConfiguration({
    this.encodingType,
    this.environment,
    this.execArgs,
    this.executable,
    this.memorySize,
    this.pinned,
    this.timeout,
  });
  static FunctionConfiguration fromJson(Map<String, dynamic> json) =>
      FunctionConfiguration();
}

class FunctionConfigurationEnvironment {
  /// If true, the Lambda function is allowed to access the host's /sys folder.
  /// Use this when the Lambda function needs to read device information from
  /// /sys. This setting applies only when you run the Lambda function in a
  /// Greengrass container.
  final bool accessSysfs;

  /// Configuration related to executing the Lambda function
  final FunctionExecutionConfig execution;

  /// A list of the resources, with their permissions, to which the Lambda
  /// function will be granted access. A Lambda function can have at most 10
  /// resources. ResourceAccessPolicies apply only when you run the Lambda
  /// function in a Greengrass container.
  final List<ResourceAccessPolicy> resourceAccessPolicies;

  /// Environment variables for the Lambda function's configuration.
  final Map<String, String> variables;

  FunctionConfigurationEnvironment({
    this.accessSysfs,
    this.execution,
    this.resourceAccessPolicies,
    this.variables,
  });
  static FunctionConfigurationEnvironment fromJson(Map<String, dynamic> json) =>
      FunctionConfigurationEnvironment();
}

class FunctionDefaultConfig {
  final FunctionDefaultExecutionConfig execution;

  FunctionDefaultConfig({
    this.execution,
  });
  static FunctionDefaultConfig fromJson(Map<String, dynamic> json) =>
      FunctionDefaultConfig();
}

class FunctionDefaultExecutionConfig {
  final String isolationMode;

  final FunctionRunAsConfig runAs;

  FunctionDefaultExecutionConfig({
    this.isolationMode,
    this.runAs,
  });
  static FunctionDefaultExecutionConfig fromJson(Map<String, dynamic> json) =>
      FunctionDefaultExecutionConfig();
}

class FunctionDefinitionVersion {
  /// The default configuration that applies to all Lambda functions in this
  /// function definition version. Individual Lambda functions can override
  /// these settings.
  final FunctionDefaultConfig defaultConfig;

  /// A list of Lambda functions in this function definition version.
  final List<Function> functions;

  FunctionDefinitionVersion({
    this.defaultConfig,
    this.functions,
  });
  static FunctionDefinitionVersion fromJson(Map<String, dynamic> json) =>
      FunctionDefinitionVersion();
}

class FunctionExecutionConfig {
  final String isolationMode;

  final FunctionRunAsConfig runAs;

  FunctionExecutionConfig({
    this.isolationMode,
    this.runAs,
  });
  static FunctionExecutionConfig fromJson(Map<String, dynamic> json) =>
      FunctionExecutionConfig();
}

class FunctionRunAsConfig {
  /// The group ID whose permissions are used to run a Lambda function.
  final int gid;

  /// The user ID whose permissions are used to run a Lambda function.
  final int uid;

  FunctionRunAsConfig({
    this.gid,
    this.uid,
  });
  static FunctionRunAsConfig fromJson(Map<String, dynamic> json) =>
      FunctionRunAsConfig();
}

class GetAssociatedRoleResponse {
  /// The time when the role was associated with the group.
  final String associatedAt;

  /// The ARN of the role that is associated with the group.
  final String roleArn;

  GetAssociatedRoleResponse({
    this.associatedAt,
    this.roleArn,
  });
  static GetAssociatedRoleResponse fromJson(Map<String, dynamic> json) =>
      GetAssociatedRoleResponse();
}

class GetBulkDeploymentStatusResponse {
  /// Relevant metrics on input records processed during bulk deployment.
  final BulkDeploymentMetrics bulkDeploymentMetrics;

  /// The status of the bulk deployment.
  final String bulkDeploymentStatus;

  /// The time, in ISO format, when the deployment was created.
  final String createdAt;

  /// Error details
  final List<ErrorDetail> errorDetails;

  /// Error message
  final String errorMessage;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetBulkDeploymentStatusResponse({
    this.bulkDeploymentMetrics,
    this.bulkDeploymentStatus,
    this.createdAt,
    this.errorDetails,
    this.errorMessage,
    this.tags,
  });
  static GetBulkDeploymentStatusResponse fromJson(Map<String, dynamic> json) =>
      GetBulkDeploymentStatusResponse();
}

class GetConnectivityInfoResponse {
  /// Connectivity info list.
  final List<ConnectivityInfo> connectivityInfo;

  /// A message about the connectivity info request.
  final String message;

  GetConnectivityInfoResponse({
    this.connectivityInfo,
    this.message,
  });
  static GetConnectivityInfoResponse fromJson(Map<String, dynamic> json) =>
      GetConnectivityInfoResponse();
}

class GetConnectorDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetConnectorDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetConnectorDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetConnectorDefinitionResponse();
}

class GetConnectorDefinitionVersionResponse {
  /// The ARN of the connector definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the connector definition
  /// version was created.
  final String creationTimestamp;

  /// Information about the connector definition version.
  final ConnectorDefinitionVersion definition;

  /// The ID of the connector definition version.
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// The version of the connector definition version.
  final String version;

  GetConnectorDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  static GetConnectorDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetConnectorDefinitionVersionResponse();
}

class GetCoreDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetCoreDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetCoreDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetCoreDefinitionResponse();
}

class GetCoreDefinitionVersionResponse {
  /// The ARN of the core definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the core definition
  /// version was created.
  final String creationTimestamp;

  /// Information about the core definition version.
  final CoreDefinitionVersion definition;

  /// The ID of the core definition version.
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// The version of the core definition version.
  final String version;

  GetCoreDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  static GetCoreDefinitionVersionResponse fromJson(Map<String, dynamic> json) =>
      GetCoreDefinitionVersionResponse();
}

class GetDeploymentStatusResponse {
  /// The status of the deployment: ''InProgress'', ''Building'', ''Success'',
  /// or ''Failure''.
  final String deploymentStatus;

  /// The type of the deployment.
  final String deploymentType;

  /// Error details
  final List<ErrorDetail> errorDetails;

  /// Error message
  final String errorMessage;

  /// The time, in milliseconds since the epoch, when the deployment status was
  /// updated.
  final String updatedAt;

  GetDeploymentStatusResponse({
    this.deploymentStatus,
    this.deploymentType,
    this.errorDetails,
    this.errorMessage,
    this.updatedAt,
  });
  static GetDeploymentStatusResponse fromJson(Map<String, dynamic> json) =>
      GetDeploymentStatusResponse();
}

class GetDeviceDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetDeviceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetDeviceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetDeviceDefinitionResponse();
}

class GetDeviceDefinitionVersionResponse {
  /// The ARN of the device definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the device definition
  /// version was created.
  final String creationTimestamp;

  /// Information about the device definition version.
  final DeviceDefinitionVersion definition;

  /// The ID of the device definition version.
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// The version of the device definition version.
  final String version;

  GetDeviceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  static GetDeviceDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetDeviceDefinitionVersionResponse();
}

class GetFunctionDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetFunctionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetFunctionDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionDefinitionResponse();
}

class GetFunctionDefinitionVersionResponse {
  /// The ARN of the function definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the function definition
  /// version was created.
  final String creationTimestamp;

  /// Information on the definition.
  final FunctionDefinitionVersion definition;

  /// The ID of the function definition version.
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// The version of the function definition version.
  final String version;

  GetFunctionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  static GetFunctionDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetFunctionDefinitionVersionResponse();
}

class GetGroupCertificateAuthorityResponse {
  /// The ARN of the certificate authority for the group.
  final String groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  final String groupCertificateAuthorityId;

  /// The PEM encoded certificate for the group.
  final String pemEncodedCertificate;

  GetGroupCertificateAuthorityResponse({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
    this.pemEncodedCertificate,
  });
  static GetGroupCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      GetGroupCertificateAuthorityResponse();
}

class GetGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  final String certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  final String certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  final String groupId;

  GetGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });
  static GetGroupCertificateConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      GetGroupCertificateConfigurationResponse();
}

class GetGroupResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetGroupResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetGroupResponse fromJson(Map<String, dynamic> json) =>
      GetGroupResponse();
}

class GetGroupVersionResponse {
  /// The ARN of the group version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the group version was
  /// created.
  final String creationTimestamp;

  /// Information about the group version definition.
  final GroupVersion definition;

  /// The ID of the group version.
  final String id;

  /// The unique ID for the version of the group.
  final String version;

  GetGroupVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  static GetGroupVersionResponse fromJson(Map<String, dynamic> json) =>
      GetGroupVersionResponse();
}

class GetLoggerDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetLoggerDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetLoggerDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetLoggerDefinitionResponse();
}

class GetLoggerDefinitionVersionResponse {
  /// The ARN of the logger definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the logger definition
  /// version was created.
  final String creationTimestamp;

  /// Information about the logger definition version.
  final LoggerDefinitionVersion definition;

  /// The ID of the logger definition version.
  final String id;

  /// The version of the logger definition version.
  final String version;

  GetLoggerDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  static GetLoggerDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetLoggerDefinitionVersionResponse();
}

class GetResourceDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetResourceDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetResourceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      GetResourceDefinitionResponse();
}

class GetResourceDefinitionVersionResponse {
  /// Arn of the resource definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the resource definition
  /// version was created.
  final String creationTimestamp;

  /// Information about the definition.
  final ResourceDefinitionVersion definition;

  /// The ID of the resource definition version.
  final String id;

  /// The version of the resource definition version.
  final String version;

  GetResourceDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.version,
  });
  static GetResourceDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetResourceDefinitionVersionResponse();
}

class GetServiceRoleForAccountResponse {
  /// The time when the service role was associated with the account.
  final String associatedAt;

  /// The ARN of the role which is associated with the account.
  final String roleArn;

  GetServiceRoleForAccountResponse({
    this.associatedAt,
    this.roleArn,
  });
  static GetServiceRoleForAccountResponse fromJson(Map<String, dynamic> json) =>
      GetServiceRoleForAccountResponse();
}

class GetSubscriptionDefinitionResponse {
  /// The ARN of the definition.
  final String arn;

  /// The time, in milliseconds since the epoch, when the definition was
  /// created.
  final String creationTimestamp;

  /// The ID of the definition.
  final String id;

  /// The time, in milliseconds since the epoch, when the definition was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the definition.
  final String latestVersion;

  /// The ARN of the latest version associated with the definition.
  final String latestVersionArn;

  /// The name of the definition.
  final String name;

  /// Tag(s) attached to the resource arn.
  final Map<String, String> tags;

  GetSubscriptionDefinitionResponse({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
    this.tags,
  });
  static GetSubscriptionDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      GetSubscriptionDefinitionResponse();
}

class GetSubscriptionDefinitionVersionResponse {
  /// The ARN of the subscription definition version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the subscription
  /// definition version was created.
  final String creationTimestamp;

  /// Information about the subscription definition version.
  final SubscriptionDefinitionVersion definition;

  /// The ID of the subscription definition version.
  final String id;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// The version of the subscription definition version.
  final String version;

  GetSubscriptionDefinitionVersionResponse({
    this.arn,
    this.creationTimestamp,
    this.definition,
    this.id,
    this.nextToken,
    this.version,
  });
  static GetSubscriptionDefinitionVersionResponse fromJson(
          Map<String, dynamic> json) =>
      GetSubscriptionDefinitionVersionResponse();
}

class GroupCertificateAuthorityProperties {
  /// The ARN of the certificate authority for the group.
  final String groupCertificateAuthorityArn;

  /// The ID of the certificate authority for the group.
  final String groupCertificateAuthorityId;

  GroupCertificateAuthorityProperties({
    this.groupCertificateAuthorityArn,
    this.groupCertificateAuthorityId,
  });
  static GroupCertificateAuthorityProperties fromJson(
          Map<String, dynamic> json) =>
      GroupCertificateAuthorityProperties();
}

class GroupInformation {
  /// The ARN of the group.
  final String arn;

  /// The time, in milliseconds since the epoch, when the group was created.
  final String creationTimestamp;

  /// The ID of the group.
  final String id;

  /// The time, in milliseconds since the epoch, when the group was last
  /// updated.
  final String lastUpdatedTimestamp;

  /// The ID of the latest version associated with the group.
  final String latestVersion;

  /// The ARN of the latest version associated with the group.
  final String latestVersionArn;

  /// The name of the group.
  final String name;

  GroupInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.lastUpdatedTimestamp,
    this.latestVersion,
    this.latestVersionArn,
    this.name,
  });
  static GroupInformation fromJson(Map<String, dynamic> json) =>
      GroupInformation();
}

class GroupOwnerSetting {
  /// If true, AWS IoT Greengrass automatically adds the specified Linux OS
  /// group owner of the resource to the Lambda process privileges. Thus the
  /// Lambda process will have the file access permissions of the added Linux
  /// group.
  final bool autoAddGroupOwner;

  /// The name of the Linux OS group whose privileges will be added to the
  /// Lambda process. This field is optional.
  final String groupOwner;

  GroupOwnerSetting({
    this.autoAddGroupOwner,
    this.groupOwner,
  });
  static GroupOwnerSetting fromJson(Map<String, dynamic> json) =>
      GroupOwnerSetting();
}

class GroupVersion {
  /// The ARN of the connector definition version for this group.
  final String connectorDefinitionVersionArn;

  /// The ARN of the core definition version for this group.
  final String coreDefinitionVersionArn;

  /// The ARN of the device definition version for this group.
  final String deviceDefinitionVersionArn;

  /// The ARN of the function definition version for this group.
  final String functionDefinitionVersionArn;

  /// The ARN of the logger definition version for this group.
  final String loggerDefinitionVersionArn;

  /// The ARN of the resource definition version for this group.
  final String resourceDefinitionVersionArn;

  /// The ARN of the subscription definition version for this group.
  final String subscriptionDefinitionVersionArn;

  GroupVersion({
    this.connectorDefinitionVersionArn,
    this.coreDefinitionVersionArn,
    this.deviceDefinitionVersionArn,
    this.functionDefinitionVersionArn,
    this.loggerDefinitionVersionArn,
    this.resourceDefinitionVersionArn,
    this.subscriptionDefinitionVersionArn,
  });
  static GroupVersion fromJson(Map<String, dynamic> json) => GroupVersion();
}

class ListBulkDeploymentDetailedReportsResponse {
  /// A list of the individual group deployments in the bulk deployment
  /// operation.
  final List<BulkDeploymentResult> deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListBulkDeploymentDetailedReportsResponse({
    this.deployments,
    this.nextToken,
  });
  static ListBulkDeploymentDetailedReportsResponse fromJson(
          Map<String, dynamic> json) =>
      ListBulkDeploymentDetailedReportsResponse();
}

class ListBulkDeploymentsResponse {
  /// A list of bulk deployments.
  final List<BulkDeployment> bulkDeployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListBulkDeploymentsResponse({
    this.bulkDeployments,
    this.nextToken,
  });
  static ListBulkDeploymentsResponse fromJson(Map<String, dynamic> json) =>
      ListBulkDeploymentsResponse();
}

class ListConnectorDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListConnectorDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListConnectorDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListConnectorDefinitionVersionsResponse();
}

class ListConnectorDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListConnectorDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListConnectorDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListConnectorDefinitionsResponse();
}

class ListCoreDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListCoreDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListCoreDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListCoreDefinitionVersionsResponse();
}

class ListCoreDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListCoreDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListCoreDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListCoreDefinitionsResponse();
}

class ListDeploymentsResponse {
  /// A list of deployments for the requested groups.
  final List<Deployment> deployments;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListDeploymentsResponse({
    this.deployments,
    this.nextToken,
  });
  static ListDeploymentsResponse fromJson(Map<String, dynamic> json) =>
      ListDeploymentsResponse();
}

class ListDeviceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListDeviceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListDeviceDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDeviceDefinitionVersionsResponse();
}

class ListDeviceDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListDeviceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListDeviceDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListDeviceDefinitionsResponse();
}

class ListFunctionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListFunctionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListFunctionDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListFunctionDefinitionVersionsResponse();
}

class ListFunctionDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListFunctionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListFunctionDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListFunctionDefinitionsResponse();
}

class ListGroupCertificateAuthoritiesResponse {
  /// A list of certificate authorities associated with the group.
  final List<GroupCertificateAuthorityProperties> groupCertificateAuthorities;

  ListGroupCertificateAuthoritiesResponse({
    this.groupCertificateAuthorities,
  });
  static ListGroupCertificateAuthoritiesResponse fromJson(
          Map<String, dynamic> json) =>
      ListGroupCertificateAuthoritiesResponse();
}

class ListGroupVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListGroupVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListGroupVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupVersionsResponse();
}

class ListGroupsResponse {
  /// Information about a group.
  final List<GroupInformation> groups;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  static ListGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsResponse();
}

class ListLoggerDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListLoggerDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListLoggerDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListLoggerDefinitionVersionsResponse();
}

class ListLoggerDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListLoggerDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListLoggerDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListLoggerDefinitionsResponse();
}

class ListResourceDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListResourceDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListResourceDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListResourceDefinitionVersionsResponse();
}

class ListResourceDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListResourceDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListResourceDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      ListResourceDefinitionsResponse();
}

class ListSubscriptionDefinitionVersionsResponse {
  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  /// Information about a version.
  final List<VersionInformation> versions;

  ListSubscriptionDefinitionVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListSubscriptionDefinitionVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListSubscriptionDefinitionVersionsResponse();
}

class ListSubscriptionDefinitionsResponse {
  /// Information about a definition.
  final List<DefinitionInformation> definitions;

  /// The token for the next set of results, or ''null'' if there are no
  /// additional results.
  final String nextToken;

  ListSubscriptionDefinitionsResponse({
    this.definitions,
    this.nextToken,
  });
  static ListSubscriptionDefinitionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListSubscriptionDefinitionsResponse();
}

class ListTagsForResourceResponse {
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class LocalDeviceResourceData {
  /// Group/owner related settings for local resources.
  final GroupOwnerSetting groupOwnerSetting;

  /// The local absolute path of the device resource. The source path for a
  /// device resource can refer only to a character device or block device under
  /// ''/dev''.
  final String sourcePath;

  LocalDeviceResourceData({
    this.groupOwnerSetting,
    this.sourcePath,
  });
  static LocalDeviceResourceData fromJson(Map<String, dynamic> json) =>
      LocalDeviceResourceData();
}

class LocalVolumeResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String destinationPath;

  /// Allows you to configure additional group privileges for the Lambda
  /// process. This field is optional.
  final GroupOwnerSetting groupOwnerSetting;

  /// The local absolute path of the volume resource on the host. The source
  /// path for a volume resource type cannot start with ''/sys''.
  final String sourcePath;

  LocalVolumeResourceData({
    this.destinationPath,
    this.groupOwnerSetting,
    this.sourcePath,
  });
  static LocalVolumeResourceData fromJson(Map<String, dynamic> json) =>
      LocalVolumeResourceData();
}

class Logger {
  /// The component that will be subject to logging.
  final String component;

  /// A descriptive or arbitrary ID for the logger. This value must be unique
  /// within the logger definition version. Max length is 128 characters with
  /// pattern ''\[a-zA-Z0-9:_-\]+''.
  final String id;

  /// The level of the logs.
  final String level;

  /// The amount of file space, in KB, to use if the local file system is used
  /// for logging purposes.
  final int space;

  /// The type of log output which will be used.
  final String type;

  Logger({
    @required this.component,
    @required this.id,
    @required this.level,
    this.space,
    @required this.type,
  });
  static Logger fromJson(Map<String, dynamic> json) => Logger();
}

class LoggerDefinitionVersion {
  /// A list of loggers.
  final List<Logger> loggers;

  LoggerDefinitionVersion({
    this.loggers,
  });
  static LoggerDefinitionVersion fromJson(Map<String, dynamic> json) =>
      LoggerDefinitionVersion();
}

class ResetDeploymentsResponse {
  /// The ARN of the deployment.
  final String deploymentArn;

  /// The ID of the deployment.
  final String deploymentId;

  ResetDeploymentsResponse({
    this.deploymentArn,
    this.deploymentId,
  });
  static ResetDeploymentsResponse fromJson(Map<String, dynamic> json) =>
      ResetDeploymentsResponse();
}

class Resource {
  /// The resource ID, used to refer to a resource in the Lambda function
  /// configuration. Max length is 128 characters with pattern
  /// ''\[a-zA-Z0-9:_-\]+''. This must be unique within a Greengrass group.
  final String id;

  /// The descriptive resource name, which is displayed on the AWS IoT
  /// Greengrass console. Max length 128 characters with pattern
  /// ''\[a-zA-Z0-9:_-\]+''. This must be unique within a Greengrass group.
  final String name;

  /// A container of data for all resource types.
  final ResourceDataContainer resourceDataContainer;

  Resource({
    @required this.id,
    @required this.name,
    @required this.resourceDataContainer,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

class ResourceAccessPolicy {
  /// The permissions that the Lambda function has to the resource. Can be one
  /// of ''rw'' (read/write) or ''ro'' (read-only).
  final String permission;

  /// The ID of the resource. (This ID is assigned to the resource when you
  /// create the resource definiton.)
  final String resourceId;

  ResourceAccessPolicy({
    this.permission,
    @required this.resourceId,
  });
  static ResourceAccessPolicy fromJson(Map<String, dynamic> json) =>
      ResourceAccessPolicy();
}

class ResourceDataContainer {
  /// Attributes that define the local device resource.
  final LocalDeviceResourceData localDeviceResourceData;

  /// Attributes that define the local volume resource.
  final LocalVolumeResourceData localVolumeResourceData;

  /// Attributes that define an Amazon S3 machine learning resource.
  final S3MachineLearningModelResourceData s3MachineLearningModelResourceData;

  /// Attributes that define an Amazon SageMaker machine learning resource.
  final SageMakerMachineLearningModelResourceData
      sageMakerMachineLearningModelResourceData;

  /// Attributes that define a secret resource, which references a secret from
  /// AWS Secrets Manager.
  final SecretsManagerSecretResourceData secretsManagerSecretResourceData;

  ResourceDataContainer({
    this.localDeviceResourceData,
    this.localVolumeResourceData,
    this.s3MachineLearningModelResourceData,
    this.sageMakerMachineLearningModelResourceData,
    this.secretsManagerSecretResourceData,
  });
  static ResourceDataContainer fromJson(Map<String, dynamic> json) =>
      ResourceDataContainer();
}

class ResourceDefinitionVersion {
  /// A list of resources.
  final List<Resource> resources;

  ResourceDefinitionVersion({
    this.resources,
  });
  static ResourceDefinitionVersion fromJson(Map<String, dynamic> json) =>
      ResourceDefinitionVersion();
}

class S3MachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String destinationPath;

  /// The URI of the source model in an S3 bucket. The model package must be in
  /// tar.gz or .zip format.
  final String s3Uri;

  S3MachineLearningModelResourceData({
    this.destinationPath,
    this.s3Uri,
  });
  static S3MachineLearningModelResourceData fromJson(
          Map<String, dynamic> json) =>
      S3MachineLearningModelResourceData();
}

class SageMakerMachineLearningModelResourceData {
  /// The absolute local path of the resource inside the Lambda environment.
  final String destinationPath;

  /// The ARN of the Amazon SageMaker training job that represents the source
  /// model.
  final String sageMakerJobArn;

  SageMakerMachineLearningModelResourceData({
    this.destinationPath,
    this.sageMakerJobArn,
  });
  static SageMakerMachineLearningModelResourceData fromJson(
          Map<String, dynamic> json) =>
      SageMakerMachineLearningModelResourceData();
}

class SecretsManagerSecretResourceData {
  /// The ARN of the Secrets Manager secret to make available on the core. The
  /// value of the secret's latest version (represented by the ''AWSCURRENT''
  /// staging label) is included by default.
  final String arn;

  /// Optional. The staging labels whose values you want to make available on
  /// the core, in addition to ''AWSCURRENT''.
  final List<String> additionalStagingLabelsToDownload;

  SecretsManagerSecretResourceData({
    this.arn,
    this.additionalStagingLabelsToDownload,
  });
  static SecretsManagerSecretResourceData fromJson(Map<String, dynamic> json) =>
      SecretsManagerSecretResourceData();
}

class StartBulkDeploymentResponse {
  /// The ARN of the bulk deployment.
  final String bulkDeploymentArn;

  /// The ID of the bulk deployment.
  final String bulkDeploymentId;

  StartBulkDeploymentResponse({
    this.bulkDeploymentArn,
    this.bulkDeploymentId,
  });
  static StartBulkDeploymentResponse fromJson(Map<String, dynamic> json) =>
      StartBulkDeploymentResponse();
}

class StopBulkDeploymentResponse {
  StopBulkDeploymentResponse();
  static StopBulkDeploymentResponse fromJson(Map<String, dynamic> json) =>
      StopBulkDeploymentResponse();
}

class Subscription {
  /// A descriptive or arbitrary ID for the subscription. This value must be
  /// unique within the subscription definition version. Max length is 128
  /// characters with pattern ''\[a-zA-Z0-9:_-\]+''.
  final String id;

  /// The source of the subscription. Can be a thing ARN, a Lambda function ARN,
  /// a connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  final String source;

  /// The MQTT topic used to route the message.
  final String subject;

  /// Where the message is sent to. Can be a thing ARN, a Lambda function ARN, a
  /// connector ARN, 'cloud' (which represents the AWS IoT cloud), or
  /// 'GGShadowService'.
  final String target;

  Subscription({
    @required this.id,
    @required this.source,
    @required this.subject,
    @required this.target,
  });
  static Subscription fromJson(Map<String, dynamic> json) => Subscription();
}

class SubscriptionDefinitionVersion {
  /// A list of subscriptions.
  final List<Subscription> subscriptions;

  SubscriptionDefinitionVersion({
    this.subscriptions,
  });
  static SubscriptionDefinitionVersion fromJson(Map<String, dynamic> json) =>
      SubscriptionDefinitionVersion();
}

class UpdateConnectivityInfoResponse {
  /// A message about the connectivity info update request.
  final String message;

  /// The new version of the connectivity info.
  final String version;

  UpdateConnectivityInfoResponse({
    this.message,
    this.version,
  });
  static UpdateConnectivityInfoResponse fromJson(Map<String, dynamic> json) =>
      UpdateConnectivityInfoResponse();
}

class UpdateConnectorDefinitionResponse {
  UpdateConnectorDefinitionResponse();
  static UpdateConnectorDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateConnectorDefinitionResponse();
}

class UpdateCoreDefinitionResponse {
  UpdateCoreDefinitionResponse();
  static UpdateCoreDefinitionResponse fromJson(Map<String, dynamic> json) =>
      UpdateCoreDefinitionResponse();
}

class UpdateDeviceDefinitionResponse {
  UpdateDeviceDefinitionResponse();
  static UpdateDeviceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeviceDefinitionResponse();
}

class UpdateFunctionDefinitionResponse {
  UpdateFunctionDefinitionResponse();
  static UpdateFunctionDefinitionResponse fromJson(Map<String, dynamic> json) =>
      UpdateFunctionDefinitionResponse();
}

class UpdateGroupCertificateConfigurationResponse {
  /// The amount of time remaining before the certificate authority expires, in
  /// milliseconds.
  final String certificateAuthorityExpiryInMilliseconds;

  /// The amount of time remaining before the certificate expires, in
  /// milliseconds.
  final String certificateExpiryInMilliseconds;

  /// The ID of the group certificate configuration.
  final String groupId;

  UpdateGroupCertificateConfigurationResponse({
    this.certificateAuthorityExpiryInMilliseconds,
    this.certificateExpiryInMilliseconds,
    this.groupId,
  });
  static UpdateGroupCertificateConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateGroupCertificateConfigurationResponse();
}

class UpdateGroupResponse {
  UpdateGroupResponse();
  static UpdateGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateGroupResponse();
}

class UpdateLoggerDefinitionResponse {
  UpdateLoggerDefinitionResponse();
  static UpdateLoggerDefinitionResponse fromJson(Map<String, dynamic> json) =>
      UpdateLoggerDefinitionResponse();
}

class UpdateResourceDefinitionResponse {
  UpdateResourceDefinitionResponse();
  static UpdateResourceDefinitionResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceDefinitionResponse();
}

class UpdateSubscriptionDefinitionResponse {
  UpdateSubscriptionDefinitionResponse();
  static UpdateSubscriptionDefinitionResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateSubscriptionDefinitionResponse();
}

class VersionInformation {
  /// The ARN of the version.
  final String arn;

  /// The time, in milliseconds since the epoch, when the version was created.
  final String creationTimestamp;

  /// The ID of the version.
  final String id;

  /// The unique ID of the version.
  final String version;

  VersionInformation({
    this.arn,
    this.creationTimestamp,
    this.id,
    this.version,
  });
  static VersionInformation fromJson(Map<String, dynamic> json) =>
      VersionInformation();
}
