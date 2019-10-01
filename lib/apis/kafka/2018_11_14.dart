import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The operations for managing an Amazon MSK cluster.
class KafkaApi {
  /// Creates a new MSK cluster.
  ///
  /// [brokerNodeGroupInfo]: Information about the broker nodes in the cluster.
  ///
  /// [clientAuthentication]: Includes all client authentication related
  /// information.
  ///
  /// [clusterName]: The name of the cluster.
  ///
  /// [configurationInfo]: Represents the configuration that you want MSK to use
  /// for the brokers in a cluster.
  ///
  /// [encryptionInfo]: Includes all encryption-related information.
  ///
  /// [enhancedMonitoring]: Specifies the level of monitoring for the MSK
  /// cluster. The possible values are DEFAULT, PER\_BROKER, and
  /// PER\_TOPIC\_PER\_BROKER.
  ///
  /// [kafkaVersion]: The version of Apache Kafka.
  ///
  /// [numberOfBrokerNodes]: The number of broker nodes in the cluster.
  ///
  /// [tags]: Create tags when creating the cluster.
  Future<CreateClusterResponse> createCluster(
      {@required BrokerNodeGroupInfo brokerNodeGroupInfo,
      ClientAuthentication clientAuthentication,
      @required String clusterName,
      ConfigurationInfo configurationInfo,
      EncryptionInfo encryptionInfo,
      String enhancedMonitoring,
      @required String kafkaVersion,
      @required int numberOfBrokerNodes,
      Map<String, String> tags}) async {
    return CreateClusterResponse.fromJson({});
  }

  /// Creates a new MSK configuration.
  ///
  /// [description]: The description of the configuration.
  ///
  /// [kafkaVersions]: The versions of Apache Kafka with which you can use this
  /// MSK configuration.
  ///
  /// [name]: The name of the configuration.
  ///
  /// [serverProperties]: Contents of the server.properties file. When using the
  /// API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of server.properties can be in plaintext.
  Future<CreateConfigurationResponse> createConfiguration(
      {String description,
      @required List<String> kafkaVersions,
      @required String name,
      @required Uint8List serverProperties}) async {
    return CreateConfigurationResponse.fromJson({});
  }

  /// Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the
  /// request.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  ///
  /// [currentVersion]: The current version of the MSK cluster.
  Future<DeleteClusterResponse> deleteCluster(String clusterArn,
      {String currentVersion}) async {
    return DeleteClusterResponse.fromJson({});
  }

  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  Future<DescribeClusterResponse> describeCluster(String clusterArn) async {
    return DescribeClusterResponse.fromJson({});
  }

  /// Returns a description of the cluster operation specified by the ARN.
  ///
  /// [clusterOperationArn]: The Amazon Resource Name (ARN) that uniquely
  /// identifies the MSK cluster operation.
  Future<DescribeClusterOperationResponse> describeClusterOperation(
      String clusterOperationArn) async {
    return DescribeClusterOperationResponse.fromJson({});
  }

