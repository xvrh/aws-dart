import 'package:meta/meta.dart';

/// For more information about AWS CloudHSM, see
/// [AWS CloudHSM](http://aws.amazon.com/cloudhsm/) and the
/// [AWS CloudHSM User Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/).
class CloudHsmV2Api {
  final _client;
  CloudHsmV2Api(client)
      : _client = client.configured('CloudHSM V2', serializer: 'json');

  /// Copy an AWS CloudHSM cluster backup to a different region.
  ///
  /// [destinationRegion]: The AWS region that will contain your copied CloudHSM
  /// cluster backup.
  ///
  /// [backupId]: The ID of the backup that will be copied to the destination
  /// region.
  Future<CopyBackupToRegionResponse> copyBackupToRegion(
      {@required String destinationRegion, @required String backupId}) async {
    var response_ = await _client.send('CopyBackupToRegion', {
      'DestinationRegion': destinationRegion,
      'BackupId': backupId,
    });
    return CopyBackupToRegionResponse.fromJson(response_);
  }

  /// Creates a new AWS CloudHSM cluster.
  ///
  /// [subnetIds]: The identifiers (IDs) of the subnets where you are creating
  /// the cluster. You must specify at least one subnet. If you specify multiple
  /// subnets, they must meet the following criteria:
  ///
  /// *   All subnets must be in the same virtual private cloud (VPC).
  ///
  /// *   You can specify only one subnet per Availability Zone.
  ///
  /// [hsmType]: The type of HSM to use in the cluster. Currently the only
  /// allowed value is `hsm1.medium`.
  ///
  /// [sourceBackupId]: The identifier (ID) of the cluster backup to restore.
  /// Use this value to restore the cluster from a backup instead of creating a
  /// new cluster. To find the backup ID, use DescribeBackups.
  Future<CreateClusterResponse> createCluster(
      {@required List<String> subnetIds,
      @required String hsmType,
      String sourceBackupId}) async {
    var response_ = await _client.send('CreateCluster', {
      'SubnetIds': subnetIds,
      'HsmType': hsmType,
      if (sourceBackupId != null) 'SourceBackupId': sourceBackupId,
    });
    return CreateClusterResponse.fromJson(response_);
  }

  /// Creates a new hardware security module (HSM) in the specified AWS CloudHSM
  /// cluster.
  ///
  /// [clusterId]: The identifier (ID) of the HSM's cluster. To find the cluster
  /// ID, use DescribeClusters.
  ///
  /// [availabilityZone]: The Availability Zone where you are creating the HSM.
  /// To find the cluster's Availability Zones, use DescribeClusters.
  ///
  /// [ipAddress]: The HSM's IP address. If you specify an IP address, use an
  /// available address from the subnet that maps to the Availability Zone where
  /// you are creating the HSM. If you don't specify an IP address, one is
  /// chosen for you from that subnet.
  Future<CreateHsmResponse> createHsm(
      {@required String clusterId,
      @required String availabilityZone,
      String ipAddress}) async {
    var response_ = await _client.send('CreateHsm', {
      'ClusterId': clusterId,
      'AvailabilityZone': availabilityZone,
      if (ipAddress != null) 'IpAddress': ipAddress,
    });
    return CreateHsmResponse.fromJson(response_);
  }

  /// Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7
  /// days after the DeleteBackup request. For more information on restoring a
  /// backup, see RestoreBackup
  ///
  /// [backupId]: The ID of the backup to be deleted. To find the ID of a
  /// backup, use the DescribeBackups operation.
  Future<DeleteBackupResponse> deleteBackup(String backupId) async {
    var response_ = await _client.send('DeleteBackup', {
      'BackupId': backupId,
    });
    return DeleteBackupResponse.fromJson(response_);
  }

  /// Deletes the specified AWS CloudHSM cluster. Before you can delete a
  /// cluster, you must delete all HSMs in the cluster. To see if the cluster
  /// contains any HSMs, use DescribeClusters. To delete an HSM, use DeleteHsm.
  ///
  /// [clusterId]: The identifier (ID) of the cluster that you are deleting. To
  /// find the cluster ID, use DescribeClusters.
  Future<DeleteClusterResponse> deleteCluster(String clusterId) async {
    var response_ = await _client.send('DeleteCluster', {
      'ClusterId': clusterId,
    });
    return DeleteClusterResponse.fromJson(response_);
  }

