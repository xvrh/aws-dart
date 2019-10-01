import 'package:meta/meta.dart';

/// Amazon Elasticsearch Configuration Service
///
/// Use the Amazon Elasticsearch configuration API to create, configure, and
/// manage Elasticsearch domains.
///
/// The endpoint for configuration service requests is region-specific:
/// es._region_.amazonaws.com. For example, es.us-east-1.amazonaws.com. For a
/// current list of supported regions and endpoints, see [Regions and
/// Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticsearch-service-regions).
class ElasticsearchServiceApi {
  /// Attaches tags to an existing Elasticsearch domain. Tags are a set of
  /// case-sensitive key value pairs. An Elasticsearch domain may have up to 10
  /// tags. See  [Tagging Amazon Elasticsearch Service Domains for more
  /// information.](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging)
  Future<void> addTags(
      {@required String arn, @required List<Tag> tagList}) async {}

  /// Cancels a scheduled service software update for an Amazon ES domain. You
  /// can only perform this operation before the `AutomatedUpdateDate` and when
  /// the `UpdateStatus` is in the `PENDING_UPDATE` state.
  Future<void> cancelElasticsearchServiceSoftwareUpdate(
      String domainName) async {}

  /// Creates a new Elasticsearch domain. For more information, see [Creating
  /// Elasticsearch
  /// Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains)
  /// in the _Amazon Elasticsearch Service Developer Guide_.
  Future<void> createElasticsearchDomain(String domainName,
      {String elasticsearchVersion,
      ElasticsearchClusterConfig elasticsearchClusterConfig,
      EbsOptions ebsOptions,
      String accessPolicies,
      SnapshotOptions snapshotOptions,
      VpcOptions vpcOptions,
      CognitoOptions cognitoOptions,
      EncryptionAtRestOptions encryptionAtRestOptions,
      NodeToNodeEncryptionOptions nodeToNodeEncryptionOptions,
      Map<String, String> advancedOptions,
      Map<String, LogPublishingOption> logPublishingOptions}) async {}

  /// Permanently deletes the specified Elasticsearch domain and all of its
  /// data. Once a domain is deleted, it cannot be recovered.
  Future<void> deleteElasticsearchDomain(String domainName) async {}

  /// Deletes the service-linked role that Elasticsearch Service uses to manage
  /// and maintain VPC domains. Role deletion will fail if any existing VPC
  /// domains use the role. You must delete any such Elasticsearch domains
  /// before deleting the role. See [Deleting Elasticsearch Service
  /// Role](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr)
  /// in _VPC Endpoints for Amazon Elasticsearch Service Domains_.
  Future<void> deleteElasticsearchServiceRole() async {}

  /// Returns domain configuration information about the specified Elasticsearch
  /// domain, including the domain ID, domain endpoint, and domain ARN.
  Future<void> describeElasticsearchDomain(String domainName) async {}

  /// Provides cluster configuration information about the specified
  /// Elasticsearch domain, such as the state, creation date, update version,
  /// and update date for cluster options.
  Future<void> describeElasticsearchDomainConfig(String domainName) async {}

  /// Returns domain configuration information about the specified Elasticsearch
  /// domains, including the domain ID, domain endpoint, and domain ARN.
  Future<void> describeElasticsearchDomains(List<String> domainNames) async {}

  ///  Describe Elasticsearch Limits for a given InstanceType and
  /// ElasticsearchVersion. When modifying existing Domain, specify the
  /// `DomainName`  to know what Limits are supported for modifying.
  Future<void> describeElasticsearchInstanceTypeLimits(
      {String domainName,
      @required String instanceType,
      @required String elasticsearchVersion}) async {}

  /// Lists available reserved Elasticsearch instance offerings.
  Future<void> describeReservedElasticsearchInstanceOfferings(
      {String reservedElasticsearchInstanceOfferingId,
      int maxResults,
      String nextToken}) async {}

  /// Returns information about reserved Elasticsearch instances for this
  /// account.
  Future<void> describeReservedElasticsearchInstances(
      {String reservedElasticsearchInstanceId,
      int maxResults,
      String nextToken}) async {}

  ///  Returns a list of upgrade compatible Elastisearch versions. You can
  /// optionally pass a  `DomainName`  to get all upgrade compatible
  /// Elasticsearch versions for that specific domain.
  Future<void> getCompatibleElasticsearchVersions({String domainName}) async {}

  /// Retrieves the complete history of the last 10 upgrades that were performed
  /// on the domain.
  Future<void> getUpgradeHistory(String domainName,
      {int maxResults, String nextToken}) async {}

