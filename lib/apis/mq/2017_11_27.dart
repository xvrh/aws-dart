import 'package:meta/meta.dart';

/// Amazon MQ is a managed message broker service for Apache ActiveMQ that makes
/// it easy to set up and operate message brokers in the cloud. A message broker
/// allows software applications and components to communicate using various
/// programming languages, operating systems, and formal messaging protocols.
class MqApi {
  /// Creates a broker. Note: This API is asynchronous.
  ///
  /// [autoMinorVersionUpgrade]: Required. Enables automatic upgrades to new
  /// minor versions for brokers, as Apache releases the versions. The automatic
  /// upgrades occur during the maintenance window of the broker or after a
  /// manual broker reboot.
  ///
  /// [brokerName]: Required. The name of the broker. This value must be unique
  /// in your AWS account, 1-50 characters long, must contain only letters,
  /// numbers, dashes, and underscores, and must not contain whitespaces,
  /// brackets, wildcard characters, or special characters.
  ///
  /// [configuration]: A list of information about the configuration.
  ///
  /// [creatorRequestId]: The unique ID that the requester receives for the
  /// created broker. Amazon MQ passes your ID with the API action. Note: We
  /// recommend using a Universally Unique Identifier (UUID) for the
  /// creatorRequestId. You may omit the creatorRequestId if your application
  /// doesn't require idempotency.
  ///
  /// [deploymentMode]: Required. The deployment mode of the broker.
  ///
  /// [encryptionOptions]: Encryption options for the broker.
  ///
  /// [engineType]: Required. The type of broker engine. Note: Currently, Amazon
  /// MQ supports only ACTIVEMQ.
  ///
  /// [engineVersion]: Required. The version of the broker engine. For a list of
  /// supported engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// [hostInstanceType]: Required. The broker's instance type.
  ///
  /// [logs]: Enables Amazon CloudWatch logging for brokers.
  ///
  /// [maintenanceWindowStartTime]: The parameters that determine the
  /// WeeklyStartTime.
  ///
  /// [publiclyAccessible]: Required. Enables connections from applications
  /// outside of the VPC that hosts the broker's subnets.
  ///
  /// [securityGroups]: The list of security groups (1 minimum, 5 maximum) that
  /// authorize connections to brokers.
  ///
  /// [subnetIds]: The list of groups (2 maximum) that define which subnets and
  /// IP ranges the broker can use from different Availability Zones. A
  /// SINGLE_INSTANCE deployment requires one subnet (for example, the default
  /// subnet). An ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.
  ///
  /// [tags]: Create tags when creating the broker.
  ///
  /// [users]: Required. The list of ActiveMQ users (persons or applications)
  /// who can access queues and topics. This value can contain only alphanumeric
  /// characters, dashes, periods, underscores, and tildes (- . _ ~). This value
  /// must be 2-100 characters long.
  Future<CreateBrokerResponse> createBroker(
      {bool autoMinorVersionUpgrade,
      String brokerName,
      ConfigurationId configuration,
      String creatorRequestId,
      String deploymentMode,
      EncryptionOptions encryptionOptions,
      String engineType,
      String engineVersion,
      String hostInstanceType,
      Logs logs,
      WeeklyStartTime maintenanceWindowStartTime,
      bool publiclyAccessible,
      List<String> securityGroups,
      List<String> subnetIds,
      Map<String, String> tags,
      List<User> users}) async {
    return CreateBrokerResponse.fromJson({});
  }

  /// Creates a new configuration for the specified configuration name. Amazon
  /// MQ uses the default configuration (the engine type and version).
  ///
  /// [engineType]: Required. The type of broker engine. Note: Currently, Amazon
  /// MQ supports only ACTIVEMQ.
  ///
  /// [engineVersion]: Required. The version of the broker engine. For a list of
  /// supported engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// [name]: Required. The name of the configuration. This value can contain
  /// only alphanumeric characters, dashes, periods, underscores, and tildes (-
  /// . _ ~). This value must be 1-150 characters long.
  ///
  /// [tags]: Create tags when creating the configuration.
  Future<CreateConfigurationResponse> createConfiguration(
      {String engineType,
      String engineVersion,
      String name,
      Map<String, String> tags}) async {
    return CreateConfigurationResponse.fromJson({});
  }

