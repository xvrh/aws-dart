import 'package:meta/meta.dart';

/// Amazon Elasticsearch Configuration Service
///
/// Use the Amazon Elasticsearch configuration API to create, configure, and
/// manage Elasticsearch domains.
///
/// The endpoint for configuration service requests is region-specific:
/// es._region_.amazonaws.com. For example, es.us-east-1.amazonaws.com. For a
/// current list of supported regions and endpoints, see
/// [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticsearch-service-regions).
class ElasticsearchServiceApi {
  /// Attaches tags to an existing Elasticsearch domain. Tags are a set of
  /// case-sensitive key value pairs. An Elasticsearch domain may have up to 10
  /// tags. See
  /// [Tagging Amazon Elasticsearch Service Domains for more information.](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging)
  ///
  /// [arn]:  Specify the `ARN` for which you want to add the tags.
  ///
  /// [tagList]:  List of `Tag` that need to be added for the Elasticsearch
  /// domain.
  Future<void> addTags(
      {@required String arn, @required List<Tag> tagList}) async {}

  /// Cancels a scheduled service software update for an Amazon ES domain. You
  /// can only perform this operation before the `AutomatedUpdateDate` and when
  /// the `UpdateStatus` is in the `PENDING_UPDATE` state.
  ///
  /// [domainName]: The name of the domain that you want to stop the latest
  /// service software update on.
  Future<CancelElasticsearchServiceSoftwareUpdateResponse>
      cancelElasticsearchServiceSoftwareUpdate(String domainName) async {
    return CancelElasticsearchServiceSoftwareUpdateResponse.fromJson({});
  }

