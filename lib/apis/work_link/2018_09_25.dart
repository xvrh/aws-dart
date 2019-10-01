import 'package:meta/meta.dart';

/// Amazon WorkLink is a cloud-based service that provides secure access to
/// internal websites and web apps from iOS phones. In a single step, your
/// users, such as employees, can access internal websites as efficiently as
/// they access any other public website. They enter a URL in their web browser,
/// or choose a link to an internal website in an email. Amazon WorkLink
/// authenticates the user's access and securely renders authorized internal web
/// content in a secure rendering service in the AWS cloud. Amazon WorkLink
/// doesn't download or store any internal web content on mobile devices.
class WorkLinkApi {
  /// Specifies a domain to be associated to Amazon WorkLink.
  Future<void> associateDomain(
      {@required String fleetArn,
      @required String domainName,
      String displayName,
      @required String acmCertificateArn}) async {}

  /// Associates a website authorization provider with a specified fleet. This
  /// is used to authorize users against associated websites in the company
  /// network.
  Future<void> associateWebsiteAuthorizationProvider(
      {@required String fleetArn,
      @required String authorizationProviderType,
      String domainName}) async {}

  /// Imports the root certificate of a certificate authority (CA) used to
  /// obtain TLS certificates used by associated websites within the company
  /// network.
  Future<void> associateWebsiteCertificateAuthority(
      {@required String fleetArn,
      @required String certificate,
      String displayName}) async {}

  /// Creates a fleet. A fleet consists of resources and the configuration that
  /// delivers associated websites to authorized users who download and set up
  /// the Amazon WorkLink app.
  Future<void> createFleet(String fleetName,
      {String displayName, bool optimizeForEndUserLocation}) async {}

  /// Deletes a fleet. Prevents users from accessing previously associated
  /// websites.
  Future<void> deleteFleet(String fleetArn) async {}

  /// Describes the configuration for delivering audit streams to the customer
  /// account.
  Future<void> describeAuditStreamConfiguration(String fleetArn) async {}

  /// Describes the networking configuration to access the internal websites
  /// associated with the specified fleet.
  Future<void> describeCompanyNetworkConfiguration(String fleetArn) async {}

  /// Provides information about a user's device.
  Future<void> describeDevice(
      {@required String fleetArn, @required String deviceId}) async {}

  /// Describes the device policy configuration for the specified fleet.
  Future<void> describeDevicePolicyConfiguration(String fleetArn) async {}

  /// Provides information about the domain.
  Future<void> describeDomain(
      {@required String fleetArn, @required String domainName}) async {}

  /// Provides basic information for the specified fleet, excluding identity
  /// provider, networking, and device configuration details.
  Future<void> describeFleetMetadata(String fleetArn) async {}

  /// Describes the identity provider configuration of the specified fleet.
  Future<void> describeIdentityProviderConfiguration(String fleetArn) async {}

  /// Provides information about the certificate authority.
  Future<void> describeWebsiteCertificateAuthority(
      {@required String fleetArn, @required String websiteCaId}) async {}

  /// Disassociates a domain from Amazon WorkLink. End users lose the ability to
  /// access the domain with Amazon WorkLink.
  Future<void> disassociateDomain(
      {@required String fleetArn, @required String domainName}) async {}

  /// Disassociates a website authorization provider from a specified fleet.
  /// After the disassociation, users can't load any associated websites that
  /// require this authorization provider.
  Future<void> disassociateWebsiteAuthorizationProvider(
      {@required String fleetArn,
      @required String authorizationProviderId}) async {}

  /// Removes a certificate authority (CA).
  Future<void> disassociateWebsiteCertificateAuthority(
      {@required String fleetArn, @required String websiteCaId}) async {}

  /// Retrieves a list of devices registered with the specified fleet.
  Future<void> listDevices(String fleetArn,
      {String nextToken, int maxResults}) async {}

  /// Retrieves a list of domains associated to a specified fleet.
  Future<void> listDomains(String fleetArn,
      {String nextToken, int maxResults}) async {}