  /// Add a tag to a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource tag.
  ///
  /// [tags]: The key-value pair for the resource tag.
  Future<void> createTags(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Creates an ActiveMQ user.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  ///
  /// [consoleAccess]: Enables access to the the ActiveMQ Web Console for the
  /// ActiveMQ user.
  ///
  /// [groups]: The list of groups (20 maximum) to which the ActiveMQ user
  /// belongs. This value can contain only alphanumeric characters, dashes,
  /// periods, underscores, and tildes (- . _ ~). This value must be 2-100
  /// characters long.
  ///
  /// [password]: Required. The password of the user. This value must be at
  /// least 12 characters long, must contain at least 4 unique characters, and
  /// must not contain commas.
  ///
  /// [username]: The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  Future<CreateUserResponse> createUser(
      {@required String brokerId,
      bool consoleAccess,
      List<String> groups,
      String password,
      @required String username}) async {
    return CreateUserResponse.fromJson({});
  }

  /// Deletes a broker. Note: This API is asynchronous.
  ///
  /// [brokerId]: The name of the broker. This value must be unique in your AWS
  /// account, 1-50 characters long, must contain only letters, numbers, dashes,
  /// and underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  Future<DeleteBrokerResponse> deleteBroker(String brokerId) async {
    return DeleteBrokerResponse.fromJson({});
  }

  /// Removes a tag from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource tag.
  ///
  /// [tagKeys]: An array of tag keys to delete
  Future<void> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Deletes an ActiveMQ user.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  ///
  /// [username]: The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  Future<DeleteUserResponse> deleteUser(
      {@required String brokerId, @required String username}) async {
    return DeleteUserResponse.fromJson({});
  }

  /// Returns information about the specified broker.
  ///
  /// [brokerId]: The name of the broker. This value must be unique in your AWS
  /// account, 1-50 characters long, must contain only letters, numbers, dashes,
  /// and underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  Future<DescribeBrokerResponse> describeBroker(String brokerId) async {
    return DescribeBrokerResponse.fromJson({});
  }

  /// Describe available engine types and versions.
  ///
  /// [engineType]: Filter response by engine type.
  ///
  /// [maxResults]: The maximum number of engine types that Amazon MQ can return
  /// per page (20 by default). This value must be an integer from 5 to 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<DescribeBrokerEngineTypesResponse> describeBrokerEngineTypes(
      {String engineType, int maxResults, String nextToken}) async {
    return DescribeBrokerEngineTypesResponse.fromJson({});
  }

  /// Describe available broker instance options.
  ///
  /// [engineType]: Filter response by engine type.
  ///
  /// [hostInstanceType]: Filter response by host instance type.
  ///
  /// [maxResults]: The maximum number of instance options that Amazon MQ can
  /// return per page (20 by default). This value must be an integer from 5 to
  /// 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<DescribeBrokerInstanceOptionsResponse> describeBrokerInstanceOptions(
      {String engineType,
      String hostInstanceType,
      int maxResults,
      String nextToken}) async {
    return DescribeBrokerInstanceOptionsResponse.fromJson({});
  }

  /// Returns information about the specified configuration.
  ///
  /// [configurationId]: The unique ID that Amazon MQ generates for the
  /// configuration.
  Future<DescribeConfigurationResponse> describeConfiguration(
      String configurationId) async {
    return DescribeConfigurationResponse.fromJson({});
  }

  /// Returns the specified configuration revision for the specified
  /// configuration.
  ///
  /// [configurationId]: The unique ID that Amazon MQ generates for the
  /// configuration.
  ///
  /// [configurationRevision]: The revision of the configuration.
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision(
      {@required String configurationId,
      @required String configurationRevision}) async {
    return DescribeConfigurationRevisionResponse.fromJson({});
  }

  /// Returns information about an ActiveMQ user.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  ///
  /// [username]: The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  Future<DescribeUserResponse> describeUser(
      {@required String brokerId, @required String username}) async {
    return DescribeUserResponse.fromJson({});
  }

  /// Returns a list of all brokers.
  ///
  /// [maxResults]: The maximum number of brokers that Amazon MQ can return per
  /// page (20 by default). This value must be an integer from 5 to 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<ListBrokersResponse> listBrokers(
      {int maxResults, String nextToken}) async {
    return ListBrokersResponse.fromJson({});
  }

  /// Returns a list of all revisions for the specified configuration.
  ///
  /// [configurationId]: The unique ID that Amazon MQ generates for the
  /// configuration.
  ///
  /// [maxResults]: The maximum number of configurations that Amazon MQ can
  /// return per page (20 by default). This value must be an integer from 5 to
  /// 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions(
      String configurationId,
      {int maxResults,
      String nextToken}) async {
    return ListConfigurationRevisionsResponse.fromJson({});
  }

  /// Returns a list of all configurations.
  ///
  /// [maxResults]: The maximum number of configurations that Amazon MQ can
  /// return per page (20 by default). This value must be an integer from 5 to
  /// 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<ListConfigurationsResponse> listConfigurations(
      {int maxResults, String nextToken}) async {
    return ListConfigurationsResponse.fromJson({});
  }

  /// Lists tags for a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource tag.
  Future<ListTagsResponse> listTags(String resourceArn) async {
    return ListTagsResponse.fromJson({});
  }

  /// Returns a list of all ActiveMQ users.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  ///
  /// [maxResults]: The maximum number of ActiveMQ users that can be returned
  /// per page (20 by default). This value must be an integer from 5 to 100.
  ///
  /// [nextToken]: The token that specifies the next page of results Amazon MQ
  /// should return. To request the first page, leave nextToken empty.
  Future<ListUsersResponse> listUsers(String brokerId,
      {int maxResults, String nextToken}) async {
    return ListUsersResponse.fromJson({});
  }

  /// Reboots a broker. Note: This API is asynchronous.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  Future<RebootBrokerResponse> rebootBroker(String brokerId) async {
    return RebootBrokerResponse.fromJson({});
  }

  /// Adds a pending configuration change to a broker.
  ///
  /// [autoMinorVersionUpgrade]: Enables automatic upgrades to new minor
  /// versions for brokers, as Apache releases the versions. The automatic
  /// upgrades occur during the maintenance window of the broker or after a
  /// manual broker reboot.
  ///
  /// [brokerId]: The name of the broker. This value must be unique in your AWS
  /// account, 1-50 characters long, must contain only letters, numbers, dashes,
  /// and underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  ///
  /// [configuration]: A list of information about the configuration.
  ///
  /// [engineVersion]: The version of the broker engine. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  ///
  /// [logs]: Enables Amazon CloudWatch logging for brokers.
  ///
  /// [securityGroups]: The list of security groups (1 minimum, 5 maximum) that
  /// authorize connections to brokers.
  Future<UpdateBrokerResponse> updateBroker(String brokerId,
      {bool autoMinorVersionUpgrade,
      ConfigurationId configuration,
      String engineVersion,
      Logs logs,
      List<String> securityGroups}) async {
    return UpdateBrokerResponse.fromJson({});
  }

  /// Updates the specified configuration.
  ///
  /// [configurationId]: The unique ID that Amazon MQ generates for the
  /// configuration.
  ///
  /// [data]: Required. The base64-encoded XML configuration.
  ///
  /// [description]: The description of the configuration.
  Future<UpdateConfigurationResponse> updateConfiguration(
      String configurationId,
      {String data,
      String description}) async {
    return UpdateConfigurationResponse.fromJson({});
  }

  /// Updates the information for an ActiveMQ user.
  ///
  /// [brokerId]: The unique ID that Amazon MQ generates for the broker.
  ///
  /// [consoleAccess]: Enables access to the the ActiveMQ Web Console for the
  /// ActiveMQ user.
  ///
  /// [groups]: The list of groups (20 maximum) to which the ActiveMQ user
  /// belongs. This value can contain only alphanumeric characters, dashes,
  /// periods, underscores, and tildes (- . _ ~). This value must be 2-100
  /// characters long.
  ///
  /// [password]: The password of the user. This value must be at least 12
  /// characters long, must contain at least 4 unique characters, and must not
  /// contain commas.
  ///
  /// [username]: Required. The username of the ActiveMQ user. This value can
  /// contain only alphanumeric characters, dashes, periods, underscores, and
  /// tildes (- . _ ~). This value must be 2-100 characters long.
  Future<UpdateUserResponse> updateUser(
      {@required String brokerId,
      bool consoleAccess,
      List<String> groups,
      String password,
      @required String username}) async {
    return UpdateUserResponse.fromJson({});
  }
}