  /// Deletes the specified HSM. To specify an HSM, you can use its identifier
  /// (ID), the IP address of the HSM's elastic network interface (ENI), or the
  /// ID of the HSM's ENI. You need to specify only one of these values. To find
  /// these values, use DescribeClusters.
  ///
  /// [clusterId]: The identifier (ID) of the cluster that contains the HSM that
  /// you are deleting.
  ///
  /// [hsmId]: The identifier (ID) of the HSM that you are deleting.
  ///
  /// [eniId]: The identifier (ID) of the elastic network interface (ENI) of the
  /// HSM that you are deleting.
  ///
  /// [eniIp]: The IP address of the elastic network interface (ENI) of the HSM
  /// that you are deleting.
  Future<DeleteHsmResponse> deleteHsm(String clusterId,
      {String hsmId, String eniId, String eniIp}) async {
    var response_ = await _client.send('DeleteHsm', {
      'ClusterId': clusterId,
      if (hsmId != null) 'HsmId': hsmId,
      if (eniId != null) 'EniId': eniId,
      if (eniIp != null) 'EniIp': eniIp,
    });
    return DeleteHsmResponse.fromJson(response_);
  }

  /// Gets information about backups of AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the backups. When the response contains only
  /// a subset of backups, it includes a `NextToken` value. Use this value in a
  /// subsequent `DescribeBackups` request to get more backups. When you receive
  /// a response with no `NextToken` (or an empty or null value), that means
  /// there are no more backups to get.
  ///
  /// [nextToken]: The `NextToken` value that you received in the previous
  /// response. Use this value to get more backups.
  ///
  /// [maxResults]: The maximum number of backups to return in the response.
  /// When there are more backups than the number you specify, the response
  /// contains a `NextToken` value.
  ///
  /// [filters]: One or more filters to limit the items returned in the
  /// response.
  ///
  /// Use the `backupIds` filter to return only the specified backups. Specify
  /// backups by their backup identifier (ID).
  ///
  /// Use the `sourceBackupIds` filter to return only the backups created from a
  /// source backup. The `sourceBackupID` of a source backup is returned by the
  /// CopyBackupToRegion operation.
  ///
  /// Use the `clusterIds` filter to return only the backups for the specified
  /// clusters. Specify clusters by their cluster identifier (ID).
  ///
  /// Use the `states` filter to return only backups that match the specified
  /// state.
  Future<DescribeBackupsResponse> describeBackups(
      {String nextToken,
      int maxResults,
      Map<String, List<String>> filters,
      bool sortAscending}) async {
    var response_ = await _client.send('DescribeBackups', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortAscending != null) 'SortAscending': sortAscending,
    });
    return DescribeBackupsResponse.fromJson(response_);
  }

  /// Gets information about AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the clusters. When the response contains only
  /// a subset of clusters, it includes a `NextToken` value. Use this value in a
  /// subsequent `DescribeClusters` request to get more clusters. When you
  /// receive a response with no `NextToken` (or an empty or null value), that
  /// means there are no more clusters to get.
  ///
  /// [filters]: One or more filters to limit the items returned in the
  /// response.
  ///
  /// Use the `clusterIds` filter to return only the specified clusters. Specify
  /// clusters by their cluster identifier (ID).
  ///
  /// Use the `vpcIds` filter to return only the clusters in the specified
  /// virtual private clouds (VPCs). Specify VPCs by their VPC identifier (ID).
  ///
  /// Use the `states` filter to return only clusters that match the specified
  /// state.
  ///
  /// [nextToken]: The `NextToken` value that you received in the previous
  /// response. Use this value to get more clusters.
  ///
  /// [maxResults]: The maximum number of clusters to return in the response.
  /// When there are more clusters than the number you specify, the response
  /// contains a `NextToken` value.
  Future<DescribeClustersResponse> describeClusters(
      {Map<String, List<String>> filters,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeClusters', {
      if (filters != null) 'Filters': filters,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeClustersResponse.fromJson(response_);
  }

  /// Claims an AWS CloudHSM cluster by submitting the cluster certificate
  /// issued by your issuing certificate authority (CA) and the CA's root
  /// certificate. Before you can claim a cluster, you must sign the cluster's
  /// certificate signing request (CSR) with your issuing CA. To get the
  /// cluster's CSR, use DescribeClusters.
  ///
  /// [clusterId]: The identifier (ID) of the cluster that you are claiming. To
  /// find the cluster ID, use DescribeClusters.
  ///
  /// [signedCert]: The cluster certificate issued (signed) by your issuing
  /// certificate authority (CA). The certificate must be in PEM format and can
  /// contain a maximum of 5000 characters.
  ///
  /// [trustAnchor]: The issuing certificate of the issuing certificate
  /// authority (CA) that issued (signed) the cluster certificate. This can be a
  /// root (self-signed) certificate or a certificate chain that begins with the
  /// certificate that issued the cluster certificate and ends with a root
  /// certificate. The certificate or certificate chain must be in PEM format
  /// and can contain a maximum of 5000 characters.
  Future<InitializeClusterResponse> initializeCluster(
      {@required String clusterId,
      @required String signedCert,
      @required String trustAnchor}) async {
    var response_ = await _client.send('InitializeCluster', {
      'ClusterId': clusterId,
      'SignedCert': signedCert,
      'TrustAnchor': trustAnchor,
    });
    return InitializeClusterResponse.fromJson(response_);
  }

  /// Gets a list of tags for the specified AWS CloudHSM cluster.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the tags. When the response contains only a
  /// subset of tags, it includes a `NextToken` value. Use this value in a
  /// subsequent `ListTags` request to get more tags. When you receive a
  /// response with no `NextToken` (or an empty or null value), that means there
  /// are no more tags to get.
  ///
  /// [resourceId]: The cluster identifier (ID) for the cluster whose tags you
  /// are getting. To find the cluster ID, use DescribeClusters.
  ///
  /// [nextToken]: The `NextToken` value that you received in the previous
  /// response. Use this value to get more tags.
  ///
  /// [maxResults]: The maximum number of tags to return in the response. When
  /// there are more tags than the number you specify, the response contains a
  /// `NextToken` value.
  Future<ListTagsResponse> listTags(String resourceId,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTags', {
      'ResourceId': resourceId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTagsResponse.fromJson(response_);
  }

  /// Restores a specified AWS CloudHSM backup that is in the `PENDING_DELETION`
  /// state. For more information on deleting a backup, see DeleteBackup.
  ///
  /// [backupId]: The ID of the backup to be restored. To find the ID of a
  /// backup, use the DescribeBackups operation.
  Future<RestoreBackupResponse> restoreBackup(String backupId) async {
    var response_ = await _client.send('RestoreBackup', {
      'BackupId': backupId,
    });
    return RestoreBackupResponse.fromJson(response_);
  }

  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// cluster.
  ///
  /// [resourceId]: The cluster identifier (ID) for the cluster that you are
  /// tagging. To find the cluster ID, use DescribeClusters.
  ///
  /// [tagList]: A list of one or more tags.
  Future<TagResourceResponse> tagResource(
      {@required String resourceId, @required List<Tag> tagList}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceId': resourceId,
      'TagList': tagList,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes the specified tag or tags from the specified AWS CloudHSM cluster.
  ///
  /// [resourceId]: The cluster identifier (ID) for the cluster whose tags you
  /// are removing. To find the cluster ID, use DescribeClusters.
  ///
  /// [tagKeyList]: A list of one or more tag keys for the tags that you are
  /// removing. Specify only the tag keys, not the tag values.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceId, @required List<String> tagKeyList}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceId': resourceId,
      'TagKeyList': tagKeyList,
    });
    return UntagResourceResponse.fromJson(response_);
  }
}