  /// Creates a new Elasticsearch domain. For more information, see
  /// [Creating Elasticsearch Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains)
  /// in the _Amazon Elasticsearch Service Developer Guide_.
  ///
  /// [domainName]: The name of the Elasticsearch domain that you are creating.
  /// Domain names are unique across the domains owned by an account within an
  /// AWS region. Domain names must start with a letter or number and can
  /// contain the following characters: a-z (lowercase), 0-9, and - (hyphen).
  ///
  /// [elasticsearchVersion]: String of format X.Y to specify version for the
  /// Elasticsearch domain eg. "1.5" or "2.3". For more information, see
  /// [Creating Elasticsearch Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains)
  /// in the _Amazon Elasticsearch Service Developer Guide_.
  ///
  /// [elasticsearchClusterConfig]: Configuration options for an Elasticsearch
  /// domain. Specifies the instance type and number of instances in the domain
  /// cluster.
  ///
  /// [ebsOptions]: Options to enable, disable and specify the type and size of
  /// EBS storage volumes.
  ///
  /// [accessPolicies]:  IAM access policy as a JSON-formatted string.
  ///
  /// [snapshotOptions]: Option to set time, in UTC format, of the daily
  /// automated snapshot. Default value is 0 hours.
  ///
  /// [vpcOptions]: Options to specify the subnets and security groups for VPC
  /// endpoint. For more information, see
  /// [Creating a VPC](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc)
  /// in _VPC Endpoints for Amazon Elasticsearch Service Domains_
  ///
  /// [cognitoOptions]: Options to specify the Cognito user and identity pools
  /// for Kibana authentication. For more information, see
  /// [Amazon Cognito Authentication for Kibana](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
  ///
  /// [encryptionAtRestOptions]: Specifies the Encryption At Rest Options.
  ///
  /// [nodeToNodeEncryptionOptions]: Specifies the NodeToNodeEncryptionOptions.
  ///
  /// [advancedOptions]:  Option to allow references to indices in an HTTP
  /// request body. Must be `false` when configuring access to individual
  /// sub-resources. By default, the value is `true`. See
  /// [Configuration Advanced Options](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options)
  /// for more information.
  ///
  /// [logPublishingOptions]: Map of `LogType` and `LogPublishingOption`, each
  /// containing options to publish a given type of Elasticsearch log.
  Future<CreateElasticsearchDomainResponse> createElasticsearchDomain(
      String domainName,
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
      Map<String, LogPublishingOption> logPublishingOptions}) async {
    return CreateElasticsearchDomainResponse.fromJson({});
  }

  /// Permanently deletes the specified Elasticsearch domain and all of its
  /// data. Once a domain is deleted, it cannot be recovered.
  ///
  /// [domainName]: The name of the Elasticsearch domain that you want to
  /// permanently delete.
  Future<DeleteElasticsearchDomainResponse> deleteElasticsearchDomain(
      String domainName) async {
    return DeleteElasticsearchDomainResponse.fromJson({});
  }

  /// Deletes the service-linked role that Elasticsearch Service uses to manage
  /// and maintain VPC domains. Role deletion will fail if any existing VPC
  /// domains use the role. You must delete any such Elasticsearch domains
  /// before deleting the role. See
  /// [Deleting Elasticsearch Service Role](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr)
  /// in _VPC Endpoints for Amazon Elasticsearch Service Domains_.
  Future<void> deleteElasticsearchServiceRole() async {}

  /// Returns domain configuration information about the specified Elasticsearch
  /// domain, including the domain ID, domain endpoint, and domain ARN.
  ///
  /// [domainName]: The name of the Elasticsearch domain for which you want
  /// information.
  Future<DescribeElasticsearchDomainResponse> describeElasticsearchDomain(
      String domainName) async {
    return DescribeElasticsearchDomainResponse.fromJson({});
  }

  /// Provides cluster configuration information about the specified
  /// Elasticsearch domain, such as the state, creation date, update version,
  /// and update date for cluster options.
  ///
  /// [domainName]: The Elasticsearch domain that you want to get information
  /// about.
  Future<DescribeElasticsearchDomainConfigResponse>
      describeElasticsearchDomainConfig(String domainName) async {
    return DescribeElasticsearchDomainConfigResponse.fromJson({});
  }

  /// Returns domain configuration information about the specified Elasticsearch
  /// domains, including the domain ID, domain endpoint, and domain ARN.
  ///
  /// [domainNames]: The Elasticsearch domains for which you want information.
  Future<DescribeElasticsearchDomainsResponse> describeElasticsearchDomains(
      List<String> domainNames) async {
    return DescribeElasticsearchDomainsResponse.fromJson({});
  }

  ///  Describe Elasticsearch Limits for a given InstanceType and
  /// ElasticsearchVersion. When modifying existing Domain, specify the
  /// `DomainName`  to know what Limits are supported for modifying.
  ///
  /// [domainName]:  DomainName represents the name of the Domain that we are
  /// trying to modify. This should be present only if we are querying for
  /// Elasticsearch  `Limits`  for existing domain.
  ///
  /// [instanceType]:  The instance type for an Elasticsearch cluster for which
  /// Elasticsearch  `Limits`  are needed.
  ///
  /// [elasticsearchVersion]:  Version of Elasticsearch for which  `Limits`  are
  /// needed.
  Future<DescribeElasticsearchInstanceTypeLimitsResponse>
      describeElasticsearchInstanceTypeLimits(
          {String domainName,
          @required String instanceType,
          @required String elasticsearchVersion}) async {
    return DescribeElasticsearchInstanceTypeLimitsResponse.fromJson({});
  }

  /// Lists available reserved Elasticsearch instance offerings.
  ///
  /// [reservedElasticsearchInstanceOfferingId]: The offering identifier filter
  /// value. Use this parameter to show only the available offering that matches
  /// the specified reservation identifier.
  ///
  /// [maxResults]: Set this value to limit the number of results returned. If
  /// not specified, defaults to 100.
  ///
  /// [nextToken]: NextToken should be sent in case if earlier API call produced
  /// result containing NextToken. It is used for pagination.
  Future<DescribeReservedElasticsearchInstanceOfferingsResponse>
      describeReservedElasticsearchInstanceOfferings(
          {String reservedElasticsearchInstanceOfferingId,
          int maxResults,
          String nextToken}) async {
    return DescribeReservedElasticsearchInstanceOfferingsResponse.fromJson({});
  }

  /// Returns information about reserved Elasticsearch instances for this
  /// account.
  ///
  /// [reservedElasticsearchInstanceId]: The reserved instance identifier filter
  /// value. Use this parameter to show only the reservation that matches the
  /// specified reserved Elasticsearch instance ID.
  ///
  /// [maxResults]: Set this value to limit the number of results returned. If
  /// not specified, defaults to 100.
  ///
  /// [nextToken]: NextToken should be sent in case if earlier API call produced
  /// result containing NextToken. It is used for pagination.
  Future<DescribeReservedElasticsearchInstancesResponse>
      describeReservedElasticsearchInstances(
          {String reservedElasticsearchInstanceId,
          int maxResults,
          String nextToken}) async {
    return DescribeReservedElasticsearchInstancesResponse.fromJson({});
  }

  ///  Returns a list of upgrade compatible Elastisearch versions. You can
  /// optionally pass a  `DomainName`  to get all upgrade compatible
  /// Elasticsearch versions for that specific domain.
  Future<GetCompatibleElasticsearchVersionsResponse>
      getCompatibleElasticsearchVersions({String domainName}) async {
    return GetCompatibleElasticsearchVersionsResponse.fromJson({});
  }

  /// Retrieves the complete history of the last 10 upgrades that were performed
  /// on the domain.
  Future<GetUpgradeHistoryResponse> getUpgradeHistory(String domainName,
      {int maxResults, String nextToken}) async {
    return GetUpgradeHistoryResponse.fromJson({});
  }

  /// Retrieves the latest status of the last upgrade or upgrade eligibility
  /// check that was performed on the domain.
  Future<GetUpgradeStatusResponse> getUpgradeStatus(String domainName) async {
    return GetUpgradeStatusResponse.fromJson({});
  }

  /// Returns the name of all Elasticsearch domains owned by the current user's
  /// account.
  Future<ListDomainNamesResponse> listDomainNames() async {
    return ListDomainNamesResponse.fromJson({});
  }

  /// List all Elasticsearch instance types that are supported for given
  /// ElasticsearchVersion
  ///
  /// [elasticsearchVersion]: Version of Elasticsearch for which list of
  /// supported elasticsearch instance types are needed.
  ///
  /// [domainName]: DomainName represents the name of the Domain that we are
  /// trying to modify. This should be present only if we are querying for list
  /// of available Elasticsearch instance types when modifying existing domain.
  ///
  /// [maxResults]:  Set this value to limit the number of results returned.
  /// Value provided must be greater than 30 else it wont be honored.
  ///
  /// [nextToken]: NextToken should be sent in case if earlier API call produced
  /// result containing NextToken. It is used for pagination.
  Future<ListElasticsearchInstanceTypesResponse> listElasticsearchInstanceTypes(
      String elasticsearchVersion,
      {String domainName,
      int maxResults,
      String nextToken}) async {
    return ListElasticsearchInstanceTypesResponse.fromJson({});
  }

  /// List all supported Elasticsearch versions
  ///
  /// [maxResults]:  Set this value to limit the number of results returned.
  /// Value provided must be greater than 10 else it wont be honored.
  Future<ListElasticsearchVersionsResponse> listElasticsearchVersions(
      {int maxResults, String nextToken}) async {
    return ListElasticsearchVersionsResponse.fromJson({});
  }

  /// Returns all tags for the given Elasticsearch domain.
  ///
  /// [arn]:  Specify the `ARN` for the Elasticsearch domain to which the tags
  /// are attached that you want to view.
  Future<ListTagsResponse> listTags(String arn) async {
    return ListTagsResponse.fromJson({});
  }

  /// Allows you to purchase reserved Elasticsearch instances.
  ///
  /// [reservedElasticsearchInstanceOfferingId]: The ID of the reserved
  /// Elasticsearch instance offering to purchase.
  ///
  /// [reservationName]: A customer-specified identifier to track this
  /// reservation.
  ///
  /// [instanceCount]: The number of Elasticsearch instances to reserve.
  Future<PurchaseReservedElasticsearchInstanceOfferingResponse>
      purchaseReservedElasticsearchInstanceOffering(
          {@required String reservedElasticsearchInstanceOfferingId,
          @required String reservationName,
          int instanceCount}) async {
    return PurchaseReservedElasticsearchInstanceOfferingResponse.fromJson({});
  }

  /// Removes the specified set of tags from the specified Elasticsearch domain.
  ///
  /// [arn]: Specifies the `ARN` for the Elasticsearch domain from which you
  /// want to delete the specified tags.
  ///
  /// [tagKeys]: Specifies the `TagKey` list which you want to remove from the
  /// Elasticsearch domain.
  Future<void> removeTags(
      {@required String arn, @required List<String> tagKeys}) async {}

  /// Schedules a service software update for an Amazon ES domain.
  ///
  /// [domainName]: The name of the domain that you want to update to the latest
  /// service software.
  Future<StartElasticsearchServiceSoftwareUpdateResponse>
      startElasticsearchServiceSoftwareUpdate(String domainName) async {
    return StartElasticsearchServiceSoftwareUpdateResponse.fromJson({});
  }

  /// Modifies the cluster configuration of the specified Elasticsearch domain,
  /// setting as setting the instance type and the number of instances.
  ///
  /// [domainName]: The name of the Elasticsearch domain that you are updating.
  ///
  /// [elasticsearchClusterConfig]: The type and number of instances to
  /// instantiate for the domain cluster.
  ///
  /// [ebsOptions]: Specify the type and size of the EBS volume that you want to
  /// use.
  ///
  /// [snapshotOptions]: Option to set the time, in UTC format, for the daily
  /// automated snapshot. Default value is `0` hours.
  ///
  /// [vpcOptions]: Options to specify the subnets and security groups for VPC
  /// endpoint. For more information, see
  /// [Creating a VPC](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc)
  /// in _VPC Endpoints for Amazon Elasticsearch Service Domains_
  ///
  /// [cognitoOptions]: Options to specify the Cognito user and identity pools
  /// for Kibana authentication. For more information, see
  /// [Amazon Cognito Authentication for Kibana](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
  ///
  /// [advancedOptions]: Modifies the advanced option to allow references to
  /// indices in an HTTP request body. Must be `false` when configuring access
  /// to individual sub-resources. By default, the value is `true`. See
  /// [Configuration Advanced Options](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options)
  /// for more information.
  ///
  /// [accessPolicies]: IAM access policy as a JSON-formatted string.
  ///
  /// [logPublishingOptions]: Map of `LogType` and `LogPublishingOption`, each
  /// containing options to publish a given type of Elasticsearch log.
  Future<UpdateElasticsearchDomainConfigResponse>
      updateElasticsearchDomainConfig(String domainName,
          {ElasticsearchClusterConfig elasticsearchClusterConfig,
          EbsOptions ebsOptions,
          SnapshotOptions snapshotOptions,
          VpcOptions vpcOptions,
          CognitoOptions cognitoOptions,
          Map<String, String> advancedOptions,
          String accessPolicies,
          Map<String, LogPublishingOption> logPublishingOptions}) async {
    return UpdateElasticsearchDomainConfigResponse.fromJson({});
  }

  /// Allows you to either upgrade your domain or perform an Upgrade eligibility
  /// check to a compatible Elasticsearch version.
  ///
  /// [targetVersion]: The version of Elasticsearch that you intend to upgrade
  /// the domain to.
  ///
  /// [performCheckOnly]:  This flag, when set to True, indicates that an
  /// Upgrade Eligibility Check needs to be performed. This will not actually
  /// perform the Upgrade.
  Future<UpgradeElasticsearchDomainResponse> upgradeElasticsearchDomain(
      {@required String domainName,
      @required String targetVersion,
      bool performCheckOnly}) async {
    return UpgradeElasticsearchDomainResponse.fromJson({});
  }
}

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
class AccessPoliciesStatus {
  /// The access policy configured for the Elasticsearch domain. Access policies
  /// may be resource-based, IP-based, or IAM-based. See
  /// [Configuring Access Policies](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-access-policies)for
  /// more information.
  final String options;