/// Name of the availability zone.
class AvailabilityZone {
  /// Id for the availability zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

/// Types of broker engines.
class BrokerEngineType {
  /// The type of broker engine.
  final String engineType;

  /// The list of engine versions.
  final List<EngineVersion> engineVersions;

  BrokerEngineType({
    this.engineType,
    this.engineVersions,
  });
  static BrokerEngineType fromJson(Map<String, dynamic> json) =>
      BrokerEngineType();
}

/// Returns information about all brokers.
class BrokerInstance {
  /// The URL of the broker's ActiveMQ Web Console.
  final String consoleUrl;

  /// The broker's wire-level protocol endpoints.
  final List<String> endpoints;

  /// The IP address of the Elastic Network Interface (ENI) attached to the
  /// broker.
  final String ipAddress;

  BrokerInstance({
    this.consoleUrl,
    this.endpoints,
    this.ipAddress,
  });
  static BrokerInstance fromJson(Map<String, dynamic> json) => BrokerInstance();
}

/// Option for host instance type.
class BrokerInstanceOption {
  /// The list of available az.
  final List<AvailabilityZone> availabilityZones;

  /// The type of broker engine.
  final String engineType;

  /// The type of broker instance.
  final String hostInstanceType;

  /// The list of supported engine versions.
  final List<String> supportedEngineVersions;