  /// Returns a description of this MSK configuration.
  ///
  /// [arn]: The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  Future<DescribeConfigurationResponse> describeConfiguration(
      String arn) async {
    return DescribeConfigurationResponse.fromJson({});
  }

  /// Returns a description of this revision of the configuration.
  ///
  /// [arn]: The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  /// [revision]: A string that uniquely identifies a revision of an MSK
  /// configuration.
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision(
      {@required String arn, @required BigInt revision}) async {
    return DescribeConfigurationRevisionResponse.fromJson({});
  }

  /// A list of brokers that a client application can use to bootstrap.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  Future<GetBootstrapBrokersResponse> getBootstrapBrokers(
      String clusterArn) async {
    return GetBootstrapBrokersResponse.fromJson({});
  }

  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  ///
  /// [maxResults]: The maximum number of results to return in the response. If
  /// there are more results, the response includes a NextToken parameter.
  ///
  /// [nextToken]: The paginated results marker. When the result of the
  /// operation is truncated, the call returns NextToken in the response. To get
  /// the next batch, provide this token in your next request.
  Future<ListClusterOperationsResponse> listClusterOperations(String clusterArn,
      {int maxResults, String nextToken}) async {
    return ListClusterOperationsResponse.fromJson({});
  }

  /// Returns a list of all the MSK clusters in the current Region.
  ///
  /// [clusterNameFilter]: Specify a prefix of the name of the clusters that you
  /// want to list. The service lists all the clusters whose names start with
  /// this prefix.
  ///
  /// [maxResults]: The maximum number of results to return in the response. If
  /// there are more results, the response includes a NextToken parameter.
  ///
  /// [nextToken]: The paginated results marker. When the result of the
  /// operation is truncated, the call returns NextToken in the response. To get
  /// the next batch, provide this token in your next request.
  Future<ListClustersResponse> listClusters(
      {String clusterNameFilter, int maxResults, String nextToken}) async {
    return ListClustersResponse.fromJson({});
  }

  /// Returns a list of all the MSK configurations in this Region.
  ///
  /// [arn]: The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  /// [maxResults]: The maximum number of results to return in the response. If
  /// there are more results, the response includes a NextToken parameter.
  ///
  /// [nextToken]: The paginated results marker. When the result of the
  /// operation is truncated, the call returns NextToken in the response. To get
  /// the next batch, provide this token in your next request.
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions(
      String arn,
      {int maxResults,
      String nextToken}) async {
    return ListConfigurationRevisionsResponse.fromJson({});
  }

  /// Returns a list of all the MSK configurations in this Region.
  ///
  /// [maxResults]: The maximum number of results to return in the response. If
  /// there are more results, the response includes a NextToken parameter.
  ///
  /// [nextToken]: The paginated results marker. When the result of the
  /// operation is truncated, the call returns NextToken in the response. To get
  /// the next batch, provide this token in your next request.
  Future<ListConfigurationsResponse> listConfigurations(
      {int maxResults, String nextToken}) async {
    return ListConfigurationsResponse.fromJson({});
  }

  /// Returns a list of the broker nodes in the cluster.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  ///
  /// [maxResults]: The maximum number of results to return in the response. If
  /// there are more results, the response includes a NextToken parameter.
  ///
  /// [nextToken]: The paginated results marker. When the result of the
  /// operation is truncated, the call returns NextToken in the response. To get
  /// the next batch, provide this token in your next request.
  Future<ListNodesResponse> listNodes(String clusterArn,
      {int maxResults, String nextToken}) async {
    return ListNodesResponse.fromJson({});
  }

  /// Returns a list of the tags associated with the specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// resource that's associated with the tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Adds tags to the specified MSK resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// resource that's associated with the tags.
  ///
  /// [tags]: The key-value pair for the resource tag.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes the tags associated with the keys that are provided in the query.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// resource that's associated with the tags.
  ///
  /// [tagKeys]: Tag keys must be unique for a given cluster. In addition, the
  /// following restrictions apply:
  ///
  /// *   Each tag key must be unique. If you add a tag with a key that's
  /// already in use, your new tag overwrites the existing key-value pair.
  ///
  /// *   You can't start a tag key with aws: because this prefix is reserved
  /// for use by AWS. AWS creates tags that begin with this prefix on your
  /// behalf, but you can't edit or delete them.
  ///
  /// *   Tag keys must be between 1 and 128 Unicode characters in length.
  ///
  /// *   Tag keys must consist of the following characters: Unicode letters,
  /// digits, white space, and the following special characters: _ . / = + - @.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the EBS storage associated with MSK brokers.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  ///
  /// [currentVersion]: The version of cluster to update from. A successful
  /// operation will then generate a new version.
  ///
  /// [targetBrokerEbsVolumeInfo]: Describes the target volume size and the ID
  /// of the broker to apply the update to.
  Future<UpdateBrokerStorageResponse> updateBrokerStorage(
      {@required String clusterArn,
      @required String currentVersion,
      @required List<BrokerEbsVolumeInfo> targetBrokerEbsVolumeInfo}) async {
    return UpdateBrokerStorageResponse.fromJson({});
  }

  /// Updates the cluster with the configuration that is specified in the
  /// request body.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  ///
  /// [configurationInfo]: Represents the configuration that you want MSK to use
  /// for the brokers in a cluster.
  ///
  /// [currentVersion]: The version of the cluster that needs to be updated.
  Future<UpdateClusterConfigurationResponse> updateClusterConfiguration(
      {@required String clusterArn,
      @required ConfigurationInfo configurationInfo,
      @required String currentVersion}) async {
    return UpdateClusterConfigurationResponse.fromJson({});
  }
}