/// Contains information about a backup of an AWS CloudHSM cluster.
class Backup {
  /// The identifier (ID) of the backup.
  final String backupId;

  /// The state of the backup.
  final String backupState;

  /// The identifier (ID) of the cluster that was backed up.
  final String clusterId;

  /// The date and time when the backup was created.
  final DateTime createTimestamp;

  final DateTime copyTimestamp;

  final String sourceRegion;

  final String sourceBackup;

  final String sourceCluster;

  /// The date and time when the backup will be permanently deleted.
  final DateTime deleteTimestamp;

  Backup({
    @required this.backupId,
    this.backupState,
    this.clusterId,
    this.createTimestamp,
    this.copyTimestamp,
    this.sourceRegion,
    this.sourceBackup,
    this.sourceCluster,
    this.deleteTimestamp,
  });
  static Backup fromJson(Map<String, dynamic> json) => Backup(
        backupId: json['BackupId'] as String,
        backupState: json.containsKey('BackupState')
            ? json['BackupState'] as String
            : null,
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        createTimestamp: json.containsKey('CreateTimestamp')
            ? DateTime.parse(json['CreateTimestamp'])
            : null,
        copyTimestamp: json.containsKey('CopyTimestamp')
            ? DateTime.parse(json['CopyTimestamp'])
            : null,
        sourceRegion: json.containsKey('SourceRegion')
            ? json['SourceRegion'] as String
            : null,
        sourceBackup: json.containsKey('SourceBackup')
            ? json['SourceBackup'] as String
            : null,
        sourceCluster: json.containsKey('SourceCluster')
            ? json['SourceCluster'] as String
            : null,
        deleteTimestamp: json.containsKey('DeleteTimestamp')
            ? DateTime.parse(json['DeleteTimestamp'])
            : null,
      );
}