  BrokerInstanceOption({
    this.availabilityZones,
    this.engineType,
    this.hostInstanceType,
    this.supportedEngineVersions,
  });
  static BrokerInstanceOption fromJson(Map<String, dynamic> json) =>
      BrokerInstanceOption();
}

/// The Amazon Resource Name (ARN) of the broker.
class BrokerSummary {
  /// The Amazon Resource Name (ARN) of the broker.
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  /// The name of the broker. This value must be unique in your AWS account,
  /// 1-50 characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  final String brokerName;

  /// The status of the broker.
  final String brokerState;

  /// The time when the broker was created.
  final DateTime created;

  /// Required. The deployment mode of the broker.
  final String deploymentMode;

  /// The broker's instance type.
  final String hostInstanceType;

  BrokerSummary({
    this.brokerArn,
    this.brokerId,
    this.brokerName,
    this.brokerState,
    this.created,
    this.deploymentMode,
    this.hostInstanceType,
  });
  static BrokerSummary fromJson(Map<String, dynamic> json) => BrokerSummary();
}

/// Returns information about all configurations.
class Configuration {
  /// Required. The ARN of the configuration.
  final String arn;

  /// Required. The date and time of the configuration revision.
  final DateTime created;

  /// Required. The description of the configuration.
  final String description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  final String engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// Required. The latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  final String name;

  /// The list of all tags associated with this configuration.
  final Map<String, String> tags;