class BrokerEbsVolumeInfo {
  /// The ID of the broker to update.
  final String kafkaBrokerNodeId;

  /// Size of the EBS volume to update.
  final int volumeSizeGB;

  BrokerEbsVolumeInfo({
    @required this.kafkaBrokerNodeId,
    @required this.volumeSizeGB,
  });
  static BrokerEbsVolumeInfo fromJson(Map<String, dynamic> json) =>
      BrokerEbsVolumeInfo();
}

class BrokerNodeGroupInfo {
  /// The distribution of broker nodes across Availability Zones.
  final String brokerAZDistribution;

  /// The list of subnets to connect to in the client virtual private cloud
  /// (VPC). AWS creates elastic network interfaces inside these subnets. Client
  /// applications use elastic network interfaces to produce and consume data.
  /// Client subnets can't be in Availability Zone us-east-1e.
  final List<String> clientSubnets;

  /// The type of Amazon EC2 instances to use for Kafka brokers. The following
  /// instance types are allowed: kafka.m5.large, kafka.m5.xlarge,
  /// kafka.m5.2xlarge, kafka.m5.4xlarge, kafka.m5.12xlarge, and
  /// kafka.m5.24xlarge.
  final String instanceType;

  /// The AWS security groups to associate with the elastic network interfaces
  /// in order to specify who can connect to and communicate with the Amazon MSK
  /// cluster. If you don't specify a security group, Amazon MSK uses the
  /// default security group associated with the VPC.
  final List<String> securityGroups;

  /// Contains information about storage volumes attached to MSK broker nodes.
  final StorageInfo storageInfo;

  BrokerNodeGroupInfo({
    this.brokerAZDistribution,
    @required this.clientSubnets,
    @required this.instanceType,
    this.securityGroups,
    this.storageInfo,
  });
  static BrokerNodeGroupInfo fromJson(Map<String, dynamic> json) =>
      BrokerNodeGroupInfo();
}

class BrokerNodeInfo {
  /// The attached elastic network interface of the broker.
  final String attachedEniId;

  /// The ID of the broker.
  final double brokerId;

  /// The client subnet to which this broker node belongs.
  final String clientSubnet;

  /// The virtual private cloud (VPC) of the client.
  final String clientVpcIpAddress;

  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  final BrokerSoftwareInfo currentBrokerSoftwareInfo;

  /// Endpoints for accessing the broker.
  final List<String> endpoints;

  BrokerNodeInfo({
    this.attachedEniId,
    this.brokerId,
    this.clientSubnet,
    this.clientVpcIpAddress,
    this.currentBrokerSoftwareInfo,
    this.endpoints,
  });
  static BrokerNodeInfo fromJson(Map<String, dynamic> json) => BrokerNodeInfo();
}

class BrokerSoftwareInfo {
  /// The Amazon Resource Name (ARN) of the configuration used for the cluster.
  /// This field isn't visible in this preview release.
  final String configurationArn;

  /// The revision of the configuration to use. This field isn't visible in this
  /// preview release.
  final BigInt configurationRevision;

  /// The version of Apache Kafka.
  final String kafkaVersion;

  BrokerSoftwareInfo({
    this.configurationArn,
    this.configurationRevision,
    this.kafkaVersion,
  });
  static BrokerSoftwareInfo fromJson(Map<String, dynamic> json) =>
      BrokerSoftwareInfo();
}