  /// The status of the access policy for the Elasticsearch domain. See
  /// `OptionStatus` for the status information that's included.
  final OptionStatus status;

  AccessPoliciesStatus({
    @required this.options,
    @required this.status,
  });
  static AccessPoliciesStatus fromJson(Map<String, dynamic> json) =>
      AccessPoliciesStatus();
}

///  List of limits that are specific to a given InstanceType and for each of
/// it's  `InstanceRole`  .
class AdditionalLimit {
  ///  Name of Additional Limit is specific to a given InstanceType and for each
  /// of it's  `InstanceRole`  etc.
  ///  Attributes and their details:
  ///
  /// *   MaximumNumberOfDataNodesSupported
  ///  This attribute will be present in Master node only to specify how much
  /// data nodes upto which given  `ESPartitionInstanceType`  can support as
  /// master node.*   MaximumNumberOfDataNodesWithoutMasterNode
  ///  This attribute will be present in Data node only to specify how much data
  /// nodes of given  `ESPartitionInstanceType`  upto which you don't need any
  /// master nodes to govern them.
  final String limitName;

  ///  Value for given  `AdditionalLimit$LimitName`  .
  final List<String> limitValues;

  AdditionalLimit({
    this.limitName,
    this.limitValues,
  });
  static AdditionalLimit fromJson(Map<String, dynamic> json) =>
      AdditionalLimit();
}

///  Status of the advanced options for the specified Elasticsearch domain.
/// Currently, the following advanced options are available:
///
/// *   Option to allow references to indices in an HTTP request body. Must be
/// `false` when configuring access to individual sub-resources. By default, the
/// value is `true`. See
/// [Configuration Advanced Options](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options)
/// for more information.
/// *   Option to specify the percentage of heap space that is allocated to
/// field data. By default, this setting is unbounded.
///
/// For more information, see
/// [Configuring Advanced Options](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options).
class AdvancedOptionsStatus {
  ///  Specifies the status of advanced options for the specified Elasticsearch
  /// domain.
  final Map<String, String> options;

  ///  Specifies the status of `OptionStatus` for advanced options for the
  /// specified Elasticsearch domain.
  final OptionStatus status;

  AdvancedOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static AdvancedOptionsStatus fromJson(Map<String, dynamic> json) =>
      AdvancedOptionsStatus();
}

/// The result of a `CancelElasticsearchServiceSoftwareUpdate` operation.
/// Contains the status of the update.
class CancelElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  final ServiceSoftwareOptions serviceSoftwareOptions;

  CancelElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });
  static CancelElasticsearchServiceSoftwareUpdateResponse fromJson(
          Map<String, dynamic> json) =>
      CancelElasticsearchServiceSoftwareUpdateResponse();
}

/// Options to specify the Cognito user and identity pools for Kibana
/// authentication. For more information, see
/// [Amazon Cognito Authentication for Kibana](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
class CognitoOptions {
  /// Specifies the option to enable Cognito for Kibana authentication.
  final bool enabled;

  /// Specifies the Cognito user pool ID for Kibana authentication.
  final String userPoolId;

  /// Specifies the Cognito identity pool ID for Kibana authentication.
  final String identityPoolId;

  /// Specifies the role ARN that provides Elasticsearch permissions for
  /// accessing Cognito resources.
  final String roleArn;

  CognitoOptions({
    this.enabled,
    this.userPoolId,
    this.identityPoolId,
    this.roleArn,
  });
  static CognitoOptions fromJson(Map<String, dynamic> json) => CognitoOptions();
}

/// Status of the Cognito options for the specified Elasticsearch domain.
class CognitoOptionsStatus {
  /// Specifies the Cognito options for the specified Elasticsearch domain.
  final CognitoOptions options;

  /// Specifies the status of the Cognito options for the specified
  /// Elasticsearch domain.
  final OptionStatus status;

  CognitoOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static CognitoOptionsStatus fromJson(Map<String, dynamic> json) =>
      CognitoOptionsStatus();
}

///  A map from an  `ElasticsearchVersion`  to a list of compatible
/// `ElasticsearchVersion`  s to which the domain can be upgraded.
class CompatibleVersionsMap {
  /// The current version of Elasticsearch on which a domain is.
  final String sourceVersion;

  final List<String> targetVersions;

  CompatibleVersionsMap({
    this.sourceVersion,
    this.targetVersions,
  });
  static CompatibleVersionsMap fromJson(Map<String, dynamic> json) =>
      CompatibleVersionsMap();
}

/// The result of a `CreateElasticsearchDomain` operation. Contains the status
/// of the newly created Elasticsearch domain.
class CreateElasticsearchDomainResponse {
  /// The status of the newly created Elasticsearch domain.
  final ElasticsearchDomainStatus domainStatus;

  CreateElasticsearchDomainResponse({
    this.domainStatus,
  });
  static CreateElasticsearchDomainResponse fromJson(
          Map<String, dynamic> json) =>
      CreateElasticsearchDomainResponse();
}

/// The result of a `DeleteElasticsearchDomain` request. Contains the status of
/// the pending deletion, or no status if the domain and all of its resources
/// have been deleted.
class DeleteElasticsearchDomainResponse {
  /// The status of the Elasticsearch domain being deleted.
  final ElasticsearchDomainStatus domainStatus;

  DeleteElasticsearchDomainResponse({
    this.domainStatus,
  });
  static DeleteElasticsearchDomainResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteElasticsearchDomainResponse();
}

/// The result of a `DescribeElasticsearchDomainConfig` request. Contains the
/// configuration information of the requested domain.
class DescribeElasticsearchDomainConfigResponse {
  /// The configuration information of the domain requested in the
  /// `DescribeElasticsearchDomainConfig` request.
  final ElasticsearchDomainConfig domainConfig;