  Configuration({
    this.arn,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  static Configuration fromJson(Map<String, dynamic> json) => Configuration();
}

/// A list of information about the configuration.
class ConfigurationId {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// The revision number of the configuration.
  final int revision;

  ConfigurationId({
    this.id,
    this.revision,
  });
  static ConfigurationId fromJson(Map<String, dynamic> json) =>
      ConfigurationId();
}

/// Returns information about the specified configuration revision.
class ConfigurationRevision {
  /// Required. The date and time of the configuration revision.
  final DateTime created;

  /// The description of the configuration revision.
  final String description;

  /// Required. The revision number of the configuration.
  final int revision;

  ConfigurationRevision({
    this.created,
    this.description,
    this.revision,
  });
  static ConfigurationRevision fromJson(Map<String, dynamic> json) =>
      ConfigurationRevision();
}

/// Broker configuration information
class Configurations {
  /// The current configuration of the broker.
  final ConfigurationId current;

  /// The history of configurations applied to the broker.
  final List<ConfigurationId> history;

  /// The pending configuration of the broker.
  final ConfigurationId pending;

  Configurations({
    this.current,
    this.history,
    this.pending,
  });
  static Configurations fromJson(Map<String, dynamic> json) => Configurations();
}

class CreateBrokerResponse {
  /// The Amazon Resource Name (ARN) of the broker.
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  CreateBrokerResponse({
    this.brokerArn,
    this.brokerId,
  });
  static CreateBrokerResponse fromJson(Map<String, dynamic> json) =>
      CreateBrokerResponse();
}

class CreateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// Required. The date and time of the configuration.
  final DateTime created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// The latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  final String name;

  CreateConfigurationResponse({
    this.arn,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
  });
  static CreateConfigurationResponse fromJson(Map<String, dynamic> json) =>
      CreateConfigurationResponse();
}

class CreateUserResponse {
  CreateUserResponse();
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse();
}

class DeleteBrokerResponse {
  /// The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  DeleteBrokerResponse({
    this.brokerId,
  });
  static DeleteBrokerResponse fromJson(Map<String, dynamic> json) =>
      DeleteBrokerResponse();
}

class DeleteUserResponse {
  DeleteUserResponse();
  static DeleteUserResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserResponse();
}

class DescribeBrokerEngineTypesResponse {
  /// List of available engine types and versions.
  final List<BrokerEngineType> brokerEngineTypes;

  /// Required. The maximum number of engine types that can be returned per page
  /// (20 by default). This value must be an integer from 5 to 100.
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  DescribeBrokerEngineTypesResponse({
    this.brokerEngineTypes,
    this.maxResults,
    this.nextToken,
  });
  static DescribeBrokerEngineTypesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeBrokerEngineTypesResponse();
}

class DescribeBrokerInstanceOptionsResponse {
  /// List of available broker instance options.
  final List<BrokerInstanceOption> brokerInstanceOptions;

  /// Required. The maximum number of instance options that can be returned per
  /// page (20 by default). This value must be an integer from 5 to 100.
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  DescribeBrokerInstanceOptionsResponse({
    this.brokerInstanceOptions,
    this.maxResults,
    this.nextToken,
  });
  static DescribeBrokerInstanceOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeBrokerInstanceOptionsResponse();
}

class DescribeBrokerResponse {
  /// Required. Enables automatic upgrades to new minor versions for brokers, as
  /// Apache releases the versions. The automatic upgrades occur during the
  /// maintenance window of the broker or after a manual broker reboot.
  final bool autoMinorVersionUpgrade;

  /// The Amazon Resource Name (ARN) of the broker.
  final String brokerArn;

  /// The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  /// A list of information about allocated brokers.
  final List<BrokerInstance> brokerInstances;

  /// The name of the broker. This value must be unique in your AWS account,
  /// 1-50 characters long, must contain only letters, numbers, dashes, and
  /// underscores, and must not contain whitespaces, brackets, wildcard
  /// characters, or special characters.
  final String brokerName;

  /// The status of the broker.
  final String brokerState;

  /// The list of all revisions for the specified configuration.
  final Configurations configurations;

  /// The time when the broker was created.
  final DateTime created;

  /// Required. The deployment mode of the broker.
  final String deploymentMode;

  /// Encryption options for the broker.
  final EncryptionOptions encryptionOptions;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  final String engineType;

  /// The version of the broker engine. For a list of supported engine versions,
  /// see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String engineVersion;

  /// The broker's instance type.
  final String hostInstanceType;

  /// The list of information about logs currently enabled and pending to be
  /// deployed for the specified broker.
  final LogsSummary logs;

  /// The parameters that determine the WeeklyStartTime.
  final WeeklyStartTime maintenanceWindowStartTime;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String pendingEngineVersion;