class ClientAuthentication {
  /// Details for ClientAuthentication using TLS.
  final Tls tls;

  ClientAuthentication({
    this.tls,
  });
  static ClientAuthentication fromJson(Map<String, dynamic> json) =>
      ClientAuthentication();
}

class ClusterInfo {
  /// Arn of active cluster operation.
  final String activeOperationArn;

  /// Information about the broker nodes.
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  /// Includes all client authentication information.
  final ClientAuthentication clientAuthentication;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  final String clusterArn;

  /// The name of the cluster.
  final String clusterName;

  /// The time when the cluster was created.
  final DateTime creationTime;

  /// Information about the version of software currently deployed on the Kafka
  /// brokers in the cluster.
  final BrokerSoftwareInfo currentBrokerSoftwareInfo;

  /// The current version of the MSK cluster.
  final String currentVersion;

  /// Includes all encryption-related information.
  final EncryptionInfo encryptionInfo;

  /// Specifies which metrics are gathered for the MSK cluster. This property
  /// has three possible values: DEFAULT, PER\_BROKER, and
  /// PER\_TOPIC\_PER\_BROKER. For a list of the metrics associated with each of
  /// these three levels of monitoring, see
  /// [Monitoring](https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html).
  final String enhancedMonitoring;

  /// The number of broker nodes in the cluster.
  final int numberOfBrokerNodes;

  /// The state of the cluster. The possible states are CREATING, ACTIVE, and
  /// FAILED.
  final String state;

  /// Tags attached to the cluster.
  final Map<String, String> tags;

  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  final String zookeeperConnectString;

  ClusterInfo({
    this.activeOperationArn,
    this.brokerNodeGroupInfo,
    this.clientAuthentication,
    this.clusterArn,
    this.clusterName,
    this.creationTime,
    this.currentBrokerSoftwareInfo,
    this.currentVersion,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.numberOfBrokerNodes,
    this.state,
    this.tags,
    this.zookeeperConnectString,
  });
  static ClusterInfo fromJson(Map<String, dynamic> json) => ClusterInfo();
}

class ClusterOperationInfo {
  /// The ID of the API request that triggered this operation.
  final String clientRequestId;

  /// ARN of the cluster.
  final String clusterArn;

  /// The time that the operation was created.
  final DateTime creationTime;

  /// The time at which the operation finished.
  final DateTime endTime;

  /// Describes the error if the operation fails.
  final ErrorInfo errorInfo;

  /// ARN of the cluster operation.
  final String operationArn;

  /// State of the cluster operation.
  final String operationState;

  /// Type of the cluster operation.
  final String operationType;

  /// Information about cluster attributes before a cluster is updated.
  final MutableClusterInfo sourceClusterInfo;

  /// Information about cluster attributes after a cluster is updated.
  final MutableClusterInfo targetClusterInfo;

  ClusterOperationInfo({
    this.clientRequestId,
    this.clusterArn,
    this.creationTime,
    this.endTime,
    this.errorInfo,
    this.operationArn,
    this.operationState,
    this.operationType,
    this.sourceClusterInfo,
    this.targetClusterInfo,
  });
  static ClusterOperationInfo fromJson(Map<String, dynamic> json) =>
      ClusterOperationInfo();
}

class Configuration {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// The time when the configuration was created.
  final DateTime creationTime;

  /// The description of the configuration.
  final String description;

  /// An array of the versions of Apache Kafka with which you can use this MSK
  /// configuration. You can use this configuration for an MSK cluster only if
  /// the Apache Kafka version specified for the cluster appears in this array.
  final List<String> kafkaVersions;

  /// Latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// The name of the configuration.
  final String name;

  Configuration({
    @required this.arn,
    @required this.creationTime,
    @required this.description,
    @required this.kafkaVersions,
    @required this.latestRevision,
    @required this.name,
  });
  static Configuration fromJson(Map<String, dynamic> json) => Configuration();
}

class ConfigurationInfo {
  /// ARN of the configuration to use.
  final String arn;

  /// The revision of the configuration to use.
  final BigInt revision;