/// Contains one or more certificates or a certificate signing request (CSR).
class Certificates {
  /// The cluster's certificate signing request (CSR). The CSR exists only when
  /// the cluster's state is `UNINITIALIZED`.
  final String clusterCsr;

  /// The HSM certificate issued (signed) by the HSM hardware.
  final String hsmCertificate;

  /// The HSM hardware certificate issued (signed) by AWS CloudHSM.
  final String awsHardwareCertificate;

  /// The HSM hardware certificate issued (signed) by the hardware manufacturer.
  final String manufacturerHardwareCertificate;

  /// The cluster certificate issued (signed) by the issuing certificate
  /// authority (CA) of the cluster's owner.
  final String clusterCertificate;

  Certificates({
    this.clusterCsr,
    this.hsmCertificate,
    this.awsHardwareCertificate,
    this.manufacturerHardwareCertificate,
    this.clusterCertificate,
  });
  static Certificates fromJson(Map<String, dynamic> json) => Certificates(
        clusterCsr: json.containsKey('ClusterCsr')
            ? json['ClusterCsr'] as String
            : null,
        hsmCertificate: json.containsKey('HsmCertificate')
            ? json['HsmCertificate'] as String
            : null,
        awsHardwareCertificate: json.containsKey('AwsHardwareCertificate')
            ? json['AwsHardwareCertificate'] as String
            : null,
        manufacturerHardwareCertificate:
            json.containsKey('ManufacturerHardwareCertificate')
                ? json['ManufacturerHardwareCertificate'] as String
                : null,
        clusterCertificate: json.containsKey('ClusterCertificate')
            ? json['ClusterCertificate'] as String
            : null,
      );
}

/// Contains information about an AWS CloudHSM cluster.
class Cluster {
  /// The cluster's backup policy.
  final String backupPolicy;

  /// The cluster's identifier (ID).
  final String clusterId;

  /// The date and time when the cluster was created.
  final DateTime createTimestamp;

  /// Contains information about the HSMs in the cluster.
  final List<Hsm> hsms;

  /// The type of HSM that the cluster contains.
  final String hsmType;

  /// The default password for the cluster's Pre-Crypto Officer (PRECO) user.
  final String preCoPassword;

  /// The identifier (ID) of the cluster's security group.
  final String securityGroup;

  /// The identifier (ID) of the backup used to create the cluster. This value
  /// exists only when the cluster was created from a backup.
  final String sourceBackupId;

  /// The cluster's state.
  final String state;

  /// A description of the cluster's state.
  final String stateMessage;

  /// A map of the cluster's subnets and their corresponding Availability Zones.
  final Map<String, String> subnetMapping;

  /// The identifier (ID) of the virtual private cloud (VPC) that contains the
  /// cluster.
  final String vpcId;

  /// Contains one or more certificates or a certificate signing request (CSR).
  final Certificates certificates;