  /// The list of pending security groups to authorize connections to brokers.
  final List<String> pendingSecurityGroups;

  /// Required. Enables connections from applications outside of the VPC that
  /// hosts the broker's subnets.
  final bool publiclyAccessible;

  /// The list of security groups (1 minimum, 5 maximum) that authorize
  /// connections to brokers.
  final List<String> securityGroups;

  /// The list of groups (2 maximum) that define which subnets and IP ranges the
  /// broker can use from different Availability Zones. A SINGLE_INSTANCE
  /// deployment requires one subnet (for example, the default subnet). An
  /// ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.
  final List<String> subnetIds;

  /// The list of all tags associated with this broker.
  final Map<String, String> tags;

  /// The list of all ActiveMQ usernames for the specified broker.
  final List<UserSummary> users;

  DescribeBrokerResponse({
    this.autoMinorVersionUpgrade,
    this.brokerArn,
    this.brokerId,
    this.brokerInstances,
    this.brokerName,
    this.brokerState,
    this.configurations,
    this.created,
    this.deploymentMode,
    this.encryptionOptions,
    this.engineType,
    this.engineVersion,
    this.hostInstanceType,
    this.logs,
    this.maintenanceWindowStartTime,
    this.pendingEngineVersion,
    this.pendingSecurityGroups,
    this.publiclyAccessible,
    this.securityGroups,
    this.subnetIds,
    this.tags,
    this.users,
  });
  static DescribeBrokerResponse fromJson(Map<String, dynamic> json) =>
      DescribeBrokerResponse();
}

class DescribeConfigurationResponse {
  /// Required. The ARN of the configuration.
  final String arn;

  /// Required. The date and time of the configuration revision.
  final DateTime created;

  /// Required. The description of the configuration.
  final String description;

  /// Required. The type of broker engine. Note: Currently, Amazon MQ supports
  /// only ACTIVEMQ.
  final String engineType;

  /// Required. The version of the broker engine. For a list of supported engine
  /// versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String engineVersion;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// Required. The latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  final String name;

  /// The list of all tags associated with this configuration.
  final Map<String, String> tags;

  DescribeConfigurationResponse({
    this.arn,
    this.created,
    this.description,
    this.engineType,
    this.engineVersion,
    this.id,
    this.latestRevision,
    this.name,
    this.tags,
  });
  static DescribeConfigurationResponse fromJson(Map<String, dynamic> json) =>
      DescribeConfigurationResponse();
}

class DescribeConfigurationRevisionResponse {
  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String configurationId;

  /// Required. The date and time of the configuration.
  final DateTime created;

  /// Required. The base64-encoded XML configuration.
  final String data;

  /// The description of the configuration.
  final String description;

  DescribeConfigurationRevisionResponse({
    this.configurationId,
    this.created,
    this.data,
    this.description,
  });
  static DescribeConfigurationRevisionResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationRevisionResponse();
}

class DescribeUserResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  final List<String> groups;

  /// The status of the changes pending for the ActiveMQ user.
  final UserPendingChanges pending;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  final String username;

  DescribeUserResponse({
    this.brokerId,
    this.consoleAccess,
    this.groups,
    this.pending,
    this.username,
  });
  static DescribeUserResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserResponse();
}

/// Encryption options for the broker.
class EncryptionOptions {
  /// The customer master key (CMK) to use for the AWS Key Management Service
  /// (KMS). This key is used to encrypt your data at rest. If not provided,
  /// Amazon MQ will use a default CMK to encrypt your data.
  final String kmsKeyId;

  /// Enables the use of an AWS owned CMK using AWS Key Management Service
  /// (KMS).
  final bool useAwsOwnedKey;

  EncryptionOptions({
    this.kmsKeyId,
    @required this.useAwsOwnedKey,
  });
  static EncryptionOptions fromJson(Map<String, dynamic> json) =>
      EncryptionOptions();
}

/// Id of the engine version.
class EngineVersion {
  /// Id for the version.
  final String name;