  /// Retrieves a list of fleets for the current account and Region.
  Future<void> listFleets({String nextToken, int maxResults}) async {}

  /// Retrieves a list of website authorization providers associated with a
  /// specified fleet.
  Future<void> listWebsiteAuthorizationProviders(String fleetArn,
      {String nextToken, int maxResults}) async {}

  /// Retrieves a list of certificate authorities added for the current account
  /// and Region.
  Future<void> listWebsiteCertificateAuthorities(String fleetArn,
      {int maxResults, String nextToken}) async {}

  /// Moves a domain to ACTIVE status if it was in the INACTIVE status.
  Future<void> restoreDomainAccess(
      {@required String fleetArn, @required String domainName}) async {}

  /// Moves a domain to INACTIVE status if it was in the ACTIVE status.
  Future<void> revokeDomainAccess(
      {@required String fleetArn, @required String domainName}) async {}

  /// Signs the user out from all of their devices. The user can sign in again
  /// if they have valid credentials.
  Future<void> signOutUser(
      {@required String fleetArn, @required String username}) async {}

  /// Updates the audit stream configuration for the fleet.
  Future<void> updateAuditStreamConfiguration(String fleetArn,
      {String auditStreamArn}) async {}

  /// Updates the company network configuration for the fleet.
  Future<void> updateCompanyNetworkConfiguration(
      {@required String fleetArn,
      @required String vpcId,
      @required List<String> subnetIds,
      @required List<String> securityGroupIds}) async {}

  /// Updates the device policy configuration for the fleet.
  Future<void> updateDevicePolicyConfiguration(String fleetArn,
      {String deviceCaCertificate}) async {}

  /// Updates domain metadata, such as DisplayName.
  Future<void> updateDomainMetadata(
      {@required String fleetArn,
      @required String domainName,
      String displayName}) async {}

  /// Updates fleet metadata, such as DisplayName.
  Future<void> updateFleetMetadata(String fleetArn,
      {String displayName, bool optimizeForEndUserLocation}) async {}

  /// Updates the identity provider configuration for the fleet.
  Future<void> updateIdentityProviderConfiguration(
      {@required String fleetArn,
      @required String identityProviderType,
      String identityProviderSamlMetadata}) async {}
}

class AssociateDomainResponse {}

class AssociateWebsiteAuthorizationProviderResponse {}

class AssociateWebsiteCertificateAuthorityResponse {}

class CreateFleetResponse {}

class DeleteFleetResponse {}

class DescribeAuditStreamConfigurationResponse {}

class DescribeCompanyNetworkConfigurationResponse {}

class DescribeDevicePolicyConfigurationResponse {}

class DescribeDeviceResponse {}

class DescribeDomainResponse {}

class DescribeFleetMetadataResponse {}

class DescribeIdentityProviderConfigurationResponse {}

class DescribeWebsiteCertificateAuthorityResponse {}

class DeviceSummary {}

class DisassociateDomainResponse {}

class DisassociateWebsiteAuthorizationProviderResponse {}

class DisassociateWebsiteCertificateAuthorityResponse {}

class DomainSummary {}

class FleetSummary {}

class ListDevicesResponse {}

class ListDomainsResponse {}

class ListFleetsResponse {}

class ListWebsiteAuthorizationProvidersResponse {}

class ListWebsiteCertificateAuthoritiesResponse {}

class RestoreDomainAccessResponse {}

class RevokeDomainAccessResponse {}

class SignOutUserResponse {}

class UpdateAuditStreamConfigurationResponse {}

class UpdateCompanyNetworkConfigurationResponse {}

class UpdateDevicePolicyConfigurationResponse {}

class UpdateDomainMetadataResponse {}

class UpdateFleetMetadataResponse {}

class UpdateIdentityProviderConfigurationResponse {}

class WebsiteAuthorizationProviderSummary {}

class WebsiteCaSummary {}
