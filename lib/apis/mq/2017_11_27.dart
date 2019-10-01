import 'package:meta/meta.dart';

/// Amazon MQ is a managed message broker service for Apache ActiveMQ that makes
/// it easy to set up and operate message brokers in the cloud. A message broker
/// allows software applications and components to communicate using various
/// programming languages, operating systems, and formal messaging protocols.
class MqApi {
  /// Creates a broker. Note: This API is asynchronous.
  Future<void> createBroker(
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
      List<User> users}) async {}

  /// Creates a new configuration for the specified configuration name. Amazon
  /// MQ uses the default configuration (the engine type and version).
  Future<void> createConfiguration(
      {String engineType,
      String engineVersion,
      String name,
      Map<String, String> tags}) async {}

  /// Add a tag to a resource.
  Future<void> createTags(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Creates an ActiveMQ user.
  Future<void> createUser(
      {@required String brokerId,
      bool consoleAccess,
      List<String> groups,
      String password,
      @required String username}) async {}

  /// Deletes a broker. Note: This API is asynchronous.
  Future<void> deleteBroker(String brokerId) async {}

  /// Removes a tag from a resource.
  Future<void> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Deletes an ActiveMQ user.
  Future<void> deleteUser(
      {@required String brokerId, @required String username}) async {}

  /// Returns information about the specified broker.
  Future<void> describeBroker(String brokerId) async {}

  /// Describe available engine types and versions.
  Future<void> describeBrokerEngineTypes(
      {String engineType, int maxResults, String nextToken}) async {}

  /// Describe available broker instance options.
  Future<void> describeBrokerInstanceOptions(
      {String engineType,
      String hostInstanceType,
      int maxResults,
      String nextToken}) async {}

  /// Returns information about the specified configuration.
  Future<void> describeConfiguration(String configurationId) async {}

  /// Returns the specified configuration revision for the specified
  /// configuration.
  Future<void> describeConfigurationRevision(
      {@required String configurationId,
      @required String configurationRevision}) async {}

  /// Returns information about an ActiveMQ user.
  Future<void> describeUser(
      {@required String brokerId, @required String username}) async {}

  /// Returns a list of all brokers.
  Future<void> listBrokers({int maxResults, String nextToken}) async {}

  /// Returns a list of all revisions for the specified configuration.
  Future<void> listConfigurationRevisions(String configurationId,
      {int maxResults, String nextToken}) async {}

  /// Returns a list of all configurations.
  Future<void> listConfigurations({int maxResults, String nextToken}) async {}

  /// Lists tags for a resource.
  Future<void> listTags(String resourceArn) async {}

  /// Returns a list of all ActiveMQ users.
  Future<void> listUsers(String brokerId,
      {int maxResults, String nextToken}) async {}

  /// Reboots a broker. Note: This API is asynchronous.
  Future<void> rebootBroker(String brokerId) async {}

  /// Adds a pending configuration change to a broker.
  Future<void> updateBroker(String brokerId,
      {bool autoMinorVersionUpgrade,
      ConfigurationId configuration,
      String engineVersion,
      Logs logs,
      List<String> securityGroups}) async {}

  /// Updates the specified configuration.
  Future<void> updateConfiguration(String configurationId,
      {String data, String description}) async {}

  /// Updates the information for an ActiveMQ user.
  Future<void> updateUser(
      {@required String brokerId,
      bool consoleAccess,
      List<String> groups,
      String password,
      @required String username}) async {}
}

class AvailabilityZone {}

class BrokerEngineType {}

class BrokerInstance {}

class BrokerInstanceOption {}

class BrokerSummary {}

class Configuration {}

class ConfigurationId {}

class ConfigurationRevision {}

class Configurations {}

class CreateBrokerResponse {}

class CreateConfigurationResponse {}

class CreateUserResponse {}

class DeleteBrokerResponse {}

class DeleteUserResponse {}

class DescribeBrokerEngineTypesResponse {}

class DescribeBrokerInstanceOptionsResponse {}

class DescribeBrokerResponse {}

class DescribeConfigurationResponse {}

class DescribeConfigurationRevisionResponse {}

class DescribeUserResponse {}

class EncryptionOptions {}

class EngineVersion {}

class ListBrokersResponse {}

class ListConfigurationRevisionsResponse {}

class ListConfigurationsResponse {}

class ListTagsResponse {}

class ListUsersResponse {}

class Logs {}

class LogsSummary {}

class PendingLogs {}

class RebootBrokerResponse {}

class SanitizationWarning {}

class UpdateBrokerResponse {}

class UpdateConfigurationResponse {}

class UpdateUserResponse {}

class User {}

class UserPendingChanges {}

class UserSummary {}

class WeeklyStartTime {}