  ConfigurationInfo({
    @required this.arn,
    @required this.revision,
  });
  static ConfigurationInfo fromJson(Map<String, dynamic> json) =>
      ConfigurationInfo();
}

class ConfigurationRevision {
  /// The time when the configuration revision was created.
  final DateTime creationTime;

  /// The description of the configuration revision.
  final String description;

  /// The revision number.
  final BigInt revision;

  ConfigurationRevision({
    @required this.creationTime,
    this.description,
    @required this.revision,
  });
  static ConfigurationRevision fromJson(Map<String, dynamic> json) =>
      ConfigurationRevision();
}

class CreateClusterResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String clusterArn;

  /// The name of the MSK cluster.
  final String clusterName;

  /// The state of the cluster. The possible states are CREATING, ACTIVE, and
  /// FAILED.
  final String state;

  CreateClusterResponse({
    this.clusterArn,
    this.clusterName,
    this.state,
  });
  static CreateClusterResponse fromJson(Map<String, dynamic> json) =>
      CreateClusterResponse();
}

class CreateConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// The time when the configuration was created.
  final DateTime creationTime;

  /// Latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// The name of the configuration.
  final String name;

  CreateConfigurationResponse({
    this.arn,
    this.creationTime,
    this.latestRevision,
    this.name,
  });
  static CreateConfigurationResponse fromJson(Map<String, dynamic> json) =>
      CreateConfigurationResponse();
}

class DeleteClusterResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String clusterArn;

  /// The state of the cluster. The possible states are CREATING, ACTIVE, and
  /// FAILED.
  final String state;

  DeleteClusterResponse({
    this.clusterArn,
    this.state,
  });
  static DeleteClusterResponse fromJson(Map<String, dynamic> json) =>
      DeleteClusterResponse();
}

class DescribeClusterOperationResponse {
  /// Cluster operation information
  final ClusterOperationInfo clusterOperationInfo;

  DescribeClusterOperationResponse({
    this.clusterOperationInfo,
  });
  static DescribeClusterOperationResponse fromJson(Map<String, dynamic> json) =>
      DescribeClusterOperationResponse();
}

class DescribeClusterResponse {
  /// The cluster information.
  final ClusterInfo clusterInfo;

  DescribeClusterResponse({
    this.clusterInfo,
  });
  static DescribeClusterResponse fromJson(Map<String, dynamic> json) =>
      DescribeClusterResponse();
}

class DescribeConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// The time when the configuration was created.
  final DateTime creationTime;

  /// The description of the configuration.
  final String description;

  /// The versions of Apache Kafka with which you can use this MSK
  /// configuration.
  final List<String> kafkaVersions;

  /// Latest revision of the configuration.
  final ConfigurationRevision latestRevision;

  /// The name of the configuration.
  final String name;

  DescribeConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.kafkaVersions,
    this.latestRevision,
    this.name,
  });
  static DescribeConfigurationResponse fromJson(Map<String, dynamic> json) =>
      DescribeConfigurationResponse();
}

class DescribeConfigurationRevisionResponse {
  /// The Amazon Resource Name (ARN) of the configuration.
  final String arn;

  /// The time when the configuration was created.
  final DateTime creationTime;

  /// The description of the configuration.
  final String description;

  /// The revision number.
  final BigInt revision;

  /// Contents of the server.properties file. When using the API, you must
  /// ensure that the contents of the file are base64 encoded. When using the
  /// AWS Management Console, the SDK, or the AWS CLI, the contents of
  /// server.properties can be in plaintext.
  final Uint8List serverProperties;

  DescribeConfigurationRevisionResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.revision,
    this.serverProperties,
  });
  static DescribeConfigurationRevisionResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationRevisionResponse();
}

class EbsStorageInfo {
  /// The size in GiB of the EBS volume for the data drive on each broker node.
  final int volumeSize;

  EbsStorageInfo({
    this.volumeSize,
  });
  static EbsStorageInfo fromJson(Map<String, dynamic> json) => EbsStorageInfo();
}