  EngineVersion({
    this.name,
  });
  static EngineVersion fromJson(Map<String, dynamic> json) => EngineVersion();
}

class ListBrokersResponse {
  /// A list of information about all brokers.
  final List<BrokerSummary> brokerSummaries;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  ListBrokersResponse({
    this.brokerSummaries,
    this.nextToken,
  });
  static ListBrokersResponse fromJson(Map<String, dynamic> json) =>
      ListBrokersResponse();
}

class ListConfigurationRevisionsResponse {
  /// The unique ID that Amazon MQ generates for the configuration.
  final String configurationId;

  /// The maximum number of configuration revisions that can be returned per
  /// page (20 by default). This value must be an integer from 5 to 100.
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  /// The list of all revisions for the specified configuration.
  final List<ConfigurationRevision> revisions;

  ListConfigurationRevisionsResponse({
    this.configurationId,
    this.maxResults,
    this.nextToken,
    this.revisions,
  });
  static ListConfigurationRevisionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListConfigurationRevisionsResponse();
}

class ListConfigurationsResponse {
  /// The list of all revisions for the specified configuration.
  final List<Configuration> configurations;

  /// The maximum number of configurations that Amazon MQ can return per page
  /// (20 by default). This value must be an integer from 5 to 100.
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.maxResults,
    this.nextToken,
  });
  static ListConfigurationsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationsResponse();
}

class ListTagsResponse {
  /// The key-value pair for the resource tag.
  final Map<String, String> tags;