  DescribeElasticsearchDomainConfigResponse({
    @required this.domainConfig,
  });
  static DescribeElasticsearchDomainConfigResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeElasticsearchDomainConfigResponse();
}

/// The result of a `DescribeElasticsearchDomain` request. Contains the status
/// of the domain specified in the request.
class DescribeElasticsearchDomainResponse {
  /// The current status of the Elasticsearch domain.
  final ElasticsearchDomainStatus domainStatus;

  DescribeElasticsearchDomainResponse({
    @required this.domainStatus,
  });
  static DescribeElasticsearchDomainResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeElasticsearchDomainResponse();
}

/// The result of a `DescribeElasticsearchDomains` request. Contains the status
/// of the specified domains or all domains owned by the account.
class DescribeElasticsearchDomainsResponse {
  /// The status of the domains requested in the `DescribeElasticsearchDomains`
  /// request.
  final List<ElasticsearchDomainStatus> domainStatusList;

  DescribeElasticsearchDomainsResponse({
    @required this.domainStatusList,
  });
  static DescribeElasticsearchDomainsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeElasticsearchDomainsResponse();
}

///  Container for the parameters received from
/// `DescribeElasticsearchInstanceTypeLimits`  operation.
class DescribeElasticsearchInstanceTypeLimitsResponse {
  final Map<String, Limits> limitsByRole;

  DescribeElasticsearchInstanceTypeLimitsResponse({
    this.limitsByRole,
  });
  static DescribeElasticsearchInstanceTypeLimitsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeElasticsearchInstanceTypeLimitsResponse();
}

/// Container for results from `DescribeReservedElasticsearchInstanceOfferings`
class DescribeReservedElasticsearchInstanceOfferingsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// List of reserved Elasticsearch instance offerings
  final List<ReservedElasticsearchInstanceOffering>
      reservedElasticsearchInstanceOfferings;

  DescribeReservedElasticsearchInstanceOfferingsResponse({
    this.nextToken,
    this.reservedElasticsearchInstanceOfferings,
  });
  static DescribeReservedElasticsearchInstanceOfferingsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReservedElasticsearchInstanceOfferingsResponse();
}

/// Container for results from `DescribeReservedElasticsearchInstances`
class DescribeReservedElasticsearchInstancesResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// List of reserved Elasticsearch instances.
  final List<ReservedElasticsearchInstance> reservedElasticsearchInstances;

  DescribeReservedElasticsearchInstancesResponse({
    this.nextToken,
    this.reservedElasticsearchInstances,
  });
  static DescribeReservedElasticsearchInstancesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReservedElasticsearchInstancesResponse();
}

class DomainInfo {
  ///  Specifies the `DomainName`.
  final String domainName;

  DomainInfo({
    this.domainName,
  });
  static DomainInfo fromJson(Map<String, dynamic> json) => DomainInfo();
}

/// Options to enable, disable, and specify the properties of EBS storage
/// volumes. For more information, see
/// [Configuring EBS-based Storage](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs).
class EbsOptions {
  /// Specifies whether EBS-based storage is enabled.
  final bool ebsEnabled;

  ///  Specifies the volume type for EBS-based storage.
  final String volumeType;

  ///  Integer to specify the size of an EBS volume.
  final int volumeSize;

  /// Specifies the IOPD for a Provisioned IOPS EBS volume (SSD).
  final int iops;

  EbsOptions({
    this.ebsEnabled,
    this.volumeType,
    this.volumeSize,
    this.iops,
  });
  static EbsOptions fromJson(Map<String, dynamic> json) => EbsOptions();
}

///  Status of the EBS options for the specified Elasticsearch domain.
class EbsOptionsStatus {
  ///  Specifies the EBS options for the specified Elasticsearch domain.
  final EbsOptions options;

  ///  Specifies the status of the EBS options for the specified Elasticsearch
  /// domain.
  final OptionStatus status;

  EbsOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static EbsOptionsStatus fromJson(Map<String, dynamic> json) =>
      EbsOptionsStatus();
}

/// Specifies the configuration for the domain cluster, such as the type and
/// number of instances.
class ElasticsearchClusterConfig {
  /// The instance type for an Elasticsearch cluster.
  final String instanceType;

  /// The number of instances in the specified domain cluster.
  final int instanceCount;

  /// A boolean value to indicate whether a dedicated master node is enabled.
  /// See
  /// [About Dedicated Master Nodes](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-dedicatedmasternodes)
  /// for more information.
  final bool dedicatedMasterEnabled;

  /// A boolean value to indicate whether zone awareness is enabled. See
  /// [About Zone Awareness](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-zoneawareness)
  /// for more information.
  final bool zoneAwarenessEnabled;

  /// Specifies the zone awareness configuration for a domain when zone
  /// awareness is enabled.
  final ZoneAwarenessConfig zoneAwarenessConfig;

  /// The instance type for a dedicated master node.
  final String dedicatedMasterType;

  /// Total number of dedicated master nodes, active and on standby, for the
  /// cluster.
  final int dedicatedMasterCount;

  ElasticsearchClusterConfig({
    this.instanceType,
    this.instanceCount,
    this.dedicatedMasterEnabled,
    this.zoneAwarenessEnabled,
    this.zoneAwarenessConfig,
    this.dedicatedMasterType,
    this.dedicatedMasterCount,
  });
  static ElasticsearchClusterConfig fromJson(Map<String, dynamic> json) =>
      ElasticsearchClusterConfig();
}

///  Specifies the configuration status for the specified Elasticsearch domain.
class ElasticsearchClusterConfigStatus {
  ///  Specifies the cluster configuration for the specified Elasticsearch
  /// domain.
  final ElasticsearchClusterConfig options;

  ///  Specifies the status of the configuration for the specified Elasticsearch
  /// domain.
  final OptionStatus status;

  ElasticsearchClusterConfigStatus({
    @required this.options,
    @required this.status,
  });
  static ElasticsearchClusterConfigStatus fromJson(Map<String, dynamic> json) =>
      ElasticsearchClusterConfigStatus();
}

/// The configuration of an Elasticsearch domain.
class ElasticsearchDomainConfig {
  /// String of format X.Y to specify version for the Elasticsearch domain.
  final ElasticsearchVersionStatus elasticsearchVersion;

  /// Specifies the `ElasticsearchClusterConfig` for the Elasticsearch domain.
  final ElasticsearchClusterConfigStatus elasticsearchClusterConfig;

  /// Specifies the `EBSOptions` for the Elasticsearch domain.
  final EbsOptionsStatus ebsOptions;

  /// IAM access policy as a JSON-formatted string.
  final AccessPoliciesStatus accessPolicies;

  /// Specifies the `SnapshotOptions` for the Elasticsearch domain.
  final SnapshotOptionsStatus snapshotOptions;

  /// The `VPCOptions` for the specified domain. For more information, see
  /// [VPC Endpoints for Amazon Elasticsearch Service Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html).
  final VpcDerivedInfoStatus vpcOptions;

  /// The `CognitoOptions` for the specified domain. For more information, see
  /// [Amazon Cognito Authentication for Kibana](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
  final CognitoOptionsStatus cognitoOptions;

  /// Specifies the `EncryptionAtRestOptions` for the Elasticsearch domain.
  final EncryptionAtRestOptionsStatus encryptionAtRestOptions;