class EncryptionAtRest {
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't
  /// specify a KMS key, MSK creates one for you and uses it.
  final String dataVolumeKmsKeyId;

  EncryptionAtRest({
    @required this.dataVolumeKmsKeyId,
  });
  static EncryptionAtRest fromJson(Map<String, dynamic> json) =>
      EncryptionAtRest();
}

class EncryptionInTransit {
  /// Indicates the encryption setting for data in transit between clients and
  /// brokers. The following are the possible values.
  ///
  ///  TLS means that client-broker communication is enabled with TLS only.
  ///
  ///  TLS_PLAINTEXT means that client-broker communication is enabled for both
  /// TLS-encrypted, as well as plaintext data.
  ///
  ///  PLAINTEXT means that client-broker communication is enabled in plaintext
  /// only.
  ///
  /// The default value is TLS_PLAINTEXT.
  final String clientBroker;

  /// When set to true, it indicates that data communication among the broker
  /// nodes of the cluster is encrypted. When set to false, the communication
  /// happens in plaintext.
  ///
  /// The default value is true.
  final bool inCluster;

  EncryptionInTransit({
    this.clientBroker,
    this.inCluster,
  });
  static EncryptionInTransit fromJson(Map<String, dynamic> json) =>
      EncryptionInTransit();
}

class EncryptionInfo {
  /// The data-volume encryption details.
  final EncryptionAtRest encryptionAtRest;

  /// The details for encryption in transit.
  final EncryptionInTransit encryptionInTransit;

  EncryptionInfo({
    this.encryptionAtRest,
    this.encryptionInTransit,
  });
  static EncryptionInfo fromJson(Map<String, dynamic> json) => EncryptionInfo();
}

class ErrorInfo {
  /// A number describing the error programmatically.
  final String errorCode;

  /// An optional field to provide more details about the error.
  final String errorString;

  ErrorInfo({
    this.errorCode,
    this.errorString,
  });
  static ErrorInfo fromJson(Map<String, dynamic> json) => ErrorInfo();
}

class GetBootstrapBrokersResponse {
  /// A string containing one or more hostname:port pairs.
  final String bootstrapBrokerString;

  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  final String bootstrapBrokerStringTls;

  GetBootstrapBrokersResponse({
    this.bootstrapBrokerString,
    this.bootstrapBrokerStringTls,
  });
  static GetBootstrapBrokersResponse fromJson(Map<String, dynamic> json) =>
      GetBootstrapBrokersResponse();
}

class ListClusterOperationsResponse {
  /// An array of cluster operation information objects.
  final List<ClusterOperationInfo> clusterOperationInfoList;

  /// If the response of ListClusterOperations is truncated, it returns a
  /// NextToken in the response. This Nexttoken should be sent in the subsequent
  /// request to ListClusterOperations.
  final String nextToken;

  ListClusterOperationsResponse({
    this.clusterOperationInfoList,
    this.nextToken,
  });
  static ListClusterOperationsResponse fromJson(Map<String, dynamic> json) =>
      ListClusterOperationsResponse();
}

class ListClustersResponse {
  /// Information on each of the MSK clusters in the response.
  final List<ClusterInfo> clusterInfoList;

  /// The paginated results marker. When the result of a ListClusters operation
  /// is truncated, the call returns NextToken in the response. To get another
  /// batch of clusters, provide this token in your next request.
  final String nextToken;

  ListClustersResponse({
    this.clusterInfoList,
    this.nextToken,
  });
  static ListClustersResponse fromJson(Map<String, dynamic> json) =>
      ListClustersResponse();
}

class ListConfigurationRevisionsResponse {
  /// Paginated results marker.
  final String nextToken;

  /// List of ConfigurationRevision objects.
  final List<ConfigurationRevision> revisions;

  ListConfigurationRevisionsResponse({
    this.nextToken,
    this.revisions,
  });
  static ListConfigurationRevisionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListConfigurationRevisionsResponse();
}

class ListConfigurationsResponse {
  /// An array of MSK configurations.
  final List<Configuration> configurations;

