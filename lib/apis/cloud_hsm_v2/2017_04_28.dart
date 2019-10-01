import 'package:meta/meta.dart';

/// For more information about AWS CloudHSM, see [AWS
/// CloudHSM](http://aws.amazon.com/cloudhsm/) and the [AWS CloudHSM User
/// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/).
class CloudHsmV2Api {
  /// Copy an AWS CloudHSM cluster backup to a different region.
  Future<void> copyBackupToRegion(
      {@required String destinationRegion, @required String backupId}) async {}

  /// Creates a new AWS CloudHSM cluster.
  Future<void> createCluster(
      {@required List<String> subnetIds,
      @required String hsmType,
      String sourceBackupId}) async {}

  /// Creates a new hardware security module (HSM) in the specified AWS CloudHSM
  /// cluster.
  Future<void> createHsm(
      {@required String clusterId,
      @required String availabilityZone,
      String ipAddress}) async {}

  /// Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7
  /// days after the DeleteBackup request. For more information on restoring a
  /// backup, see RestoreBackup
  Future<void> deleteBackup(String backupId) async {}

  /// Deletes the specified AWS CloudHSM cluster. Before you can delete a
  /// cluster, you must delete all HSMs in the cluster. To see if the cluster
  /// contains any HSMs, use DescribeClusters. To delete an HSM, use DeleteHsm.
  Future<void> deleteCluster(String clusterId) async {}

  /// Deletes the specified HSM. To specify an HSM, you can use its identifier
  /// (ID), the IP address of the HSM's elastic network interface (ENI), or the
  /// ID of the HSM's ENI. You need to specify only one of these values. To find
  /// these values, use DescribeClusters.
  Future<void> deleteHsm(String clusterId,
      {String hsmId, String eniId, String eniIp}) async {}

  /// Gets information about backups of AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the backups. When the response contains only
  /// a subset of backups, it includes a `NextToken` value. Use this value in a
  /// subsequent `DescribeBackups` request to get more backups. When you receive
  /// a response with no `NextToken` (or an empty or null value), that means
  /// there are no more backups to get.
  Future<void> describeBackups(
      {String nextToken,
      int maxResults,
      Map<String, List<String>> filters,
      bool sortAscending}) async {}

  /// Gets information about AWS CloudHSM clusters.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the clusters. When the response contains only
  /// a subset of clusters, it includes a `NextToken` value. Use this value in a
  /// subsequent `DescribeClusters` request to get more clusters. When you
  /// receive a response with no `NextToken` (or an empty or null value), that
  /// means there are no more clusters to get.
  Future<void> describeClusters(
      {Map<String, List<String>> filters,
      String nextToken,
      int maxResults}) async {}

  /// Claims an AWS CloudHSM cluster by submitting the cluster certificate
  /// issued by your issuing certificate authority (CA) and the CA's root
  /// certificate. Before you can claim a cluster, you must sign the cluster's
  /// certificate signing request (CSR) with your issuing CA. To get the
  /// cluster's CSR, use DescribeClusters.
  Future<void> initializeCluster(
      {@required String clusterId,
      @required String signedCert,
      @required String trustAnchor}) async {}

  /// Gets a list of tags for the specified AWS CloudHSM cluster.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the tags. When the response contains only a
  /// subset of tags, it includes a `NextToken` value. Use this value in a
  /// subsequent `ListTags` request to get more tags. When you receive a
  /// response with no `NextToken` (or an empty or null value), that means there
  /// are no more tags to get.
  Future<void> listTags(String resourceId,
      {String nextToken, int maxResults}) async {}

  /// Restores a specified AWS CloudHSM backup that is in the `PENDING_DELETION`
  /// state. For more information on deleting a backup, see DeleteBackup.
  Future<void> restoreBackup(String backupId) async {}

  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// cluster.
  Future<void> tagResource(
      {@required String resourceId, @required List<Tag> tagList}) async {}

  /// Removes the specified tag or tags from the specified AWS CloudHSM cluster.
  Future<void> untagResource(
      {@required String resourceId, @required List<String> tagKeyList}) async {}
}

class Backup {}

class Certificates {}

class Cluster {}

class CopyBackupToRegionResponse {}

class CreateClusterResponse {}

class CreateHsmResponse {}

class DeleteBackupResponse {}

class DeleteClusterResponse {}

class DeleteHsmResponse {}

class DescribeBackupsResponse {}

class DescribeClustersResponse {}

class DestinationBackup {}

class Hsm {}

class InitializeClusterResponse {}

class ListTagsResponse {}

class RestoreBackupResponse {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}