  /// Specifies the `NodeToNodeEncryptionOptions` for the Elasticsearch domain.
  final NodeToNodeEncryptionOptionsStatus nodeToNodeEncryptionOptions;

  /// Specifies the `AdvancedOptions` for the domain. See
  /// [Configuring Advanced Options](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options)
  /// for more information.
  final AdvancedOptionsStatus advancedOptions;

  /// Log publishing options for the given domain.
  final LogPublishingOptionsStatus logPublishingOptions;

  ElasticsearchDomainConfig({
    this.elasticsearchVersion,
    this.elasticsearchClusterConfig,
    this.ebsOptions,
    this.accessPolicies,
    this.snapshotOptions,
    this.vpcOptions,
    this.cognitoOptions,
    this.encryptionAtRestOptions,
    this.nodeToNodeEncryptionOptions,
    this.advancedOptions,
    this.logPublishingOptions,
  });
  static ElasticsearchDomainConfig fromJson(Map<String, dynamic> json) =>
      ElasticsearchDomainConfig();
}

/// The current status of an Elasticsearch domain.
class ElasticsearchDomainStatus {
  /// The unique identifier for the specified Elasticsearch domain.
  final String domainId;

  /// The name of an Elasticsearch domain. Domain names are unique across the
  /// domains owned by an account within an AWS region. Domain names start with
  /// a letter or number and can contain the following characters: a-z
  /// (lowercase), 0-9, and - (hyphen).
  final String domainName;

  /// The Amazon resource name (ARN) of an Elasticsearch domain. See
  /// [Identifiers for IAM Entities](http://docs.aws.amazon.com/IAM/latest/UserGuide/index.html?Using_Identifiers.html)
  /// in _Using AWS Identity and Access Management_ for more information.
  final String arn;

  /// The domain creation status. `True` if the creation of an Elasticsearch
  /// domain is complete. `False` if domain creation is still in progress.
  final bool created;

  /// The domain deletion status. `True` if a delete request has been received
  /// for the domain but resource cleanup is still in progress. `False` if the
  /// domain has not been deleted. Once domain deletion is complete, the status
  /// of the domain is no longer returned.
  final bool deleted;

  /// The Elasticsearch domain endpoint that you use to submit index and search
  /// requests.
  final String endpoint;

  /// Map containing the Elasticsearch domain endpoints used to submit index and
  /// search requests. Example `key, value`:
  /// `'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'`.
  final Map<String, String> endpoints;

  /// The status of the Elasticsearch domain configuration. `True` if Amazon
  /// Elasticsearch Service is processing configuration changes. `False` if the
  /// configuration is active.
  final bool processing;

  /// The status of an Elasticsearch domain version upgrade. `True` if Amazon
  /// Elasticsearch Service is undergoing a version upgrade. `False` if the
  /// configuration is active.
  final bool upgradeProcessing;

  final String elasticsearchVersion;

  /// The type and number of instances in the domain cluster.
  final ElasticsearchClusterConfig elasticsearchClusterConfig;

  /// The `EBSOptions` for the specified domain. See
  /// [Configuring EBS-based Storage](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs)
  /// for more information.
  final EbsOptions ebsOptions;

  ///  IAM access policy as a JSON-formatted string.
  final String accessPolicies;

  /// Specifies the status of the `SnapshotOptions`
  final SnapshotOptions snapshotOptions;

  /// The `VPCOptions` for the specified domain. For more information, see
  /// [VPC Endpoints for Amazon Elasticsearch Service Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html).
  final VpcDerivedInfo vpcOptions;

  /// The `CognitoOptions` for the specified domain. For more information, see
  /// [Amazon Cognito Authentication for Kibana](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
  final CognitoOptions cognitoOptions;

  ///  Specifies the status of the `EncryptionAtRestOptions`.
  final EncryptionAtRestOptions encryptionAtRestOptions;

  /// Specifies the status of the `NodeToNodeEncryptionOptions`.
  final NodeToNodeEncryptionOptions nodeToNodeEncryptionOptions;

  /// Specifies the status of the `AdvancedOptions`
  final Map<String, String> advancedOptions;

  /// Log publishing options for the given domain.
  final Map<String, LogPublishingOption> logPublishingOptions;

  /// The current status of the Elasticsearch domain's service software.
  final ServiceSoftwareOptions serviceSoftwareOptions;

  ElasticsearchDomainStatus({
    @required this.domainId,
    @required this.domainName,
    @required this.arn,
    this.created,
    this.deleted,
    this.endpoint,
    this.endpoints,
    this.processing,
    this.upgradeProcessing,
    this.elasticsearchVersion,
    @required this.elasticsearchClusterConfig,
    this.ebsOptions,
    this.accessPolicies,
    this.snapshotOptions,
    this.vpcOptions,
    this.cognitoOptions,
    this.encryptionAtRestOptions,
    this.nodeToNodeEncryptionOptions,
    this.advancedOptions,
    this.logPublishingOptions,
    this.serviceSoftwareOptions,
  });
  static ElasticsearchDomainStatus fromJson(Map<String, dynamic> json) =>
      ElasticsearchDomainStatus();
}

///  Status of the Elasticsearch version options for the specified Elasticsearch
/// domain.
class ElasticsearchVersionStatus {
  ///  Specifies the Elasticsearch version for the specified Elasticsearch
  /// domain.
  final String options;

  ///  Specifies the status of the Elasticsearch version options for the
  /// specified Elasticsearch domain.
  final OptionStatus status;

  ElasticsearchVersionStatus({
    @required this.options,
    @required this.status,
  });
  static ElasticsearchVersionStatus fromJson(Map<String, dynamic> json) =>
      ElasticsearchVersionStatus();
}

/// Specifies the Encryption At Rest Options.
class EncryptionAtRestOptions {
  /// Specifies the option to enable Encryption At Rest.
  final bool enabled;

  ///  Specifies the KMS Key ID for Encryption At Rest options.
  final String kmsKeyId;

  EncryptionAtRestOptions({
    this.enabled,
    this.kmsKeyId,
  });
  static EncryptionAtRestOptions fromJson(Map<String, dynamic> json) =>
      EncryptionAtRestOptions();
}

///  Status of the Encryption At Rest options for the specified Elasticsearch
/// domain.
class EncryptionAtRestOptionsStatus {
  ///  Specifies the Encryption At Rest options for the specified Elasticsearch
  /// domain.
  final EncryptionAtRestOptions options;

  ///  Specifies the status of the Encryption At Rest options for the specified
  /// Elasticsearch domain.
  final OptionStatus status;

  EncryptionAtRestOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static EncryptionAtRestOptionsStatus fromJson(Map<String, dynamic> json) =>
      EncryptionAtRestOptionsStatus();
}

///  Container for response returned by  `GetCompatibleElasticsearchVersions`
/// operation.
class GetCompatibleElasticsearchVersionsResponse {
  ///  A map of compatible Elasticsearch versions returned as part of the
  /// `GetCompatibleElasticsearchVersions`  operation.
  final List<CompatibleVersionsMap> compatibleElasticsearchVersions;

  GetCompatibleElasticsearchVersionsResponse({
    this.compatibleElasticsearchVersions,
  });
  static GetCompatibleElasticsearchVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      GetCompatibleElasticsearchVersionsResponse();
}

