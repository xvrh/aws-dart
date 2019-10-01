import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The operations for managing an Amazon MSK cluster.
class KafkaApi {
  final _client;
  KafkaApi(client)
      : _client = client.configured('Kafka', serializer: 'rest-json');

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
  /// cluster. The possible values are DEFAULT, PER_BROKER, and
  /// PER_TOPIC_PER_BROKER.
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
    var response_ = await _client.send('CreateCluster', {
      'BrokerNodeGroupInfo': brokerNodeGroupInfo,
      if (clientAuthentication != null)
        'ClientAuthentication': clientAuthentication,
      'ClusterName': clusterName,
      if (configurationInfo != null) 'ConfigurationInfo': configurationInfo,
      if (encryptionInfo != null) 'EncryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null) 'EnhancedMonitoring': enhancedMonitoring,
      'KafkaVersion': kafkaVersion,
      'NumberOfBrokerNodes': numberOfBrokerNodes,
      if (tags != null) 'Tags': tags,
    });
    return CreateClusterResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateConfiguration', {
      if (description != null) 'Description': description,
      'KafkaVersions': kafkaVersions,
      'Name': name,
      'ServerProperties': serverProperties,
    });
    return CreateConfigurationResponse.fromJson(response_);
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
    var response_ = await _client.send('DeleteCluster', {
      'ClusterArn': clusterArn,
      if (currentVersion != null) 'CurrentVersion': currentVersion,
    });
    return DeleteClusterResponse.fromJson(response_);
  }

  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  Future<DescribeClusterResponse> describeCluster(String clusterArn) async {
    var response_ = await _client.send('DescribeCluster', {
      'ClusterArn': clusterArn,
    });
    return DescribeClusterResponse.fromJson(response_);
  }

  /// Returns a description of the cluster operation specified by the ARN.
  ///
  /// [clusterOperationArn]: The Amazon Resource Name (ARN) that uniquely
  /// identifies the MSK cluster operation.
  Future<DescribeClusterOperationResponse> describeClusterOperation(
      String clusterOperationArn) async {
    var response_ = await _client.send('DescribeClusterOperation', {
      'ClusterOperationArn': clusterOperationArn,
    });
    return DescribeClusterOperationResponse.fromJson(response_);
  }

  /// Returns a description of this MSK configuration.
  ///
  /// [arn]: The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  Future<DescribeConfigurationResponse> describeConfiguration(
      String arn) async {
    var response_ = await _client.send('DescribeConfiguration', {
      'Arn': arn,
    });
    return DescribeConfigurationResponse.fromJson(response_);
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
    var response_ = await _client.send('DescribeConfigurationRevision', {
      'Arn': arn,
      'Revision': revision,
    });
    return DescribeConfigurationRevisionResponse.fromJson(response_);
  }

  /// A list of brokers that a client application can use to bootstrap.
  ///
  /// [clusterArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// cluster.
  Future<GetBootstrapBrokersResponse> getBootstrapBrokers(
      String clusterArn) async {
    var response_ = await _client.send('GetBootstrapBrokers', {
      'ClusterArn': clusterArn,
    });
    return GetBootstrapBrokersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListClusterOperations', {
      'ClusterArn': clusterArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListClusterOperationsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListClusters', {
      if (clusterNameFilter != null) 'ClusterNameFilter': clusterNameFilter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListClustersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListConfigurationRevisions', {
      'Arn': arn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListConfigurationRevisionsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListConfigurations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListConfigurationsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListNodes', {
      'ClusterArn': clusterArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListNodesResponse.fromJson(response_);
  }

  /// Returns a list of the tags associated with the specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// resource that's associated with the tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Adds tags to the specified MSK resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that uniquely identifies the
  /// resource that's associated with the tags.
  ///
  /// [tags]: The key-value pair for the resource tag.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
  }

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
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

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
    var response_ = await _client.send('UpdateBrokerStorage', {
      'ClusterArn': clusterArn,
      'CurrentVersion': currentVersion,
      'TargetBrokerEBSVolumeInfo': targetBrokerEbsVolumeInfo,
    });
    return UpdateBrokerStorageResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateClusterConfiguration', {
      'ClusterArn': clusterArn,
      'ConfigurationInfo': configurationInfo,
      'CurrentVersion': currentVersion,
    });
    return UpdateClusterConfigurationResponse.fromJson(response_);
  }
}

