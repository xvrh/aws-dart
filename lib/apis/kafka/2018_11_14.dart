import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The operations for managing an Amazon MSK cluster.
class KafkaApi {
  /// Creates a new MSK cluster.
  Future<void> createCluster(
      {@required BrokerNodeGroupInfo brokerNodeGroupInfo,
      ClientAuthentication clientAuthentication,
      @required String clusterName,
      ConfigurationInfo configurationInfo,
      EncryptionInfo encryptionInfo,
      String enhancedMonitoring,
      @required String kafkaVersion,
      @required int numberOfBrokerNodes,
      Map<String, String> tags}) async {}

  /// Creates a new MSK configuration.
  Future<void> createConfiguration(
      {String description,
      @required List<String> kafkaVersions,
      @required String name,
      @required Uint8List serverProperties}) async {}

  /// Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the
  /// request.
  Future<void> deleteCluster(String clusterArn,
      {String currentVersion}) async {}

  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  Future<void> describeCluster(String clusterArn) async {}

  /// Returns a description of the cluster operation specified by the ARN.
  Future<void> describeClusterOperation(String clusterOperationArn) async {}

  /// Returns a description of this MSK configuration.
  Future<void> describeConfiguration(String arn) async {}

  /// Returns a description of this revision of the configuration.
  Future<void> describeConfigurationRevision(
      {@required String arn, @required BigInt revision}) async {}

  /// A list of brokers that a client application can use to bootstrap.
  Future<void> getBootstrapBrokers(String clusterArn) async {}

  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  Future<void> listClusterOperations(String clusterArn,
      {int maxResults, String nextToken}) async {}

  /// Returns a list of all the MSK clusters in the current Region.
  Future<void> listClusters(
      {String clusterNameFilter, int maxResults, String nextToken}) async {}

  /// Returns a list of all the MSK configurations in this Region.
  Future<void> listConfigurationRevisions(String arn,
      {int maxResults, String nextToken}) async {}

  /// Returns a list of all the MSK configurations in this Region.
  Future<void> listConfigurations({int maxResults, String nextToken}) async {}

  /// Returns a list of the broker nodes in the cluster.
  Future<void> listNodes(String clusterArn,
      {int maxResults, String nextToken}) async {}

  /// Returns a list of the tags associated with the specified resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Adds tags to the specified MSK resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes the tags associated with the keys that are provided in the query.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the EBS storage associated with MSK brokers.
  Future<void> updateBrokerStorage(
      {@required String clusterArn,
      @required String currentVersion,
      @required List<BrokerEbsVolumeInfo> targetBrokerEbsVolumeInfo}) async {}

  /// Updates the cluster with the configuration that is specified in the
  /// request body.
  Future<void> updateClusterConfiguration(
      {@required String clusterArn,
      @required ConfigurationInfo configurationInfo,
      @required String currentVersion}) async {}
}

class BrokerEbsVolumeInfo {}

class BrokerNodeGroupInfo {}

class BrokerNodeInfo {}

class BrokerSoftwareInfo {}

class ClientAuthentication {}

class ClusterInfo {}

class ClusterOperationInfo {}

class Configuration {}

class ConfigurationInfo {}

class ConfigurationRevision {}

class CreateClusterResponse {}

class CreateConfigurationResponse {}

class DeleteClusterResponse {}

class DescribeClusterOperationResponse {}

class DescribeClusterResponse {}

class DescribeConfigurationResponse {}

class DescribeConfigurationRevisionResponse {}

class EbsStorageInfo {}

class EncryptionAtRest {}

class EncryptionInTransit {}

class EncryptionInfo {}

class ErrorInfo {}

class GetBootstrapBrokersResponse {}

class ListClusterOperationsResponse {}

class ListClustersResponse {}

class ListConfigurationRevisionsResponse {}

class ListConfigurationsResponse {}

class ListNodesResponse {}

class ListTagsForResourceResponse {}

class MutableClusterInfo {}

class NodeInfo {}

class StorageInfo {}

class Tls {}

class UpdateBrokerStorageResponse {}

class UpdateClusterConfigurationResponse {}

class ZookeeperNodeInfo {}