  /// Retrieves the latest status of the last upgrade or upgrade eligibility
  /// check that was performed on the domain.
  Future<void> getUpgradeStatus(String domainName) async {}

  /// Returns the name of all Elasticsearch domains owned by the current user's
  /// account.
  Future<void> listDomainNames() async {}

  /// List all Elasticsearch instance types that are supported for given
  /// ElasticsearchVersion
  Future<void> listElasticsearchInstanceTypes(String elasticsearchVersion,
      {String domainName, int maxResults, String nextToken}) async {}

  /// List all supported Elasticsearch versions
  Future<void> listElasticsearchVersions(
      {int maxResults, String nextToken}) async {}

  /// Returns all tags for the given Elasticsearch domain.
  Future<void> listTags(String arn) async {}

  /// Allows you to purchase reserved Elasticsearch instances.
  Future<void> purchaseReservedElasticsearchInstanceOffering(
      {@required String reservedElasticsearchInstanceOfferingId,
      @required String reservationName,
      int instanceCount}) async {}

  /// Removes the specified set of tags from the specified Elasticsearch domain.
  Future<void> removeTags(
      {@required String arn, @required List<String> tagKeys}) async {}

  /// Schedules a service software update for an Amazon ES domain.
  Future<void> startElasticsearchServiceSoftwareUpdate(
      String domainName) async {}

  /// Modifies the cluster configuration of the specified Elasticsearch domain,
  /// setting as setting the instance type and the number of instances.
  Future<void> updateElasticsearchDomainConfig(String domainName,
      {ElasticsearchClusterConfig elasticsearchClusterConfig,
      EbsOptions ebsOptions,
      SnapshotOptions snapshotOptions,
      VpcOptions vpcOptions,
      CognitoOptions cognitoOptions,
      Map<String, String> advancedOptions,
      String accessPolicies,
      Map<String, LogPublishingOption> logPublishingOptions}) async {}

  /// Allows you to either upgrade your domain or perform an Upgrade eligibility
  /// check to a compatible Elasticsearch version.
  Future<void> upgradeElasticsearchDomain(
      {@required String domainName,
      @required String targetVersion,
      bool performCheckOnly}) async {}
}

class AccessPoliciesStatus {}

class AdditionalLimit {}

class AdvancedOptionsStatus {}

class CancelElasticsearchServiceSoftwareUpdateResponse {}

class CognitoOptions {}

class CognitoOptionsStatus {}

class CompatibleVersionsMap {}

class CreateElasticsearchDomainResponse {}

class DeleteElasticsearchDomainResponse {}

class DescribeElasticsearchDomainConfigResponse {}

class DescribeElasticsearchDomainResponse {}

class DescribeElasticsearchDomainsResponse {}

class DescribeElasticsearchInstanceTypeLimitsResponse {}

class DescribeReservedElasticsearchInstanceOfferingsResponse {}

class DescribeReservedElasticsearchInstancesResponse {}

class DomainInfo {}

class EbsOptions {}

class EbsOptionsStatus {}

class ElasticsearchClusterConfig {}

class ElasticsearchClusterConfigStatus {}

class ElasticsearchDomainConfig {}

class ElasticsearchDomainStatus {}

class ElasticsearchVersionStatus {}

class EncryptionAtRestOptions {}

class EncryptionAtRestOptionsStatus {}

class GetCompatibleElasticsearchVersionsResponse {}

class GetUpgradeHistoryResponse {}

class GetUpgradeStatusResponse {}

class InstanceCountLimits {}

class InstanceLimits {}

class Limits {}

class ListDomainNamesResponse {}

class ListElasticsearchInstanceTypesResponse {}

class ListElasticsearchVersionsResponse {}

class ListTagsResponse {}

class LogPublishingOption {}

class LogPublishingOptionsStatus {}

class NodeToNodeEncryptionOptions {}

class NodeToNodeEncryptionOptionsStatus {}

class OptionStatus {}

class PurchaseReservedElasticsearchInstanceOfferingResponse {}

class RecurringCharge {}

class ReservedElasticsearchInstance {}

class ReservedElasticsearchInstanceOffering {}

class ServiceSoftwareOptions {}

class SnapshotOptions {}

class SnapshotOptionsStatus {}

class StartElasticsearchServiceSoftwareUpdateResponse {}

class StorageType {}

class StorageTypeLimit {}

class Tag {}

class UpdateElasticsearchDomainConfigResponse {}

class UpgradeElasticsearchDomainResponse {}

class UpgradeHistory {}

class UpgradeStepItem {}

class VpcDerivedInfo {}

class VpcDerivedInfoStatus {}

class VpcOptions {}

class ZoneAwarenessConfig {}