  ListTagsResponse({
    this.tags,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse();
}

class ListUsersResponse {
  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  /// Required. The maximum number of ActiveMQ users that can be returned per
  /// page (20 by default). This value must be an integer from 5 to 100.
  final int maxResults;

  /// The token that specifies the next page of results Amazon MQ should return.
  /// To request the first page, leave nextToken empty.
  final String nextToken;

  /// Required. The list of all ActiveMQ usernames for the specified broker.
  final List<UserSummary> users;

  ListUsersResponse({
    this.brokerId,
    this.maxResults,
    this.nextToken,
    this.users,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

/// The list of information about logs to be enabled for the specified broker.
class Logs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool audit;

  /// Enables general logging.
  final bool general;

  Logs({
    this.audit,
    this.general,
  });
  static Logs fromJson(Map<String, dynamic> json) => Logs();
}

/// The list of information about logs currently enabled and pending to be
/// deployed for the specified broker.
class LogsSummary {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool audit;

  /// The location of the CloudWatch Logs log group where audit logs are sent.
  final String auditLogGroup;

  /// Enables general logging.
  final bool general;

  /// The location of the CloudWatch Logs log group where general logs are sent.
  final String generalLogGroup;

  /// The list of information about logs pending to be deployed for the
  /// specified broker.
  final PendingLogs pending;

  LogsSummary({
    this.audit,
    this.auditLogGroup,
    this.general,
    this.generalLogGroup,
    this.pending,
  });
  static LogsSummary fromJson(Map<String, dynamic> json) => LogsSummary();
}

/// The list of information about logs to be enabled for the specified broker.
class PendingLogs {
  /// Enables audit logging. Every user management action made using JMX or the
  /// ActiveMQ Web Console is logged.
  final bool audit;

  /// Enables general logging.
  final bool general;

  PendingLogs({
    this.audit,
    this.general,
  });
  static PendingLogs fromJson(Map<String, dynamic> json) => PendingLogs();
}

class RebootBrokerResponse {
  RebootBrokerResponse();
  static RebootBrokerResponse fromJson(Map<String, dynamic> json) =>
      RebootBrokerResponse();
}

/// Returns information about the XML element or attribute that was sanitized in
/// the configuration.
class SanitizationWarning {
  /// The name of the XML attribute that has been sanitized.
  final String attributeName;

  /// The name of the XML element that has been sanitized.
  final String elementName;

  /// Required. The reason for which the XML elements or attributes were
  /// sanitized.
  final String reason;

  SanitizationWarning({
    this.attributeName,
    this.elementName,
    this.reason,
  });
  static SanitizationWarning fromJson(Map<String, dynamic> json) =>
      SanitizationWarning();
}

class UpdateBrokerResponse {
  /// The new value of automatic upgrades to new minor version for brokers.
  final bool autoMinorVersionUpgrade;

  /// Required. The unique ID that Amazon MQ generates for the broker.
  final String brokerId;

  /// The ID of the updated configuration.
  final ConfigurationId configuration;

  /// The version of the broker engine to upgrade to. For a list of supported
  /// engine versions, see
  /// https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
  final String engineVersion;

  /// The list of information about logs to be enabled for the specified broker.
  final Logs logs;

  /// The list of security groups (1 minimum, 5 maximum) that authorize
  /// connections to brokers.
  final List<String> securityGroups;

  UpdateBrokerResponse({
    this.autoMinorVersionUpgrade,
    this.brokerId,
    this.configuration,
    this.engineVersion,
    this.logs,
    this.securityGroups,
  });
  static UpdateBrokerResponse fromJson(Map<String, dynamic> json) =>
      UpdateBrokerResponse();
}

class UpdateConfigurationResponse {
  /// Required. The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// Required. The date and time of the configuration.
  final DateTime created;

  /// Required. The unique ID that Amazon MQ generates for the configuration.
  final String id;

  /// The latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// Required. The name of the configuration. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 1-150 characters long.
  final String name;

  /// The list of the first 20 warnings about the configuration XML elements or
  /// attributes that were sanitized.
  final List<SanitizationWarning> warnings;

  UpdateConfigurationResponse({
    this.arn,
    this.created,
    this.id,
    this.latestRevision,
    this.name,
    this.warnings,
  });
  static UpdateConfigurationResponse fromJson(Map<String, dynamic> json) =>
      UpdateConfigurationResponse();
}

class UpdateUserResponse {
  UpdateUserResponse();
  static UpdateUserResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse();
}

/// An ActiveMQ user associated with the broker.
class User {
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  final List<String> groups;

  /// Required. The password of the ActiveMQ user. This value must be at least
  /// 12 characters long, must contain at least 4 unique characters, and must
  /// not contain commas.
  final String password;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  final String username;

  User({
    this.consoleAccess,
    this.groups,
    this.password,
    this.username,
  });
}

/// Returns information about the status of the changes pending for the ActiveMQ
/// user.
class UserPendingChanges {
  /// Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
  final bool consoleAccess;

  /// The list of groups (20 maximum) to which the ActiveMQ user belongs. This
  /// value can contain only alphanumeric characters, dashes, periods,
  /// underscores, and tildes (- . _ ~). This value must be 2-100 characters
  /// long.
  final List<String> groups;

  /// Required. The type of change pending for the ActiveMQ user.
  final String pendingChange;

  UserPendingChanges({
    this.consoleAccess,
    this.groups,
    this.pendingChange,
  });
  static UserPendingChanges fromJson(Map<String, dynamic> json) =>
      UserPendingChanges();
}

/// Returns a list of all ActiveMQ users.
class UserSummary {
  /// The type of change pending for the ActiveMQ user.
  final String pendingChange;

  /// Required. The username of the ActiveMQ user. This value can contain only
  /// alphanumeric characters, dashes, periods, underscores, and tildes (- . _
  /// ~). This value must be 2-100 characters long.
  final String username;

  UserSummary({
    this.pendingChange,
    this.username,
  });
  static UserSummary fromJson(Map<String, dynamic> json) => UserSummary();
}

/// The scheduled time period relative to UTC during which Amazon MQ begins to
/// apply pending updates or patches to the broker.
class WeeklyStartTime {
  /// Required. The day of the week.
  final String dayOfWeek;

  /// Required. The time, in 24-hour format.
  final String timeOfDay;

  /// The time zone, UTC by default, in either the Country/City format, or the
  /// UTC offset format.
  final String timeZone;

  WeeklyStartTime({
    this.dayOfWeek,
    this.timeOfDay,
    this.timeZone,
  });
  static WeeklyStartTime fromJson(Map<String, dynamic> json) =>
      WeeklyStartTime();
}