  /// The paginated results marker. When the result of a ListConfigurations
  /// operation is truncated, the call returns NextToken in the response. To get
  /// another batch of configurations, provide this token in your next request.
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });
  static ListConfigurationsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationsResponse();
}

class ListNodesResponse {
  /// The paginated results marker. When the result of a ListNodes operation is
  /// truncated, the call returns NextToken in the response. To get another
  /// batch of nodes, provide this token in your next request.
  final String nextToken;

  /// List containing a NodeInfo object.
  final List<NodeInfo> nodeInfoList;

  ListNodesResponse({
    this.nextToken,
    this.nodeInfoList,
  });
  static ListNodesResponse fromJson(Map<String, dynamic> json) =>
      ListNodesResponse();
}

class ListTagsForResourceResponse {
  /// The key-value pair for the resource tag.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class MutableClusterInfo {
  /// Specifies the size of the EBS volume and the ID of the associated broker.
  final List<BrokerEbsVolumeInfo> brokerEbsVolumeInfo;

  /// Information about the changes in the configuration of the brokers.
  final ConfigurationInfo configurationInfo;

  /// The number of broker nodes in the cluster.
  final int numberOfBrokerNodes;

  MutableClusterInfo({
    this.brokerEbsVolumeInfo,
    this.configurationInfo,
    this.numberOfBrokerNodes,
  });
  static MutableClusterInfo fromJson(Map<String, dynamic> json) =>
      MutableClusterInfo();
}

class NodeInfo {
  /// The start time.
  final String addedToClusterTime;

  /// The broker node info.
  final BrokerNodeInfo brokerNodeInfo;

  /// The instance type.
  final String instanceType;

  /// The Amazon Resource Name (ARN) of the node.
  final String nodeArn;

  /// The node type.
  final String nodeType;

  /// The ZookeeperNodeInfo.
  final ZookeeperNodeInfo zookeeperNodeInfo;

  NodeInfo({
    this.addedToClusterTime,
    this.brokerNodeInfo,
    this.instanceType,
    this.nodeArn,
    this.nodeType,
    this.zookeeperNodeInfo,
  });
  static NodeInfo fromJson(Map<String, dynamic> json) => NodeInfo();
}

class StorageInfo {
  /// EBS volume information.
  final EbsStorageInfo ebsStorageInfo;

  StorageInfo({
    this.ebsStorageInfo,
  });
  static StorageInfo fromJson(Map<String, dynamic> json) => StorageInfo();
}

class Tls {
  /// List of ACM Certificate Authority ARNs.
  final List<String> certificateAuthorityArnList;

  Tls({
    this.certificateAuthorityArnList,
  });
  static Tls fromJson(Map<String, dynamic> json) => Tls();
}

class UpdateBrokerStorageResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String clusterOperationArn;

  UpdateBrokerStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  static UpdateBrokerStorageResponse fromJson(Map<String, dynamic> json) =>
      UpdateBrokerStorageResponse();
}

class UpdateClusterConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String clusterArn;

  /// The Amazon Resource Name (ARN) of the cluster operation.
  final String clusterOperationArn;

  UpdateClusterConfigurationResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });
  static UpdateClusterConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateClusterConfigurationResponse();
}

class ZookeeperNodeInfo {
  /// The attached elastic network interface of the broker.
  final String attachedEniId;

  /// The virtual private cloud (VPC) IP address of the client.
  final String clientVpcIpAddress;

  /// Endpoints for accessing the ZooKeeper.
  final List<String> endpoints;

  /// The role-specific ID for Zookeeper.
  final double zookeeperId;

  /// The version of Zookeeper.
  final String zookeeperVersion;

  ZookeeperNodeInfo({
    this.attachedEniId,
    this.clientVpcIpAddress,
    this.endpoints,
    this.zookeeperId,
    this.zookeeperVersion,
  });
  static ZookeeperNodeInfo fromJson(Map<String, dynamic> json) =>
      ZookeeperNodeInfo();
}
