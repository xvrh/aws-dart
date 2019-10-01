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
  /// Creates a new license configuration object. A license configuration is an
  /// abstraction of a customer license agreement that can be consumed and
  /// enforced by License Manager. Components include specifications for the
  /// license type (licensing by instance, socket, CPU, or VCPU), tenancy
  /// (shared tenancy, Amazon EC2 Dedicated Instance, Amazon EC2 Dedicated Host,
  /// or any of these), host affinity (how long a VM must be associated with a
  /// host), the number of licenses purchased and used.
  Future<void> createLicenseConfiguration(
      {@required String name,
      String description,
      @required String licenseCountingType,
      BigInt licenseCount,
      bool licenseCountHardLimit,
      List<String> licenseRules,
      List<Tag> tags}) async {}

  /// Deletes an existing license configuration. This action fails if the
  /// configuration is in use.
  Future<void> deleteLicenseConfiguration(
      String licenseConfigurationArn) async {}

  /// Returns a detailed description of a license configuration.
  Future<void> getLicenseConfiguration(String licenseConfigurationArn) async {}

  /// Gets License Manager settings for a region. Exposes the configured S3
  /// bucket, SNS topic, etc., for inspection.
  Future<void> getServiceSettings() async {}

  /// Lists the resource associations for a license configuration. Resource
  /// associations need not consume licenses from a license configuration. For
  /// example, an AMI or a stopped instance may not consume a license (depending
  /// on the license rules). Use this operation to find all resources associated
  /// with a license configuration.
  Future<void> listAssociationsForLicenseConfiguration(
      String licenseConfigurationArn,
      {int maxResults,
      String nextToken}) async {}

  /// Lists license configuration objects for an account, each containing the
  /// name, description, license type, and other license terms modeled from a
  /// license agreement.
  Future<void> listLicenseConfigurations(
      {List<String> licenseConfigurationArns,
      int maxResults,
      String nextToken,
      List<Filter> filters}) async {}

  /// Returns the license configuration for a resource.
  Future<void> listLicenseSpecificationsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Returns a detailed list of resources.
  Future<void> listResourceInventory(
      {int maxResults,
      String nextToken,
      List<InventoryFilter> filters}) async {}

  /// Lists tags attached to a resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists all license usage records for a license configuration, displaying
  /// license consumption details by resource at a selected point in time. Use
  /// this action to audit the current license consumption for any license
  /// inventory and configuration.
  Future<void> listUsageForLicenseConfiguration(String licenseConfigurationArn,
      {int maxResults, String nextToken, List<Filter> filters}) async {}

  /// Attach one of more tags to any resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Remove tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Modifies the attributes of an existing license configuration object. A
  /// license configuration is an abstraction of a customer license agreement
  /// that can be consumed and enforced by License Manager. Components include
  /// specifications for the license type (Instances, cores, sockets, VCPUs),
  /// tenancy (shared or Dedicated Host), host affinity (how long a VM is
  /// associated with a host), the number of licenses purchased and used.
  Future<void> updateLicenseConfiguration(String licenseConfigurationArn,
      {String licenseConfigurationStatus,
      List<String> licenseRules,
      BigInt licenseCount,
      bool licenseCountHardLimit,
      String name,
      String description}) async {}

  /// Adds or removes license configurations for a specified AWS resource. This
  /// operation currently supports updating the license specifications of AMIs,
  /// instances, and hosts. Launch templates and AWS CloudFormation templates
  /// are not managed from this operation as those resources send the license
  /// configurations directly to a resource creation operation, such as
  /// `RunInstances`.
  Future<void> updateLicenseSpecificationsForResource(String resourceArn,
      {List<LicenseSpecification> addLicenseSpecifications,
      List<LicenseSpecification> removeLicenseSpecifications}) async {}

  /// Updates License Manager service settings.
  Future<void> updateServiceSettings(
      {String s3BucketArn,
      String snsTopicArn,
      OrganizationConfiguration organizationConfiguration,
      bool enableCrossAccountsDiscovery}) async {}
}

class ConsumedLicenseSummary {}

class CreateLicenseConfigurationResponse {}

class DeleteLicenseConfigurationResponse {}

class Filter {}

class GetLicenseConfigurationResponse {}

class GetServiceSettingsResponse {}

class InventoryFilter {}

class LicenseConfiguration {}

class LicenseConfigurationAssociation {}

class LicenseConfigurationUsage {}

class LicenseSpecification {}

class ListAssociationsForLicenseConfigurationResponse {}

class ListLicenseConfigurationsResponse {}

class ListLicenseSpecificationsForResourceResponse {}

class ListResourceInventoryResponse {}

class ListTagsForResourceResponse {}

class ListUsageForLicenseConfigurationResponse {}

class ManagedResourceSummary {}

class OrganizationConfiguration {}

class ResourceInventory {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateLicenseConfigurationResponse {}

class UpdateLicenseSpecificationsForResourceResponse {}

class UpdateServiceSettingsResponse {}