///  Container for response returned by  `GetUpgradeHistory`  operation.
class GetUpgradeHistoryResponse {
  ///  A list of  `UpgradeHistory`  objects corresponding to each Upgrade or
  /// Upgrade Eligibility Check performed on a domain returned as part of
  /// `GetUpgradeHistoryResponse`  object.
  final List<UpgradeHistory> upgradeHistories;

  /// Pagination token that needs to be supplied to the next call to get the
  /// next page of results
  final String nextToken;

  GetUpgradeHistoryResponse({
    this.upgradeHistories,
    this.nextToken,
  });
  static GetUpgradeHistoryResponse fromJson(Map<String, dynamic> json) =>
      GetUpgradeHistoryResponse();
}

///  Container for response returned by  `GetUpgradeStatus`  operation.
class GetUpgradeStatusResponse {
  ///  Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check
  /// does through:
  ///
  /// *   PreUpgradeCheck
  /// *   Snapshot
  /// *   Upgrade
  final String upgradeStep;

  ///  One of 4 statuses that a step can go through returned as part of the
  /// `GetUpgradeStatusResponse`  object. The status can take one of the
  /// following values:
  ///
  /// *   In Progress
  /// *   Succeeded
  /// *   Succeeded with Issues
  /// *   Failed
  final String stepStatus;

  /// A string that describes the update briefly
  final String upgradeName;

  GetUpgradeStatusResponse({
    this.upgradeStep,
    this.stepStatus,
    this.upgradeName,
  });
  static GetUpgradeStatusResponse fromJson(Map<String, dynamic> json) =>
      GetUpgradeStatusResponse();
}

///  InstanceCountLimits represents the limits on number of instances that be
/// created in Amazon Elasticsearch for given InstanceType.
class InstanceCountLimits {
  final int minimumInstanceCount;

  final int maximumInstanceCount;

  InstanceCountLimits({
    this.minimumInstanceCount,
    this.maximumInstanceCount,
  });
  static InstanceCountLimits fromJson(Map<String, dynamic> json) =>
      InstanceCountLimits();
}

/// InstanceLimits represents the list of instance related attributes that are
/// available for given InstanceType.
class InstanceLimits {
  final InstanceCountLimits instanceCountLimits;

  InstanceLimits({
    this.instanceCountLimits,
  });
  static InstanceLimits fromJson(Map<String, dynamic> json) => InstanceLimits();
}

///  Limits for given InstanceType and for each of it's role.
///  Limits contains following  `StorageTypes,`   `InstanceLimits`  and
/// `AdditionalLimits`
class Limits {
  /// StorageType represents the list of storage related types and attributes
  /// that are available for given InstanceType.
  final List<StorageType> storageTypes;

  final InstanceLimits instanceLimits;

  ///  List of additional limits that are specific to a given InstanceType and
  /// for each of it's  `InstanceRole`  .
  final List<AdditionalLimit> additionalLimits;

  Limits({
    this.storageTypes,
    this.instanceLimits,
    this.additionalLimits,
  });
  static Limits fromJson(Map<String, dynamic> json) => Limits();
}

/// The result of a `ListDomainNames` operation. Contains the names of all
/// Elasticsearch domains owned by this account.
class ListDomainNamesResponse {
  /// List of Elasticsearch domain names.
  final List<DomainInfo> domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });
  static ListDomainNamesResponse fromJson(Map<String, dynamic> json) =>
      ListDomainNamesResponse();
}

///  Container for the parameters returned by  `ListElasticsearchInstanceTypes`
/// operation.
class ListElasticsearchInstanceTypesResponse {
  ///  List of instance types supported by Amazon Elasticsearch service for
  /// given  `ElasticsearchVersion`
  final List<String> elasticsearchInstanceTypes;

  /// In case if there are more results available NextToken would be present,
  /// make further request to the same API with received NextToken to paginate
  /// remaining results.
  final String nextToken;

  ListElasticsearchInstanceTypesResponse({
    this.elasticsearchInstanceTypes,
    this.nextToken,
  });
  static ListElasticsearchInstanceTypesResponse fromJson(
          Map<String, dynamic> json) =>
      ListElasticsearchInstanceTypesResponse();
}

///  Container for the parameters for response received from
/// `ListElasticsearchVersions`  operation.
class ListElasticsearchVersionsResponse {
  final List<String> elasticsearchVersions;

  final String nextToken;

  ListElasticsearchVersionsResponse({
    this.elasticsearchVersions,
    this.nextToken,
  });
  static ListElasticsearchVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListElasticsearchVersionsResponse();
}

/// The result of a `ListTags` operation. Contains tags for all requested
/// Elasticsearch domains.
class ListTagsResponse {
  ///  List of `Tag` for the requested Elasticsearch domain.
  final List<Tag> tagList;