/// Specifies the EBS volume upgrade information. The broker identifier must be
/// set to the keyword ALL. This means the changes apply to all the brokers in
/// the cluster.
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
      BrokerEbsVolumeInfo(
        kafkaBrokerNodeId: json['KafkaBrokerNodeId'] as String,
        volumeSizeGB: json['VolumeSizeGB'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the setup to be used for Kafka broker nodes in the cluster.
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
      BrokerNodeGroupInfo(
        brokerAZDistribution: json.containsKey('BrokerAZDistribution')
            ? json['BrokerAZDistribution'] as String
            : null,
        clientSubnets:
            (json['ClientSubnets'] as List).map((e) => e as String).toList(),
        instanceType: json['InstanceType'] as String,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List).map((e) => e as String).toList()
            : null,
        storageInfo: json.containsKey('StorageInfo')
            ? StorageInfo.fromJson(json['StorageInfo'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// BrokerNodeInfo
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
  static BrokerNodeInfo fromJson(Map<String, dynamic> json) => BrokerNodeInfo(
        attachedEniId: json.containsKey('AttachedENIId')
            ? json['AttachedENIId'] as String
            : null,
        brokerId:
            json.containsKey('BrokerId') ? json['BrokerId'] as double : null,
        clientSubnet: json.containsKey('ClientSubnet')
            ? json['ClientSubnet'] as String
            : null,
        clientVpcIpAddress: json.containsKey('ClientVpcIpAddress')
            ? json['ClientVpcIpAddress'] as String
            : null,
        currentBrokerSoftwareInfo: json.containsKey('CurrentBrokerSoftwareInfo')
            ? BrokerSoftwareInfo.fromJson(json['CurrentBrokerSoftwareInfo'])
            : null,
        endpoints: json.containsKey('Endpoints')
            ? (json['Endpoints'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Information about the current software installed on the cluster.
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
      BrokerSoftwareInfo(
        configurationArn: json.containsKey('ConfigurationArn')
            ? json['ConfigurationArn'] as String
            : null,
        configurationRevision: json.containsKey('ConfigurationRevision')
            ? BigInt.from(json['ConfigurationRevision'])
            : null,
        kafkaVersion: json.containsKey('KafkaVersion')
            ? json['KafkaVersion'] as String
            : null,
      );
}

/// Includes all client authentication information.
class ClientAuthentication {
  /// Details for ClientAuthentication using TLS.
  final Tls tls;

  ClientAuthentication({
    this.tls,
  });
  static ClientAuthentication fromJson(Map<String, dynamic> json) =>
      ClientAuthentication(
        tls: json.containsKey('Tls') ? Tls.fromJson(json['Tls']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Returns information about a cluster.
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
  /// has three possible values: DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER.
  /// For a list of the metrics associated with each of these three levels of
  /// monitoring, see
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
  static ClusterInfo fromJson(Map<String, dynamic> json) => ClusterInfo(
        activeOperationArn: json.containsKey('ActiveOperationArn')
            ? json['ActiveOperationArn'] as String
            : null,
        brokerNodeGroupInfo: json.containsKey('BrokerNodeGroupInfo')
            ? BrokerNodeGroupInfo.fromJson(json['BrokerNodeGroupInfo'])
            : null,
        clientAuthentication: json.containsKey('ClientAuthentication')
            ? ClientAuthentication.fromJson(json['ClientAuthentication'])
            : null,
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        clusterName: json.containsKey('ClusterName')
            ? json['ClusterName'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        currentBrokerSoftwareInfo: json.containsKey('CurrentBrokerSoftwareInfo')
            ? BrokerSoftwareInfo.fromJson(json['CurrentBrokerSoftwareInfo'])
            : null,
        currentVersion: json.containsKey('CurrentVersion')
            ? json['CurrentVersion'] as String
            : null,
        encryptionInfo: json.containsKey('EncryptionInfo')
            ? EncryptionInfo.fromJson(json['EncryptionInfo'])
            : null,
        enhancedMonitoring: json.containsKey('EnhancedMonitoring')
            ? json['EnhancedMonitoring'] as String
            : null,
        numberOfBrokerNodes: json.containsKey('NumberOfBrokerNodes')
            ? json['NumberOfBrokerNodes'] as int
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        zookeeperConnectString: json.containsKey('ZookeeperConnectString')
            ? json['ZookeeperConnectString'] as String
            : null,
      );
}

/// Returns information about a cluster operation.
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
      ClusterOperationInfo(
        clientRequestId: json.containsKey('ClientRequestId')
            ? json['ClientRequestId'] as String
            : null,
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        errorInfo: json.containsKey('ErrorInfo')
            ? ErrorInfo.fromJson(json['ErrorInfo'])
            : null,
        operationArn: json.containsKey('OperationArn')
            ? json['OperationArn'] as String
            : null,
        operationState: json.containsKey('OperationState')
            ? json['OperationState'] as String
            : null,
        operationType: json.containsKey('OperationType')
            ? json['OperationType'] as String
            : null,
        sourceClusterInfo: json.containsKey('SourceClusterInfo')
            ? MutableClusterInfo.fromJson(json['SourceClusterInfo'])
            : null,
        targetClusterInfo: json.containsKey('TargetClusterInfo')
            ? MutableClusterInfo.fromJson(json['TargetClusterInfo'])
            : null,
      );
}

/// Represents an MSK Configuration.
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
  static Configuration fromJson(Map<String, dynamic> json) => Configuration(
        arn: json['Arn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        description: json['Description'] as String,
        kafkaVersions:
            (json['KafkaVersions'] as List).map((e) => e as String).toList(),
        latestRevision: ConfigurationRevision.fromJson(json['LatestRevision']),
        name: json['Name'] as String,
      );
}

/// Specifies the configuration to use for the brokers.
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
      ConfigurationInfo(
        arn: json['Arn'] as String,
        revision: BigInt.from(json['Revision']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a configuration revision.
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
      ConfigurationRevision(
        creationTime: DateTime.parse(json['CreationTime']),
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        revision: BigInt.from(json['Revision']),
      );
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
      CreateClusterResponse(
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        clusterName: json.containsKey('ClusterName')
            ? json['ClusterName'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
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
      CreateConfigurationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        latestRevision: json.containsKey('LatestRevision')
            ? ConfigurationRevision.fromJson(json['LatestRevision'])
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
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
      DeleteClusterResponse(
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

class DescribeClusterOperationResponse {
  /// Cluster operation information
  final ClusterOperationInfo clusterOperationInfo;

  DescribeClusterOperationResponse({
    this.clusterOperationInfo,
  });
  static DescribeClusterOperationResponse fromJson(Map<String, dynamic> json) =>
      DescribeClusterOperationResponse(
        clusterOperationInfo: json.containsKey('ClusterOperationInfo')
            ? ClusterOperationInfo.fromJson(json['ClusterOperationInfo'])
            : null,
      );
}

class DescribeClusterResponse {
  /// The cluster information.
  final ClusterInfo clusterInfo;

  DescribeClusterResponse({
    this.clusterInfo,
  });
  static DescribeClusterResponse fromJson(Map<String, dynamic> json) =>
      DescribeClusterResponse(
        clusterInfo: json.containsKey('ClusterInfo')
            ? ClusterInfo.fromJson(json['ClusterInfo'])
            : null,
      );
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
      DescribeConfigurationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        kafkaVersions: json.containsKey('KafkaVersions')
            ? (json['KafkaVersions'] as List).map((e) => e as String).toList()
            : null,
        latestRevision: json.containsKey('LatestRevision')
            ? ConfigurationRevision.fromJson(json['LatestRevision'])
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
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
      DescribeConfigurationRevisionResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        revision:
            json.containsKey('Revision') ? BigInt.from(json['Revision']) : null,
        serverProperties: json.containsKey('ServerProperties')
            ? Uint8List(json['ServerProperties'])
            : null,
      );
}

/// Contains information about the EBS storage volumes attached to Kafka broker
/// nodes.
class EbsStorageInfo {
  /// The size in GiB of the EBS volume for the data drive on each broker node.
  final int volumeSize;

  EbsStorageInfo({
    this.volumeSize,
  });
  static EbsStorageInfo fromJson(Map<String, dynamic> json) => EbsStorageInfo(
        volumeSize:
            json.containsKey('VolumeSize') ? json['VolumeSize'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The data-volume encryption details.
class EncryptionAtRest {
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't
  /// specify a KMS key, MSK creates one for you and uses it.
  final String dataVolumeKmsKeyId;

  EncryptionAtRest({
    @required this.dataVolumeKmsKeyId,
  });
  static EncryptionAtRest fromJson(Map<String, dynamic> json) =>
      EncryptionAtRest(
        dataVolumeKmsKeyId: json['DataVolumeKMSKeyId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The settings for encrypting data in transit.
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
      EncryptionInTransit(
        clientBroker: json.containsKey('ClientBroker')
            ? json['ClientBroker'] as String
            : null,
        inCluster:
            json.containsKey('InCluster') ? json['InCluster'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Includes encryption-related information, such as the AWS KMS key used for
/// encrypting data at rest and whether you want MSK to encrypt your data in
/// transit.
class EncryptionInfo {
  /// The data-volume encryption details.
  final EncryptionAtRest encryptionAtRest;

  /// The details for encryption in transit.
  final EncryptionInTransit encryptionInTransit;

  EncryptionInfo({
    this.encryptionAtRest,
    this.encryptionInTransit,
  });
  static EncryptionInfo fromJson(Map<String, dynamic> json) => EncryptionInfo(
        encryptionAtRest: json.containsKey('EncryptionAtRest')
            ? EncryptionAtRest.fromJson(json['EncryptionAtRest'])
            : null,
        encryptionInTransit: json.containsKey('EncryptionInTransit')
            ? EncryptionInTransit.fromJson(json['EncryptionInTransit'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Returns information about an error state of the cluster.
class ErrorInfo {
  /// A number describing the error programmatically.
  final String errorCode;

  /// An optional field to provide more details about the error.
  final String errorString;

  ErrorInfo({
    this.errorCode,
    this.errorString,
  });
  static ErrorInfo fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorString: json.containsKey('ErrorString')
            ? json['ErrorString'] as String
            : null,
      );
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
      GetBootstrapBrokersResponse(
        bootstrapBrokerString: json.containsKey('BootstrapBrokerString')
            ? json['BootstrapBrokerString'] as String
            : null,
        bootstrapBrokerStringTls: json.containsKey('BootstrapBrokerStringTls')
            ? json['BootstrapBrokerStringTls'] as String
            : null,
      );
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
      ListClusterOperationsResponse(
        clusterOperationInfoList: json.containsKey('ClusterOperationInfoList')
            ? (json['ClusterOperationInfoList'] as List)
                .map((e) => ClusterOperationInfo.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListClustersResponse(
        clusterInfoList: json.containsKey('ClusterInfoList')
            ? (json['ClusterInfoList'] as List)
                .map((e) => ClusterInfo.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListConfigurationRevisionsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        revisions: json.containsKey('Revisions')
            ? (json['Revisions'] as List)
                .map((e) => ConfigurationRevision.fromJson(e))
                .toList()
            : null,
      );
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
      ListConfigurationsResponse(
        configurations: json.containsKey('Configurations')
            ? (json['Configurations'] as List)
                .map((e) => Configuration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListNodesResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        nodeInfoList: json.containsKey('NodeInfoList')
            ? (json['NodeInfoList'] as List)
                .map((e) => NodeInfo.fromJson(e))
                .toList()
            : null,
      );
}

class ListTagsForResourceResponse {
  /// The key-value pair for the resource tag.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Information about cluster attributes that can be updated via update APIs.
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
      MutableClusterInfo(
        brokerEbsVolumeInfo: json.containsKey('BrokerEBSVolumeInfo')
            ? (json['BrokerEBSVolumeInfo'] as List)
                .map((e) => BrokerEbsVolumeInfo.fromJson(e))
                .toList()
            : null,
        configurationInfo: json.containsKey('ConfigurationInfo')
            ? ConfigurationInfo.fromJson(json['ConfigurationInfo'])
            : null,
        numberOfBrokerNodes: json.containsKey('NumberOfBrokerNodes')
            ? json['NumberOfBrokerNodes'] as int
            : null,
      );
}

/// The node information object.
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
  static NodeInfo fromJson(Map<String, dynamic> json) => NodeInfo(
        addedToClusterTime: json.containsKey('AddedToClusterTime')
            ? json['AddedToClusterTime'] as String
            : null,
        brokerNodeInfo: json.containsKey('BrokerNodeInfo')
            ? BrokerNodeInfo.fromJson(json['BrokerNodeInfo'])
            : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        nodeArn: json.containsKey('NodeARN') ? json['NodeARN'] as String : null,
        nodeType:
            json.containsKey('NodeType') ? json['NodeType'] as String : null,
        zookeeperNodeInfo: json.containsKey('ZookeeperNodeInfo')
            ? ZookeeperNodeInfo.fromJson(json['ZookeeperNodeInfo'])
            : null,
      );
}

/// Contains information about storage volumes attached to MSK broker nodes.
class StorageInfo {
  /// EBS volume information.
  final EbsStorageInfo ebsStorageInfo;

  StorageInfo({
    this.ebsStorageInfo,
  });
  static StorageInfo fromJson(Map<String, dynamic> json) => StorageInfo(
        ebsStorageInfo: json.containsKey('EbsStorageInfo')
            ? EbsStorageInfo.fromJson(json['EbsStorageInfo'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details for client authentication using TLS.
class Tls {
  /// List of ACM Certificate Authority ARNs.
  final List<String> certificateAuthorityArnList;

  Tls({
    this.certificateAuthorityArnList,
  });
  static Tls fromJson(Map<String, dynamic> json) => Tls(
        certificateAuthorityArnList:
            json.containsKey('CertificateAuthorityArnList')
                ? (json['CertificateAuthorityArnList'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      UpdateBrokerStorageResponse(
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        clusterOperationArn: json.containsKey('ClusterOperationArn')
            ? json['ClusterOperationArn'] as String
            : null,
      );
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
      UpdateClusterConfigurationResponse(
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        clusterOperationArn: json.containsKey('ClusterOperationArn')
            ? json['ClusterOperationArn'] as String
            : null,
      );
}

/// Zookeeper node information.
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
      ZookeeperNodeInfo(
        attachedEniId: json.containsKey('AttachedENIId')
            ? json['AttachedENIId'] as String
            : null,
        clientVpcIpAddress: json.containsKey('ClientVpcIpAddress')
            ? json['ClientVpcIpAddress'] as String
            : null,
        endpoints: json.containsKey('Endpoints')
            ? (json['Endpoints'] as List).map((e) => e as String).toList()
            : null,
        zookeeperId: json.containsKey('ZookeeperId')
            ? json['ZookeeperId'] as double
            : null,
        zookeeperVersion: json.containsKey('ZookeeperVersion')
            ? json['ZookeeperVersion'] as String
            : null,
      );
}