  Cluster({
    this.backupPolicy,
    this.clusterId,
    this.createTimestamp,
    this.hsms,
    this.hsmType,
    this.preCoPassword,
    this.securityGroup,
    this.sourceBackupId,
    this.state,
    this.stateMessage,
    this.subnetMapping,
    this.vpcId,
    this.certificates,
  });
  static Cluster fromJson(Map<String, dynamic> json) => Cluster(
        backupPolicy: json.containsKey('BackupPolicy')
            ? json['BackupPolicy'] as String
            : null,
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        createTimestamp: json.containsKey('CreateTimestamp')
            ? DateTime.parse(json['CreateTimestamp'])
            : null,
        hsms: json.containsKey('Hsms')
            ? (json['Hsms'] as List).map((e) => Hsm.fromJson(e)).toList()
            : null,
        hsmType: json.containsKey('HsmType') ? json['HsmType'] as String : null,
        preCoPassword: json.containsKey('PreCoPassword')
            ? json['PreCoPassword'] as String
            : null,
        securityGroup: json.containsKey('SecurityGroup')
            ? json['SecurityGroup'] as String
            : null,
        sourceBackupId: json.containsKey('SourceBackupId')
            ? json['SourceBackupId'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        stateMessage: json.containsKey('StateMessage')
            ? json['StateMessage'] as String
            : null,
        subnetMapping: json.containsKey('SubnetMapping')
            ? (json['SubnetMapping'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        certificates: json.containsKey('Certificates')
            ? Certificates.fromJson(json['Certificates'])
            : null,
      );
}

class CopyBackupToRegionResponse {
  /// Information on the backup that will be copied to the destination region,
  /// including CreateTimestamp, SourceBackup, SourceCluster, and Source Region.
  /// CreateTimestamp of the destination backup will be the same as that of the
  /// source backup.
  ///
  /// You will need to use the `sourceBackupID` returned in this operation to
  /// use the DescribeBackups operation on the backup that will be copied to the
  /// destination region.
  final DestinationBackup destinationBackup;

  CopyBackupToRegionResponse({
    this.destinationBackup,
  });
  static CopyBackupToRegionResponse fromJson(Map<String, dynamic> json) =>
      CopyBackupToRegionResponse(
        destinationBackup: json.containsKey('DestinationBackup')
            ? DestinationBackup.fromJson(json['DestinationBackup'])
            : null,
      );
}

class CreateClusterResponse {
  /// Information about the cluster that was created.
  final Cluster cluster;

  CreateClusterResponse({
    this.cluster,
  });
  static CreateClusterResponse fromJson(Map<String, dynamic> json) =>
      CreateClusterResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class CreateHsmResponse {
  /// Information about the HSM that was created.
  final Hsm hsm;

  CreateHsmResponse({
    this.hsm,
  });
  static CreateHsmResponse fromJson(Map<String, dynamic> json) =>
      CreateHsmResponse(
        hsm: json.containsKey('Hsm') ? Hsm.fromJson(json['Hsm']) : null,
      );
}

class DeleteBackupResponse {
  /// Information on the `Backup` object deleted.
  final Backup backup;

  DeleteBackupResponse({
    this.backup,
  });
  static DeleteBackupResponse fromJson(Map<String, dynamic> json) =>
      DeleteBackupResponse(
        backup:
            json.containsKey('Backup') ? Backup.fromJson(json['Backup']) : null,
      );
}

class DeleteClusterResponse {
  /// Information about the cluster that was deleted.
  final Cluster cluster;

  DeleteClusterResponse({
    this.cluster,
  });
  static DeleteClusterResponse fromJson(Map<String, dynamic> json) =>
      DeleteClusterResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class DeleteHsmResponse {
  /// The identifier (ID) of the HSM that was deleted.
  final String hsmId;

  DeleteHsmResponse({
    this.hsmId,
  });
  static DeleteHsmResponse fromJson(Map<String, dynamic> json) =>
      DeleteHsmResponse(
        hsmId: json.containsKey('HsmId') ? json['HsmId'] as String : null,
      );
}

class DescribeBackupsResponse {
  /// A list of backups.
  final List<Backup> backups;

  /// An opaque string that indicates that the response contains only a subset
  /// of backups. Use this value in a subsequent `DescribeBackups` request to
  /// get more backups.
  final String nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });
  static DescribeBackupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeBackupsResponse(
        backups: json.containsKey('Backups')
            ? (json['Backups'] as List).map((e) => Backup.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeClustersResponse {
  /// A list of clusters.
  final List<Cluster> clusters;

  /// An opaque string that indicates that the response contains only a subset
  /// of clusters. Use this value in a subsequent `DescribeClusters` request to
  /// get more clusters.
  final String nextToken;

  DescribeClustersResponse({
    this.clusters,
    this.nextToken,
  });
  static DescribeClustersResponse fromJson(Map<String, dynamic> json) =>
      DescribeClustersResponse(
        clusters: json.containsKey('Clusters')
            ? (json['Clusters'] as List)
                .map((e) => Cluster.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DestinationBackup {
  final DateTime createTimestamp;

  final String sourceRegion;

  final String sourceBackup;

  final String sourceCluster;

  DestinationBackup({
    this.createTimestamp,
    this.sourceRegion,
    this.sourceBackup,
    this.sourceCluster,
  });
  static DestinationBackup fromJson(Map<String, dynamic> json) =>
      DestinationBackup(
        createTimestamp: json.containsKey('CreateTimestamp')
            ? DateTime.parse(json['CreateTimestamp'])
            : null,
        sourceRegion: json.containsKey('SourceRegion')
            ? json['SourceRegion'] as String
            : null,
        sourceBackup: json.containsKey('SourceBackup')
            ? json['SourceBackup'] as String
            : null,
        sourceCluster: json.containsKey('SourceCluster')
            ? json['SourceCluster'] as String
            : null,
      );
}

/// Contains information about a hardware security module (HSM) in an AWS
/// CloudHSM cluster.
class Hsm {
  /// The Availability Zone that contains the HSM.
  final String availabilityZone;

  /// The identifier (ID) of the cluster that contains the HSM.
  final String clusterId;

  /// The subnet that contains the HSM's elastic network interface (ENI).
  final String subnetId;

  /// The identifier (ID) of the HSM's elastic network interface (ENI).
  final String eniId;

  /// The IP address of the HSM's elastic network interface (ENI).
  final String eniIp;

  /// The HSM's identifier (ID).
  final String hsmId;

  /// The HSM's state.
  final String state;

  /// A description of the HSM's state.
  final String stateMessage;

  Hsm({
    this.availabilityZone,
    this.clusterId,
    this.subnetId,
    this.eniId,
    this.eniIp,
    @required this.hsmId,
    this.state,
    this.stateMessage,
  });
  static Hsm fromJson(Map<String, dynamic> json) => Hsm(
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        eniId: json.containsKey('EniId') ? json['EniId'] as String : null,
        eniIp: json.containsKey('EniIp') ? json['EniIp'] as String : null,
        hsmId: json['HsmId'] as String,
        state: json.containsKey('State') ? json['State'] as String : null,
        stateMessage: json.containsKey('StateMessage')
            ? json['StateMessage'] as String
            : null,
      );
}

class InitializeClusterResponse {
  /// The cluster's state.
  final String state;

  /// A description of the cluster's state.
  final String stateMessage;

  InitializeClusterResponse({
    this.state,
    this.stateMessage,
  });
  static InitializeClusterResponse fromJson(Map<String, dynamic> json) =>
      InitializeClusterResponse(
        state: json.containsKey('State') ? json['State'] as String : null,
        stateMessage: json.containsKey('StateMessage')
            ? json['StateMessage'] as String
            : null,
      );
}

class ListTagsResponse {
  /// A list of tags.
  final List<Tag> tagList;

  /// An opaque string that indicates that the response contains only a subset
  /// of tags. Use this value in a subsequent `ListTags` request to get more
  /// tags.
  final String nextToken;

  ListTagsResponse({
    @required this.tagList,
    this.nextToken,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse(
        tagList: (json['TagList'] as List).map((e) => Tag.fromJson(e)).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class RestoreBackupResponse {
  /// Information on the `Backup` object created.
  final Backup backup;

  RestoreBackupResponse({
    this.backup,
  });
  static RestoreBackupResponse fromJson(Map<String, dynamic> json) =>
      RestoreBackupResponse(
        backup:
            json.containsKey('Backup') ? Backup.fromJson(json['Backup']) : null,
      );
}

/// Contains a tag. A tag is a key-value pair.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}
