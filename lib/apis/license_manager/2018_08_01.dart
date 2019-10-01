import 'package:meta/meta.dart';

///  AWS License Manager
///
///  _This is the AWS License Manager API Reference._ It provides descriptions,
/// syntax, and usage examples for each of the actions and data types for
/// License Manager. The topic for each action shows the Query API request
/// parameters and the XML response. You can also view the XML request elements
/// in the WSDL.
///
///  Alternatively, you can use one of the AWS SDKs to access an API that's
/// tailored to the programming language or platform that you're using. For more
/// information, see [AWS SDKs](http://aws.amazon.com/tools/#SDKs).
class LicenseManagerApi {
  final _client;
  LicenseManagerApi(client)
      : _client = client.configured('License Manager', serializer: 'json');

  /// Creates a new license configuration object. A license configuration is an
  /// abstraction of a customer license agreement that can be consumed and
  /// enforced by License Manager. Components include specifications for the
  /// license type (licensing by instance, socket, CPU, or VCPU), tenancy
  /// (shared tenancy, Amazon EC2 Dedicated Instance, Amazon EC2 Dedicated Host,
  /// or any of these), host affinity (how long a VM must be associated with a
  /// host), the number of licenses purchased and used.
  ///
  /// [name]: Name of the license configuration.
  ///
  /// [description]: Human-friendly description of the license configuration.
  ///
  /// [licenseCountingType]: Dimension to use to track the license inventory.
  ///
  /// [licenseCount]: Number of licenses managed by the license configuration.
  ///
  /// [licenseCountHardLimit]: Flag indicating whether hard or soft license
  /// enforcement is used. Exceeding a hard limit results in the blocked
  /// deployment of new instances.
  ///
  /// [licenseRules]: Array of configured License Manager rules.
  ///
  /// [tags]: The tags to apply to the resources during launch. You can only tag
  /// instances and volumes on launch. The specified tags are applied to all
  /// instances or volumes that are created during launch. To tag a resource
  /// after it has been created, see CreateTags .
  Future<CreateLicenseConfigurationResponse> createLicenseConfiguration(
      {@required String name,
      String description,
      @required String licenseCountingType,
      BigInt licenseCount,
      bool licenseCountHardLimit,
      List<String> licenseRules,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateLicenseConfiguration', {
      'Name': name,
      if (description != null) 'Description': description,
      'LicenseCountingType': licenseCountingType,
      if (licenseCount != null) 'LicenseCount': licenseCount,
      if (licenseCountHardLimit != null)
        'LicenseCountHardLimit': licenseCountHardLimit,
      if (licenseRules != null) 'LicenseRules': licenseRules,
      if (tags != null) 'Tags': tags,
    });
    return CreateLicenseConfigurationResponse.fromJson(response_);
  }

  /// Deletes an existing license configuration. This action fails if the
  /// configuration is in use.
  ///
  /// [licenseConfigurationArn]: Unique ID of the configuration object to
  /// delete.
  Future<DeleteLicenseConfigurationResponse> deleteLicenseConfiguration(
      String licenseConfigurationArn) async {
    var response_ = await _client.send('DeleteLicenseConfiguration', {
      'LicenseConfigurationArn': licenseConfigurationArn,
    });
    return DeleteLicenseConfigurationResponse.fromJson(response_);
  }

  /// Returns a detailed description of a license configuration.
  ///
  /// [licenseConfigurationArn]: ARN of the license configuration being
  /// requested.
  Future<GetLicenseConfigurationResponse> getLicenseConfiguration(
      String licenseConfigurationArn) async {
    var response_ = await _client.send('GetLicenseConfiguration', {
      'LicenseConfigurationArn': licenseConfigurationArn,
    });
    return GetLicenseConfigurationResponse.fromJson(response_);
  }

  /// Gets License Manager settings for a region. Exposes the configured S3
  /// bucket, SNS topic, etc., for inspection.
  Future<GetServiceSettingsResponse> getServiceSettings() async {
    var response_ = await _client.send('GetServiceSettings', {});
    return GetServiceSettingsResponse.fromJson(response_);
  }

  /// Lists the resource associations for a license configuration. Resource
  /// associations need not consume licenses from a license configuration. For
  /// example, an AMI or a stopped instance may not consume a license (depending
  /// on the license rules). Use this operation to find all resources associated
  /// with a license configuration.
  ///
  /// [licenseConfigurationArn]: ARN of a `LicenseConfiguration` object.
  ///
  /// [maxResults]: Maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: Token for the next set of results.
  Future<ListAssociationsForLicenseConfigurationResponse>
      listAssociationsForLicenseConfiguration(String licenseConfigurationArn,
          {int maxResults, String nextToken}) async {
    var response_ =
        await _client.send('ListAssociationsForLicenseConfiguration', {
      'LicenseConfigurationArn': licenseConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListAssociationsForLicenseConfigurationResponse.fromJson(response_);
  }

  /// Lists license configuration objects for an account, each containing the
  /// name, description, license type, and other license terms modeled from a
  /// license agreement.
  ///
  /// [licenseConfigurationArns]: An array of ARNs for the calling account’s
  /// license configurations.
  ///
  /// [maxResults]: Maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: Token for the next set of results.
  ///
  /// [filters]: One or more filters.
  Future<ListLicenseConfigurationsResponse> listLicenseConfigurations(
      {List<String> licenseConfigurationArns,
      int maxResults,
      String nextToken,
      List<Filter> filters}) async {
    var response_ = await _client.send('ListLicenseConfigurations', {
      if (licenseConfigurationArns != null)
        'LicenseConfigurationArns': licenseConfigurationArns,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListLicenseConfigurationsResponse.fromJson(response_);
  }

  /// Returns the license configuration for a resource.
  ///
  /// [resourceArn]: ARN of an AMI or Amazon EC2 instance that has an associated
  /// license configuration.
  ///
  /// [maxResults]: Maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: Token for the next set of results.
  Future<ListLicenseSpecificationsForResourceResponse>
      listLicenseSpecificationsForResource(String resourceArn,
          {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListLicenseSpecificationsForResource', {
      'ResourceArn': resourceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListLicenseSpecificationsForResourceResponse.fromJson(response_);
  }

  /// Returns a detailed list of resources.
  ///
  /// [maxResults]: Maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: Token for the next set of results.
  ///
  /// [filters]: One or more filters.
  Future<ListResourceInventoryResponse> listResourceInventory(
      {int maxResults, String nextToken, List<InventoryFilter> filters}) async {
    var response_ = await _client.send('ListResourceInventory', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListResourceInventoryResponse.fromJson(response_);
  }

  /// Lists tags attached to a resource.
  ///
  /// [resourceArn]: ARN for the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Lists all license usage records for a license configuration, displaying
  /// license consumption details by resource at a selected point in time. Use
  /// this action to audit the current license consumption for any license
  /// inventory and configuration.
  ///
  /// [licenseConfigurationArn]: ARN of the targeted `LicenseConfiguration`
  /// object.
  ///
  /// [maxResults]: Maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: Token for the next set of results.
  ///
  /// [filters]: List of filters to apply.
  Future<ListUsageForLicenseConfigurationResponse>
      listUsageForLicenseConfiguration(String licenseConfigurationArn,
          {int maxResults, String nextToken, List<Filter> filters}) async {
    var response_ = await _client.send('ListUsageForLicenseConfiguration', {
      'LicenseConfigurationArn': licenseConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListUsageForLicenseConfigurationResponse.fromJson(response_);
  }

  /// Attach one of more tags to any resource.
  ///
  /// [resourceArn]: Resource of the ARN to be tagged.
  ///
  /// [tags]: Names of the tags to attach to the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Remove tags from a resource.
  ///
  /// [resourceArn]: ARN of the resource.
  ///
  /// [tagKeys]: List keys identifying tags to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Modifies the attributes of an existing license configuration object. A
  /// license configuration is an abstraction of a customer license agreement
  /// that can be consumed and enforced by License Manager. Components include
  /// specifications for the license type (Instances, cores, sockets, VCPUs),
  /// tenancy (shared or Dedicated Host), host affinity (how long a VM is
  /// associated with a host), the number of licenses purchased and used.
  ///
  /// [licenseConfigurationArn]: ARN for a license configuration.
  ///
  /// [licenseConfigurationStatus]: New status of the license configuration
  /// (`ACTIVE` or `INACTIVE`).
  ///
  /// [licenseRules]: List of flexible text strings designating license rules.
  ///
  /// [licenseCount]: New number of licenses managed by the license
  /// configuration.
  ///
  /// [licenseCountHardLimit]: Sets the number of available licenses as a hard
  /// limit.
  ///
  /// [name]: New name of the license configuration.
  ///
  /// [description]: New human-friendly description of the license
  /// configuration.
  Future<UpdateLicenseConfigurationResponse> updateLicenseConfiguration(
      String licenseConfigurationArn,
      {String licenseConfigurationStatus,
      List<String> licenseRules,
      BigInt licenseCount,
      bool licenseCountHardLimit,
      String name,
      String description}) async {
    var response_ = await _client.send('UpdateLicenseConfiguration', {
      'LicenseConfigurationArn': licenseConfigurationArn,
      if (licenseConfigurationStatus != null)
        'LicenseConfigurationStatus': licenseConfigurationStatus,
      if (licenseRules != null) 'LicenseRules': licenseRules,
      if (licenseCount != null) 'LicenseCount': licenseCount,
      if (licenseCountHardLimit != null)
        'LicenseCountHardLimit': licenseCountHardLimit,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
    });
    return UpdateLicenseConfigurationResponse.fromJson(response_);
  }

  /// Adds or removes license configurations for a specified AWS resource. This
  /// operation currently supports updating the license specifications of AMIs,
  /// instances, and hosts. Launch templates and AWS CloudFormation templates
  /// are not managed from this operation as those resources send the license
  /// configurations directly to a resource creation operation, such as
  /// `RunInstances`.
  ///
  /// [resourceArn]: ARN for an AWS server resource.
  ///
  /// [addLicenseSpecifications]: License configuration ARNs to be added to a
  /// resource.
  ///
  /// [removeLicenseSpecifications]: License configuration ARNs to be removed
  /// from a resource.
  Future<UpdateLicenseSpecificationsForResourceResponse>
      updateLicenseSpecificationsForResource(String resourceArn,
          {List<LicenseSpecification> addLicenseSpecifications,
          List<LicenseSpecification> removeLicenseSpecifications}) async {
    var response_ =
        await _client.send('UpdateLicenseSpecificationsForResource', {
      'ResourceArn': resourceArn,
      if (addLicenseSpecifications != null)
        'AddLicenseSpecifications': addLicenseSpecifications,
      if (removeLicenseSpecifications != null)
        'RemoveLicenseSpecifications': removeLicenseSpecifications,
    });
    return UpdateLicenseSpecificationsForResourceResponse.fromJson(response_);
  }

  /// Updates License Manager service settings.
  ///
  /// [s3BucketArn]: ARN of the Amazon S3 bucket where License Manager
  /// information is stored.
  ///
  /// [snsTopicArn]: ARN of the Amazon SNS topic used for License Manager
  /// alerts.
  ///
  /// [organizationConfiguration]: Integrates AWS Organizations with License
  /// Manager for cross-account discovery.
  ///
  /// [enableCrossAccountsDiscovery]: Activates cross-account discovery.
  Future<UpdateServiceSettingsResponse> updateServiceSettings(
      {String s3BucketArn,
      String snsTopicArn,
      OrganizationConfiguration organizationConfiguration,
      bool enableCrossAccountsDiscovery}) async {
    var response_ = await _client.send('UpdateServiceSettings', {
      if (s3BucketArn != null) 'S3BucketArn': s3BucketArn,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (organizationConfiguration != null)
        'OrganizationConfiguration': organizationConfiguration,
      if (enableCrossAccountsDiscovery != null)
        'EnableCrossAccountsDiscovery': enableCrossAccountsDiscovery,
    });
    return UpdateServiceSettingsResponse.fromJson(response_);
  }
}

/// Details about license consumption.
class ConsumedLicenseSummary {
  /// Resource type of the resource consuming a license (instance, host, or
  /// AMI).
  final String resourceType;

  /// Number of licenses consumed by a resource.
  final BigInt consumedLicenses;

  ConsumedLicenseSummary({
    this.resourceType,
    this.consumedLicenses,
  });
  static ConsumedLicenseSummary fromJson(Map<String, dynamic> json) =>
      ConsumedLicenseSummary(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        consumedLicenses: json.containsKey('ConsumedLicenses')
            ? BigInt.from(json['ConsumedLicenses'])
            : null,
      );
}

class CreateLicenseConfigurationResponse {
  /// ARN of the license configuration object after its creation.
  final String licenseConfigurationArn;

  CreateLicenseConfigurationResponse({
    this.licenseConfigurationArn,
  });
  static CreateLicenseConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateLicenseConfigurationResponse(
        licenseConfigurationArn: json.containsKey('LicenseConfigurationArn')
            ? json['LicenseConfigurationArn'] as String
            : null,
      );
}

class DeleteLicenseConfigurationResponse {
  DeleteLicenseConfigurationResponse();
  static DeleteLicenseConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteLicenseConfigurationResponse();
}

/// A filter name and value pair that is used to return a more specific list of
/// results from a describe operation. Filters can be used to match a set of
/// resources by specific criteria, such as tags, attributes, or IDs. The
/// filters supported by a `Describe` operation are documented with the
/// `Describe` operation.
class Filter {
  /// Name of the filter. Filter names are case-sensitive.
  final String name;

  /// One or more filter values. Filter values are case-sensitive.
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetLicenseConfigurationResponse {
  /// Unique ID for the license configuration.
  final String licenseConfigurationId;

  /// ARN of the license configuration requested.
  final String licenseConfigurationArn;

  /// Name of the license configuration.
  final String name;

  /// Description of the license configuration.
  final String description;

  /// Dimension on which the licenses are counted (for example, instances,
  /// cores, sockets, or VCPUs).
  final String licenseCountingType;

  /// List of flexible text strings designating license rules.
  final List<String> licenseRules;

  /// Number of available licenses.
  final BigInt licenseCount;

  /// Sets the number of available licenses as a hard limit.
  final bool licenseCountHardLimit;

  /// Number of licenses assigned to resources.
  final BigInt consumedLicenses;

  /// License configuration status (active, etc.).
  final String status;

  /// Owner account ID for the license configuration.
  final String ownerAccountId;

  /// List of summaries for consumed licenses used by various resources.
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// List of summaries of managed resources.
  final List<ManagedResourceSummary> managedResourceSummaryList;

  /// List of tags attached to the license configuration.
  final List<Tag> tags;

  GetLicenseConfigurationResponse({
    this.licenseConfigurationId,
    this.licenseConfigurationArn,
    this.name,
    this.description,
    this.licenseCountingType,
    this.licenseRules,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.consumedLicenses,
    this.status,
    this.ownerAccountId,
    this.consumedLicenseSummaryList,
    this.managedResourceSummaryList,
    this.tags,
  });
  static GetLicenseConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetLicenseConfigurationResponse(
        licenseConfigurationId: json.containsKey('LicenseConfigurationId')
            ? json['LicenseConfigurationId'] as String
            : null,
        licenseConfigurationArn: json.containsKey('LicenseConfigurationArn')
            ? json['LicenseConfigurationArn'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        licenseCountingType: json.containsKey('LicenseCountingType')
            ? json['LicenseCountingType'] as String
            : null,
        licenseRules: json.containsKey('LicenseRules')
            ? (json['LicenseRules'] as List).map((e) => e as String).toList()
            : null,
        licenseCount: json.containsKey('LicenseCount')
            ? BigInt.from(json['LicenseCount'])
            : null,
        licenseCountHardLimit: json.containsKey('LicenseCountHardLimit')
            ? json['LicenseCountHardLimit'] as bool
            : null,
        consumedLicenses: json.containsKey('ConsumedLicenses')
            ? BigInt.from(json['ConsumedLicenses'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        ownerAccountId: json.containsKey('OwnerAccountId')
            ? json['OwnerAccountId'] as String
            : null,
        consumedLicenseSummaryList:
            json.containsKey('ConsumedLicenseSummaryList')
                ? (json['ConsumedLicenseSummaryList'] as List)
                    .map((e) => ConsumedLicenseSummary.fromJson(e))
                    .toList()
                : null,
        managedResourceSummaryList:
            json.containsKey('ManagedResourceSummaryList')
                ? (json['ManagedResourceSummaryList'] as List)
                    .map((e) => ManagedResourceSummary.fromJson(e))
                    .toList()
                : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class GetServiceSettingsResponse {
  /// Regional S3 bucket path for storing reports, license trail event data,
  /// discovery data, etc.
  final String s3BucketArn;

  /// SNS topic configured to receive notifications from License Manager.
  final String snsTopicArn;

  /// Indicates whether AWS Organizations has been integrated with License
  /// Manager for cross-account discovery.
  final OrganizationConfiguration organizationConfiguration;

  /// Indicates whether cross-account discovery has been enabled.
  final bool enableCrossAccountsDiscovery;

  GetServiceSettingsResponse({
    this.s3BucketArn,
    this.snsTopicArn,
    this.organizationConfiguration,
    this.enableCrossAccountsDiscovery,
  });
  static GetServiceSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetServiceSettingsResponse(
        s3BucketArn: json.containsKey('S3BucketArn')
            ? json['S3BucketArn'] as String
            : null,
        snsTopicArn: json.containsKey('SnsTopicArn')
            ? json['SnsTopicArn'] as String
            : null,
        organizationConfiguration: json.containsKey('OrganizationConfiguration')
            ? OrganizationConfiguration.fromJson(
                json['OrganizationConfiguration'])
            : null,
        enableCrossAccountsDiscovery:
            json.containsKey('EnableCrossAccountsDiscovery')
                ? json['EnableCrossAccountsDiscovery'] as bool
                : null,
      );
}

/// An inventory filter object.
class InventoryFilter {
  /// The name of the filter.
  final String name;

  /// The condition of the filter.
  final String condition;

  /// Value of the filter.
  final String value;

  InventoryFilter({
    @required this.name,
    @required this.condition,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A license configuration is an abstraction of a customer license agreement
/// that can be consumed and enforced by License Manager. Components include
/// specifications for the license type (licensing by instance, socket, CPU, or
/// VCPU), tenancy (shared tenancy, Amazon EC2 Dedicated Instance, Amazon EC2
/// Dedicated Host, or any of these), host affinity (how long a VM must be
/// associated with a host), the number of licenses purchased and used.
class LicenseConfiguration {
  /// Unique ID of the `LicenseConfiguration` object.
  final String licenseConfigurationId;

  /// ARN of the `LicenseConfiguration` object.
  final String licenseConfigurationArn;

  /// Name of the license configuration.
  final String name;

  /// Description of the license configuration.
  final String description;

  /// Dimension to use to track license inventory.
  final String licenseCountingType;

  /// Array of configured License Manager rules.
  final List<String> licenseRules;

  /// Number of licenses managed by the license configuration.
  final BigInt licenseCount;

  /// Sets the number of available licenses as a hard limit.
  final bool licenseCountHardLimit;

  /// Number of licenses consumed.
  final BigInt consumedLicenses;

  /// Status of the license configuration.
  final String status;

  /// Account ID of the license configuration's owner.
  final String ownerAccountId;

  /// List of summaries for licenses consumed by various resources.
  final List<ConsumedLicenseSummary> consumedLicenseSummaryList;

  /// List of summaries for managed resources.
  final List<ManagedResourceSummary> managedResourceSummaryList;

  LicenseConfiguration({
    this.licenseConfigurationId,
    this.licenseConfigurationArn,
    this.name,
    this.description,
    this.licenseCountingType,
    this.licenseRules,
    this.licenseCount,
    this.licenseCountHardLimit,
    this.consumedLicenses,
    this.status,
    this.ownerAccountId,
    this.consumedLicenseSummaryList,
    this.managedResourceSummaryList,
  });
  static LicenseConfiguration fromJson(Map<String, dynamic> json) =>
      LicenseConfiguration(
        licenseConfigurationId: json.containsKey('LicenseConfigurationId')
            ? json['LicenseConfigurationId'] as String
            : null,
        licenseConfigurationArn: json.containsKey('LicenseConfigurationArn')
            ? json['LicenseConfigurationArn'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        licenseCountingType: json.containsKey('LicenseCountingType')
            ? json['LicenseCountingType'] as String
            : null,
        licenseRules: json.containsKey('LicenseRules')
            ? (json['LicenseRules'] as List).map((e) => e as String).toList()
            : null,
        licenseCount: json.containsKey('LicenseCount')
            ? BigInt.from(json['LicenseCount'])
            : null,
        licenseCountHardLimit: json.containsKey('LicenseCountHardLimit')
            ? json['LicenseCountHardLimit'] as bool
            : null,
        consumedLicenses: json.containsKey('ConsumedLicenses')
            ? BigInt.from(json['ConsumedLicenses'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        ownerAccountId: json.containsKey('OwnerAccountId')
            ? json['OwnerAccountId'] as String
            : null,
        consumedLicenseSummaryList:
            json.containsKey('ConsumedLicenseSummaryList')
                ? (json['ConsumedLicenseSummaryList'] as List)
                    .map((e) => ConsumedLicenseSummary.fromJson(e))
                    .toList()
                : null,
        managedResourceSummaryList:
            json.containsKey('ManagedResourceSummaryList')
                ? (json['ManagedResourceSummaryList'] as List)
                    .map((e) => ManagedResourceSummary.fromJson(e))
                    .toList()
                : null,
      );
}

/// Describes a server resource that is associated with a license configuration.
class LicenseConfigurationAssociation {
  /// ARN of the resource associated with the license configuration.
  final String resourceArn;

  /// Type of server resource.
  final String resourceType;

  /// ID of the AWS account that owns the resource consuming licenses.
  final String resourceOwnerId;

  /// Time when the license configuration was associated with the resource.
  final DateTime associationTime;

  LicenseConfigurationAssociation({
    this.resourceArn,
    this.resourceType,
    this.resourceOwnerId,
    this.associationTime,
  });
  static LicenseConfigurationAssociation fromJson(Map<String, dynamic> json) =>
      LicenseConfigurationAssociation(
        resourceArn: json.containsKey('ResourceArn')
            ? json['ResourceArn'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceOwnerId: json.containsKey('ResourceOwnerId')
            ? json['ResourceOwnerId'] as String
            : null,
        associationTime: json.containsKey('AssociationTime')
            ? DateTime.parse(json['AssociationTime'])
            : null,
      );
}

/// Contains details of the usage of each resource from the license pool.
class LicenseConfigurationUsage {
  /// ARN of the resource associated with a license configuration.
  final String resourceArn;

  /// Type of resource associated with athe license configuration.
  final String resourceType;

  /// Status of a resource associated with the license configuration.
  final String resourceStatus;

  /// ID of the account that owns a resource that is associated with the license
  /// configuration.
  final String resourceOwnerId;

  /// Time when the license configuration was initially associated with a
  /// resource.
  final DateTime associationTime;

  /// Number of licenses consumed out of the total provisioned in the license
  /// configuration.
  final BigInt consumedLicenses;

  LicenseConfigurationUsage({
    this.resourceArn,
    this.resourceType,
    this.resourceStatus,
    this.resourceOwnerId,
    this.associationTime,
    this.consumedLicenses,
  });
  static LicenseConfigurationUsage fromJson(Map<String, dynamic> json) =>
      LicenseConfigurationUsage(
        resourceArn: json.containsKey('ResourceArn')
            ? json['ResourceArn'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceStatus: json.containsKey('ResourceStatus')
            ? json['ResourceStatus'] as String
            : null,
        resourceOwnerId: json.containsKey('ResourceOwnerId')
            ? json['ResourceOwnerId'] as String
            : null,
        associationTime: json.containsKey('AssociationTime')
            ? DateTime.parse(json['AssociationTime'])
            : null,
        consumedLicenses: json.containsKey('ConsumedLicenses')
            ? BigInt.from(json['ConsumedLicenses'])
            : null,
      );
}

/// Object used for associating a license configuration with a resource.
class LicenseSpecification {
  /// ARN of the `LicenseConfiguration` object.
  final String licenseConfigurationArn;

  LicenseSpecification({
    @required this.licenseConfigurationArn,
  });
  static LicenseSpecification fromJson(Map<String, dynamic> json) =>
      LicenseSpecification(
        licenseConfigurationArn: json['LicenseConfigurationArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListAssociationsForLicenseConfigurationResponse {
  /// Lists association objects for the license configuration, each containing
  /// the association time, number of consumed licenses, resource ARN, resource
  /// ID, account ID that owns the resource, resource size, and resource type.
  final List<LicenseConfigurationAssociation> licenseConfigurationAssociations;

  /// Token for the next set of results.
  final String nextToken;

  ListAssociationsForLicenseConfigurationResponse({
    this.licenseConfigurationAssociations,
    this.nextToken,
  });
  static ListAssociationsForLicenseConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      ListAssociationsForLicenseConfigurationResponse(
        licenseConfigurationAssociations:
            json.containsKey('LicenseConfigurationAssociations')
                ? (json['LicenseConfigurationAssociations'] as List)
                    .map((e) => LicenseConfigurationAssociation.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListLicenseConfigurationsResponse {
  /// Array of license configuration objects.
  final List<LicenseConfiguration> licenseConfigurations;

  /// Token for the next set of results.
  final String nextToken;

  ListLicenseConfigurationsResponse({
    this.licenseConfigurations,
    this.nextToken,
  });
  static ListLicenseConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListLicenseConfigurationsResponse(
        licenseConfigurations: json.containsKey('LicenseConfigurations')
            ? (json['LicenseConfigurations'] as List)
                .map((e) => LicenseConfiguration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListLicenseSpecificationsForResourceResponse {
  /// License configurations associated with a resource.
  final List<LicenseSpecification> licenseSpecifications;

  /// Token for the next set of results.
  final String nextToken;

  ListLicenseSpecificationsForResourceResponse({
    this.licenseSpecifications,
    this.nextToken,
  });
  static ListLicenseSpecificationsForResourceResponse fromJson(
          Map<String, dynamic> json) =>
      ListLicenseSpecificationsForResourceResponse(
        licenseSpecifications: json.containsKey('LicenseSpecifications')
            ? (json['LicenseSpecifications'] as List)
                .map((e) => LicenseSpecification.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListResourceInventoryResponse {
  /// The detailed list of resources.
  final List<ResourceInventory> resourceInventoryList;

  /// Token for the next set of results.
  final String nextToken;

  ListResourceInventoryResponse({
    this.resourceInventoryList,
    this.nextToken,
  });
  static ListResourceInventoryResponse fromJson(Map<String, dynamic> json) =>
      ListResourceInventoryResponse(
        resourceInventoryList: json.containsKey('ResourceInventoryList')
            ? (json['ResourceInventoryList'] as List)
                .map((e) => ResourceInventory.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// List of tags attached to the resource.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class ListUsageForLicenseConfigurationResponse {
  /// An array of `LicenseConfigurationUsage` objects.
  final List<LicenseConfigurationUsage> licenseConfigurationUsageList;

  /// Token for the next set of results.
  final String nextToken;

  ListUsageForLicenseConfigurationResponse({
    this.licenseConfigurationUsageList,
    this.nextToken,
  });
  static ListUsageForLicenseConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      ListUsageForLicenseConfigurationResponse(
        licenseConfigurationUsageList:
            json.containsKey('LicenseConfigurationUsageList')
                ? (json['LicenseConfigurationUsageList'] as List)
                    .map((e) => LicenseConfigurationUsage.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Summary for a resource.
class ManagedResourceSummary {
  /// Type of resource associated with a license (instance, host, or AMI).
  final String resourceType;

  /// Number of resources associated with licenses.
  final BigInt associationCount;

  ManagedResourceSummary({
    this.resourceType,
    this.associationCount,
  });
  static ManagedResourceSummary fromJson(Map<String, dynamic> json) =>
      ManagedResourceSummary(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        associationCount: json.containsKey('AssociationCount')
            ? BigInt.from(json['AssociationCount'])
            : null,
      );
}

/// Object containing configuration information for AWS Organizations.
class OrganizationConfiguration {
  /// Flag to activate AWS Organization integration.
  final bool enableIntegration;

  OrganizationConfiguration({
    @required this.enableIntegration,
  });
  static OrganizationConfiguration fromJson(Map<String, dynamic> json) =>
      OrganizationConfiguration(
        enableIntegration: json['EnableIntegration'] as bool,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A set of attributes that describe a resource.
class ResourceInventory {
  /// Unique ID of the resource.
  final String resourceId;

  /// The type of resource.
  final String resourceType;

  /// The ARN of the resource.
  final String resourceArn;

  /// The platform of the resource.
  final String platform;

  /// Platform version of the resource in the inventory.
  final String platformVersion;

  /// Unique ID of the account that owns the resource.
  final String resourceOwningAccountId;

  ResourceInventory({
    this.resourceId,
    this.resourceType,
    this.resourceArn,
    this.platform,
    this.platformVersion,
    this.resourceOwningAccountId,
  });
  static ResourceInventory fromJson(Map<String, dynamic> json) =>
      ResourceInventory(
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceArn: json.containsKey('ResourceArn')
            ? json['ResourceArn'] as String
            : null,
        platform:
            json.containsKey('Platform') ? json['Platform'] as String : null,
        platformVersion: json.containsKey('PlatformVersion')
            ? json['PlatformVersion'] as String
            : null,
        resourceOwningAccountId: json.containsKey('ResourceOwningAccountId')
            ? json['ResourceOwningAccountId'] as String
            : null,
      );
}

/// Tag for a resource in a key-value format.
class Tag {
  /// Key for the resource tag.
  final String key;

  /// Value for the resource tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
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

class UpdateLicenseConfigurationResponse {
  UpdateLicenseConfigurationResponse();
  static UpdateLicenseConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateLicenseConfigurationResponse();
}

class UpdateLicenseSpecificationsForResourceResponse {
  UpdateLicenseSpecificationsForResourceResponse();
  static UpdateLicenseSpecificationsForResourceResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateLicenseSpecificationsForResourceResponse();
}

class UpdateServiceSettingsResponse {
  UpdateServiceSettingsResponse();
  static UpdateServiceSettingsResponse fromJson(Map<String, dynamic> json) =>
      UpdateServiceSettingsResponse();
}