  ListTagsResponse({
    this.tagList,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse();
}

/// Log Publishing option that is set for given domain.
/// Attributes and their details:
///
/// *   CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to which log
/// needs to be published.
/// *   Enabled: Whether the log publishing for given log type is enabled or not
class LogPublishingOption {
  final String cloudWatchLogsLogGroupArn;

  ///  Specifies whether given log publishing option is enabled or not.
  final bool enabled;

  LogPublishingOption({
    this.cloudWatchLogsLogGroupArn,
    this.enabled,
  });
  static LogPublishingOption fromJson(Map<String, dynamic> json) =>
      LogPublishingOption();
}

/// The configured log publishing options for the domain and their current
/// status.
class LogPublishingOptionsStatus {
  /// The log publishing options configured for the Elasticsearch domain.
  final Map<String, LogPublishingOption> options;

  /// The status of the log publishing options for the Elasticsearch domain. See
  /// `OptionStatus` for the status information that's included.
  final OptionStatus status;

  LogPublishingOptionsStatus({
    this.options,
    this.status,
  });
  static LogPublishingOptionsStatus fromJson(Map<String, dynamic> json) =>
      LogPublishingOptionsStatus();
}

/// Specifies the node-to-node encryption options.
class NodeToNodeEncryptionOptions {
  /// Specify true to enable node-to-node encryption.
  final bool enabled;

  NodeToNodeEncryptionOptions({
    this.enabled,
  });
  static NodeToNodeEncryptionOptions fromJson(Map<String, dynamic> json) =>
      NodeToNodeEncryptionOptions();
}

/// Status of the node-to-node encryption options for the specified
/// Elasticsearch domain.
class NodeToNodeEncryptionOptionsStatus {
  /// Specifies the node-to-node encryption options for the specified
  /// Elasticsearch domain.
  final NodeToNodeEncryptionOptions options;

  /// Specifies the status of the node-to-node encryption options for the
  /// specified Elasticsearch domain.
  final OptionStatus status;

  NodeToNodeEncryptionOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static NodeToNodeEncryptionOptionsStatus fromJson(
          Map<String, dynamic> json) =>
      NodeToNodeEncryptionOptionsStatus();
}

/// Provides the current status of the entity.
class OptionStatus {
  /// Timestamp which tells the creation date for the entity.
  final DateTime creationDate;

  /// Timestamp which tells the last updated time for the entity.
  final DateTime updateDate;

  /// Specifies the latest version for the entity.
  final int updateVersion;

  /// Provides the `OptionState` for the Elasticsearch domain.
  final String state;

  /// Indicates whether the Elasticsearch domain is being deleted.
  final bool pendingDeletion;

  OptionStatus({
    @required this.creationDate,
    @required this.updateDate,
    this.updateVersion,
    @required this.state,
    this.pendingDeletion,
  });
  static OptionStatus fromJson(Map<String, dynamic> json) => OptionStatus();
}

/// Represents the output of a `PurchaseReservedElasticsearchInstanceOffering`
/// operation.
class PurchaseReservedElasticsearchInstanceOfferingResponse {
  /// Details of the reserved Elasticsearch instance which was purchased.
  final String reservedElasticsearchInstanceId;

  /// The customer-specified identifier used to track this reservation.
  final String reservationName;

  PurchaseReservedElasticsearchInstanceOfferingResponse({
    this.reservedElasticsearchInstanceId,
    this.reservationName,
  });
  static PurchaseReservedElasticsearchInstanceOfferingResponse fromJson(
          Map<String, dynamic> json) =>
      PurchaseReservedElasticsearchInstanceOfferingResponse();
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved Elasticsearch instance, or for a reserved Elasticsearch instance
/// offering.
class RecurringCharge {
  /// The monetary amount of the recurring charge.
  final double recurringChargeAmount;

  /// The frequency of the recurring charge.
  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) =>
      RecurringCharge();
}

/// Details of a reserved Elasticsearch instance.
class ReservedElasticsearchInstance {
  /// The customer-specified identifier to track this reservation.
  final String reservationName;

  /// The unique identifier for the reservation.
  final String reservedElasticsearchInstanceId;

  /// The offering identifier.
  final String reservedElasticsearchInstanceOfferingId;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  final String elasticsearchInstanceType;

  /// The time the reservation started.
  final DateTime startTime;

  /// The duration, in seconds, for which the Elasticsearch instance is
  /// reserved.
  final int duration;

  /// The upfront fixed charge you will paid to purchase the specific reserved
  /// Elasticsearch instance offering.
  final double fixedPrice;

  /// The rate you are charged for each hour for the domain that is using this
  /// reserved instance.
  final double usagePrice;

  /// The currency code for the reserved Elasticsearch instance offering.
  final String currencyCode;

  /// The number of Elasticsearch instances that have been reserved.
  final int elasticsearchInstanceCount;

  /// The state of the reserved Elasticsearch instance.
  final String state;

  /// The payment option as defined in the reserved Elasticsearch instance
  /// offering.
  final String paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge> recurringCharges;

  ReservedElasticsearchInstance({
    this.reservationName,
    this.reservedElasticsearchInstanceId,
    this.reservedElasticsearchInstanceOfferingId,
    this.elasticsearchInstanceType,
    this.startTime,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.elasticsearchInstanceCount,
    this.state,
    this.paymentOption,
    this.recurringCharges,
  });
  static ReservedElasticsearchInstance fromJson(Map<String, dynamic> json) =>
      ReservedElasticsearchInstance();
}

/// Details of a reserved Elasticsearch instance offering.
class ReservedElasticsearchInstanceOffering {
  /// The Elasticsearch reserved instance offering identifier.
  final String reservedElasticsearchInstanceOfferingId;

  /// The Elasticsearch instance type offered by the reserved instance offering.
  final String elasticsearchInstanceType;

  /// The duration, in seconds, for which the offering will reserve the
  /// Elasticsearch instance.
  final int duration;

  /// The upfront fixed charge you will pay to purchase the specific reserved
  /// Elasticsearch instance offering.
  final double fixedPrice;

  /// The rate you are charged for each hour the domain that is using the
  /// offering is running.
  final double usagePrice;

  /// The currency code for the reserved Elasticsearch instance offering.
  final String currencyCode;

  /// Payment option for the reserved Elasticsearch instance offering
  final String paymentOption;

  /// The charge to your account regardless of whether you are creating any
  /// domains using the instance offering.
  final List<RecurringCharge> recurringCharges;

  ReservedElasticsearchInstanceOffering({
    this.reservedElasticsearchInstanceOfferingId,
    this.elasticsearchInstanceType,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.paymentOption,
    this.recurringCharges,
  });
  static ReservedElasticsearchInstanceOffering fromJson(
          Map<String, dynamic> json) =>
      ReservedElasticsearchInstanceOffering();
}

/// The current options of an Elasticsearch domain service software options.
class ServiceSoftwareOptions {
  /// The current service software version that is present on the domain.
  final String currentVersion;

  /// The new service software version if one is available.
  final String newVersion;

  /// `True` if you are able to update you service software version. `False` if
  /// you are not able to update your service software version.
  final bool updateAvailable;

  /// `True` if you are able to cancel your service software version update.
  /// `False` if you are not able to cancel your service software version.
  final bool cancellable;

  /// The status of your service software update. This field can take the
  /// following values: `ELIGIBLE`, `PENDING_UPDATE`, `IN_PROGRESS`,
  /// `COMPLETED`, and `NOT_ELIGIBLE`.
  final String updateStatus;

  /// The description of the `UpdateStatus`.
  final String description;

  /// Timestamp, in Epoch time, until which you can manually request a service
  /// software update. After this date, we automatically update your service
  /// software.
  final DateTime automatedUpdateDate;

  ServiceSoftwareOptions({
    this.currentVersion,
    this.newVersion,
    this.updateAvailable,
    this.cancellable,
    this.updateStatus,
    this.description,
    this.automatedUpdateDate,
  });
  static ServiceSoftwareOptions fromJson(Map<String, dynamic> json) =>
      ServiceSoftwareOptions();
}

/// Specifies the time, in UTC format, when the service takes a daily automated
/// snapshot of the specified Elasticsearch domain. Default value is `0` hours.
class SnapshotOptions {
  /// Specifies the time, in UTC format, when the service takes a daily
  /// automated snapshot of the specified Elasticsearch domain. Default value is
  /// `0` hours.
  final int automatedSnapshotStartHour;

  SnapshotOptions({
    this.automatedSnapshotStartHour,
  });
  static SnapshotOptions fromJson(Map<String, dynamic> json) =>
      SnapshotOptions();
}

/// Status of a daily automated snapshot.
class SnapshotOptionsStatus {
  /// Specifies the daily snapshot options specified for the Elasticsearch
  /// domain.
  final SnapshotOptions options;

  /// Specifies the status of a daily automated snapshot.
  final OptionStatus status;

  SnapshotOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static SnapshotOptionsStatus fromJson(Map<String, dynamic> json) =>
      SnapshotOptionsStatus();
}

/// The result of a `StartElasticsearchServiceSoftwareUpdate` operation.
/// Contains the status of the update.
class StartElasticsearchServiceSoftwareUpdateResponse {
  /// The current status of the Elasticsearch service software update.
  final ServiceSoftwareOptions serviceSoftwareOptions;

  StartElasticsearchServiceSoftwareUpdateResponse({
    this.serviceSoftwareOptions,
  });
  static StartElasticsearchServiceSoftwareUpdateResponse fromJson(
          Map<String, dynamic> json) =>
      StartElasticsearchServiceSoftwareUpdateResponse();
}

/// StorageTypes represents the list of storage related types and their
/// attributes that are available for given InstanceType.
class StorageType {
  final String storageTypeName;

  final String storageSubTypeName;

  /// List of limits that are applicable for given storage type.
  final List<StorageTypeLimit> storageTypeLimits;

  StorageType({
    this.storageTypeName,
    this.storageSubTypeName,
    this.storageTypeLimits,
  });
  static StorageType fromJson(Map<String, dynamic> json) => StorageType();
}

/// Limits that are applicable for given storage type.
class StorageTypeLimit {
  ///  Name of storage limits that are applicable for given storage type. If
  /// `StorageType`  is ebs, following storage options are applicable
  ///
  /// 1.  MinimumVolumeSize
  ///  Minimum amount of volume size that is applicable for given storage
  /// type.It can be empty if it is not applicable.2.  MaximumVolumeSize
  ///  Maximum amount of volume size that is applicable for given storage
  /// type.It can be empty if it is not applicable.3.  MaximumIops
  ///  Maximum amount of Iops that is applicable for given storage type.It can
  /// be empty if it is not applicable.4.  MinimumIops
  ///  Minimum amount of Iops that is applicable for given storage type.It can
  /// be empty if it is not applicable.
  final String limitName;

  ///  Values for the  `StorageTypeLimit$LimitName`  .
  final List<String> limitValues;

  StorageTypeLimit({
    this.limitName,
    this.limitValues,
  });
  static StorageTypeLimit fromJson(Map<String, dynamic> json) =>
      StorageTypeLimit();
}

/// Specifies a key value pair for a resource tag.
class Tag {
  /// Specifies the `TagKey`, the name of the tag. Tag keys must be unique for
  /// the Elasticsearch domain to which they are attached.
  final String key;

  /// Specifies the `TagValue`, the value assigned to the corresponding tag key.
  /// Tag values can be null and do not have to be unique in a tag set. For
  /// example, you can have a key value pair in a tag set of `project : Trinity`
  /// and `cost-center : Trinity`
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// The result of an `UpdateElasticsearchDomain` request. Contains the status of
/// the Elasticsearch domain being updated.
class UpdateElasticsearchDomainConfigResponse {
  /// The status of the updated Elasticsearch domain.
  final ElasticsearchDomainConfig domainConfig;

  UpdateElasticsearchDomainConfigResponse({
    @required this.domainConfig,
  });
  static UpdateElasticsearchDomainConfigResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateElasticsearchDomainConfigResponse();
}

///  Container for response returned by  `UpgradeElasticsearchDomain`
/// operation.
class UpgradeElasticsearchDomainResponse {
  final String domainName;

  /// The version of Elasticsearch that you intend to upgrade the domain to.
  final String targetVersion;

  ///  This flag, when set to True, indicates that an Upgrade Eligibility Check
  /// needs to be performed. This will not actually perform the Upgrade.
  final bool performCheckOnly;

  UpgradeElasticsearchDomainResponse({
    this.domainName,
    this.targetVersion,
    this.performCheckOnly,
  });
  static UpgradeElasticsearchDomainResponse fromJson(
          Map<String, dynamic> json) =>
      UpgradeElasticsearchDomainResponse();
}

/// History of the last 10 Upgrades and Upgrade Eligibility Checks.
class UpgradeHistory {
  /// A string that describes the update briefly
  final String upgradeName;

  /// UTC Timestamp at which the Upgrade API call was made in
  /// "yyyy-MM-ddTHH:mm:ssZ" format.
  final DateTime startTimestamp;

  ///  The overall status of the update. The status can take one of the
  /// following values:
  ///
  /// *   In Progress
  /// *   Succeeded
  /// *   Succeeded with Issues
  /// *   Failed
  final String upgradeStatus;

  ///  A list of  `UpgradeStepItem`  s representing information about each step
  /// performed as pard of a specific Upgrade or Upgrade Eligibility Check.
  final List<UpgradeStepItem> stepsList;

  UpgradeHistory({
    this.upgradeName,
    this.startTimestamp,
    this.upgradeStatus,
    this.stepsList,
  });
  static UpgradeHistory fromJson(Map<String, dynamic> json) => UpgradeHistory();
}

/// Represents a single step of the Upgrade or Upgrade Eligibility Check
/// workflow.
class UpgradeStepItem {
  ///  Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check
  /// does through:
  ///
  /// *   PreUpgradeCheck
  /// *   Snapshot
  /// *   Upgrade
  final String upgradeStep;

  ///  The status of a particular step during an upgrade. The status can take
  /// one of the following values:
  ///
  /// *   In Progress
  /// *   Succeeded
  /// *   Succeeded with Issues
  /// *   Failed
  final String upgradeStepStatus;

  /// A list of strings containing detailed information about the errors
  /// encountered in a particular step.
  final List<String> issues;

  /// The Floating point value representing progress percentage of a particular
  /// step.
  final double progressPercent;

  UpgradeStepItem({
    this.upgradeStep,
    this.upgradeStepStatus,
    this.issues,
    this.progressPercent,
  });
  static UpgradeStepItem fromJson(Map<String, dynamic> json) =>
      UpgradeStepItem();
}

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see
/// [VPC Endpoints for Amazon Elasticsearch Service Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html).
class VpcDerivedInfo {
  /// The VPC Id for the Elasticsearch domain. Exists only if the domain was
  /// created with VPCOptions.
  final String vpcId;

  /// Specifies the subnets for VPC endpoint.
  final List<String> subnetIds;

  /// The availability zones for the Elasticsearch domain. Exists only if the
  /// domain was created with VPCOptions.
  final List<String> availabilityZones;

  /// Specifies the security groups for VPC endpoint.
  final List<String> securityGroupIds;

  VpcDerivedInfo({
    this.vpcId,
    this.subnetIds,
    this.availabilityZones,
    this.securityGroupIds,
  });
  static VpcDerivedInfo fromJson(Map<String, dynamic> json) => VpcDerivedInfo();
}

///  Status of the VPC options for the specified Elasticsearch domain.
class VpcDerivedInfoStatus {
  ///  Specifies the VPC options for the specified Elasticsearch domain.
  final VpcDerivedInfo options;

  ///  Specifies the status of the VPC options for the specified Elasticsearch
  /// domain.
  final OptionStatus status;

  VpcDerivedInfoStatus({
    @required this.options,
    @required this.status,
  });
  static VpcDerivedInfoStatus fromJson(Map<String, dynamic> json) =>
      VpcDerivedInfoStatus();
}

/// Options to specify the subnets and security groups for VPC endpoint. For
/// more information, see
/// [VPC Endpoints for Amazon Elasticsearch Service Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html).
class VpcOptions {
  /// Specifies the subnets for VPC endpoint.
  final List<String> subnetIds;

  /// Specifies the security groups for VPC endpoint.
  final List<String> securityGroupIds;

  VpcOptions({
    this.subnetIds,
    this.securityGroupIds,
  });
}

/// Specifies the zone awareness configuration for the domain cluster, such as
/// the number of availability zones.
class ZoneAwarenessConfig {
  /// An integer value to indicate the number of availability zones for a domain
  /// when zone awareness is enabled. This should be equal to number of subnets
  /// if VPC endpoints is enabled
  final int availabilityZoneCount;

  ZoneAwarenessConfig({
    this.availabilityZoneCount,
  });
  static ZoneAwarenessConfig fromJson(Map<String, dynamic> json) =>
      ZoneAwarenessConfig();
}
