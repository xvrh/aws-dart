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
  ///
  /// [fleetArn]: The Amazon Resource Name (ARN) of the fleet.
  ///
  /// [domainName]: The fully qualified domain name (FQDN).
  ///
  /// [displayName]: The name to display.
  ///
  /// [acmCertificateArn]: The ARN of an issued ACM certificate that is valid
  /// for the domain being associated.
  Future<AssociateDomainResponse> associateDomain(
      {@required String fleetArn,
      @required String domainName,
      String displayName,
      @required String acmCertificateArn}) async {
    return AssociateDomainResponse.fromJson({});
  }

  /// Associates a website authorization provider with a specified fleet. This
  /// is used to authorize users against associated websites in the company
  /// network.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [authorizationProviderType]: The authorization provider type.
  ///
  /// [domainName]: The domain name of the authorization provider. This applies
  /// only to SAML-based authorization providers.
  Future<AssociateWebsiteAuthorizationProviderResponse>
      associateWebsiteAuthorizationProvider(
          {@required String fleetArn,
          @required String authorizationProviderType,
          String domainName}) async {
    return AssociateWebsiteAuthorizationProviderResponse.fromJson({});
  }

  /// Imports the root certificate of a certificate authority (CA) used to
  /// obtain TLS certificates used by associated websites within the company
  /// network.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [certificate]: The root certificate of the CA.
  ///
  /// [displayName]: The certificate name to display.
  Future<AssociateWebsiteCertificateAuthorityResponse>
      associateWebsiteCertificateAuthority(
          {@required String fleetArn,
          @required String certificate,
          String displayName}) async {
    return AssociateWebsiteCertificateAuthorityResponse.fromJson({});
  }

  /// Creates a fleet. A fleet consists of resources and the configuration that
  /// delivers associated websites to authorized users who download and set up
  /// the Amazon WorkLink app.
  ///
  /// [fleetName]: A unique name for the fleet.
  ///
  /// [displayName]: The fleet name to display.
  ///
  /// [optimizeForEndUserLocation]: The option to optimize for better
  /// performance by routing traffic through the closest AWS Region to users,
  /// which may be outside of your home Region.
  Future<CreateFleetResponse> createFleet(String fleetName,
      {String displayName, bool optimizeForEndUserLocation}) async {
    return CreateFleetResponse.fromJson({});
  }

  /// Deletes a fleet. Prevents users from accessing previously associated
  /// websites.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DeleteFleetResponse> deleteFleet(String fleetArn) async {
    return DeleteFleetResponse.fromJson({});
  }

  /// Describes the configuration for delivering audit streams to the customer
  /// account.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeAuditStreamConfigurationResponse>
      describeAuditStreamConfiguration(String fleetArn) async {
    return DescribeAuditStreamConfigurationResponse.fromJson({});
  }

  /// Describes the networking configuration to access the internal websites
  /// associated with the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeCompanyNetworkConfigurationResponse>
      describeCompanyNetworkConfiguration(String fleetArn) async {
    return DescribeCompanyNetworkConfigurationResponse.fromJson({});
  }

  /// Provides information about a user's device.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [deviceId]: A unique identifier for a registered user's device.
  Future<DescribeDeviceResponse> describeDevice(
      {@required String fleetArn, @required String deviceId}) async {
    return DescribeDeviceResponse.fromJson({});
  }

  /// Describes the device policy configuration for the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeDevicePolicyConfigurationResponse>
      describeDevicePolicyConfiguration(String fleetArn) async {
    return DescribeDevicePolicyConfigurationResponse.fromJson({});
  }

  /// Provides information about the domain.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<DescribeDomainResponse> describeDomain(
      {@required String fleetArn, @required String domainName}) async {
    return DescribeDomainResponse.fromJson({});
  }

  /// Provides basic information for the specified fleet, excluding identity
  /// provider, networking, and device configuration details.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeFleetMetadataResponse> describeFleetMetadata(
      String fleetArn) async {
    return DescribeFleetMetadataResponse.fromJson({});
  }

  /// Describes the identity provider configuration of the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeIdentityProviderConfigurationResponse>
      describeIdentityProviderConfiguration(String fleetArn) async {
    return DescribeIdentityProviderConfigurationResponse.fromJson({});
  }

  /// Provides information about the certificate authority.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [websiteCaId]: A unique identifier for the certificate authority.
  Future<DescribeWebsiteCertificateAuthorityResponse>
      describeWebsiteCertificateAuthority(
          {@required String fleetArn, @required String websiteCaId}) async {
    return DescribeWebsiteCertificateAuthorityResponse.fromJson({});
  }

  /// Disassociates a domain from Amazon WorkLink. End users lose the ability to
  /// access the domain with Amazon WorkLink.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<DisassociateDomainResponse> disassociateDomain(
      {@required String fleetArn, @required String domainName}) async {
    return DisassociateDomainResponse.fromJson({});
  }

  /// Disassociates a website authorization provider from a specified fleet.
  /// After the disassociation, users can't load any associated websites that
  /// require this authorization provider.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [authorizationProviderId]: A unique identifier for the authorization
  /// provider.
  Future<DisassociateWebsiteAuthorizationProviderResponse>
      disassociateWebsiteAuthorizationProvider(
          {@required String fleetArn,
          @required String authorizationProviderId}) async {
    return DisassociateWebsiteAuthorizationProviderResponse.fromJson({});
  }

  /// Removes a certificate authority (CA).
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [websiteCaId]: A unique identifier for the CA.
  Future<DisassociateWebsiteCertificateAuthorityResponse>
      disassociateWebsiteCertificateAuthority(
          {@required String fleetArn, @required String websiteCaId}) async {
    return DisassociateWebsiteCertificateAuthorityResponse.fromJson({});
  }

  /// Retrieves a list of devices registered with the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [nextToken]: The pagination token used to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [maxResults]: The maximum number of results to be included in the next
  /// page.
  Future<ListDevicesResponse> listDevices(String fleetArn,
      {String nextToken, int maxResults}) async {
    return ListDevicesResponse.fromJson({});
  }

  /// Retrieves a list of domains associated to a specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [nextToken]: The pagination token used to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [maxResults]: The maximum number of results to be included in the next
  /// page.
  Future<ListDomainsResponse> listDomains(String fleetArn,
      {String nextToken, int maxResults}) async {
    return ListDomainsResponse.fromJson({});
  }

  /// Retrieves a list of fleets for the current account and Region.
  ///
  /// [nextToken]: The pagination token used to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [maxResults]: The maximum number of results to be included in the next
  /// page.
  Future<ListFleetsResponse> listFleets(
      {String nextToken, int maxResults}) async {
    return ListFleetsResponse.fromJson({});
  }

  /// Retrieves a list of website authorization providers associated with a
  /// specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [maxResults]: The maximum number of results to be included in the next
  /// page.
  Future<ListWebsiteAuthorizationProvidersResponse>
      listWebsiteAuthorizationProviders(String fleetArn,
          {String nextToken, int maxResults}) async {
    return ListWebsiteAuthorizationProvidersResponse.fromJson({});
  }

  /// Retrieves a list of certificate authorities added for the current account
  /// and Region.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [maxResults]: The maximum number of results to be included in the next
  /// page.
  ///
  /// [nextToken]: The pagination token used to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<ListWebsiteCertificateAuthoritiesResponse>
      listWebsiteCertificateAuthorities(String fleetArn,
          {int maxResults, String nextToken}) async {
    return ListWebsiteCertificateAuthoritiesResponse.fromJson({});
  }

  /// Moves a domain to ACTIVE status if it was in the INACTIVE status.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<RestoreDomainAccessResponse> restoreDomainAccess(
      {@required String fleetArn, @required String domainName}) async {
    return RestoreDomainAccessResponse.fromJson({});
  }

  /// Moves a domain to INACTIVE status if it was in the ACTIVE status.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<RevokeDomainAccessResponse> revokeDomainAccess(
      {@required String fleetArn, @required String domainName}) async {
    return RevokeDomainAccessResponse.fromJson({});
  }

  /// Signs the user out from all of their devices. The user can sign in again
  /// if they have valid credentials.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [username]: The name of the user.
  Future<SignOutUserResponse> signOutUser(
      {@required String fleetArn, @required String username}) async {
    return SignOutUserResponse.fromJson({});
  }

  /// Updates the audit stream configuration for the fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [auditStreamArn]: The ARN of the Amazon Kinesis data stream that receives
  /// the audit events.
  Future<UpdateAuditStreamConfigurationResponse> updateAuditStreamConfiguration(
      String fleetArn,
      {String auditStreamArn}) async {
    return UpdateAuditStreamConfigurationResponse.fromJson({});
  }

  /// Updates the company network configuration for the fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [vpcId]: The VPC with connectivity to associated websites.
  ///
  /// [subnetIds]: The subnets used for X-ENI connections from Amazon WorkLink
  /// rendering containers.
  ///
  /// [securityGroupIds]: The security groups associated with access to the
  /// provided subnets.
  Future<UpdateCompanyNetworkConfigurationResponse>
      updateCompanyNetworkConfiguration(
          {@required String fleetArn,
          @required String vpcId,
          @required List<String> subnetIds,
          @required List<String> securityGroupIds}) async {
    return UpdateCompanyNetworkConfigurationResponse.fromJson({});
  }

  /// Updates the device policy configuration for the fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [deviceCaCertificate]: The certificate chain, including intermediate
  /// certificates and the root certificate authority certificate used to issue
  /// device certificates.
  Future<UpdateDevicePolicyConfigurationResponse>
      updateDevicePolicyConfiguration(String fleetArn,
          {String deviceCaCertificate}) async {
    return UpdateDevicePolicyConfigurationResponse.fromJson({});
  }

  /// Updates domain metadata, such as DisplayName.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  ///
  /// [displayName]: The name to display.
  Future<UpdateDomainMetadataResponse> updateDomainMetadata(
      {@required String fleetArn,
      @required String domainName,
      String displayName}) async {
    return UpdateDomainMetadataResponse.fromJson({});
  }

  /// Updates fleet metadata, such as DisplayName.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [displayName]: The fleet name to display. The existing DisplayName is
  /// unset if null is passed.
  ///
  /// [optimizeForEndUserLocation]: The option to optimize for better
  /// performance by routing traffic through the closest AWS Region to users,
  /// which may be outside of your home Region.
  Future<UpdateFleetMetadataResponse> updateFleetMetadata(String fleetArn,
      {String displayName, bool optimizeForEndUserLocation}) async {
    return UpdateFleetMetadataResponse.fromJson({});
  }

  /// Updates the identity provider configuration for the fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [identityProviderType]: The type of identity provider.
  ///
  /// [identityProviderSamlMetadata]: The SAML metadata document provided by the
  /// customer’s identity provider. The existing IdentityProviderSamlMetadata is
  /// unset if null is passed.
  Future<UpdateIdentityProviderConfigurationResponse>
      updateIdentityProviderConfiguration(
          {@required String fleetArn,
          @required String identityProviderType,
          String identityProviderSamlMetadata}) async {
    return UpdateIdentityProviderConfigurationResponse.fromJson({});
  }
}

class AssociateDomainResponse {
  AssociateDomainResponse();
  static AssociateDomainResponse fromJson(Map<String, dynamic> json) =>
      AssociateDomainResponse();
}

class AssociateWebsiteAuthorizationProviderResponse {
  /// A unique identifier for the authorization provider.
  final String authorizationProviderId;

  AssociateWebsiteAuthorizationProviderResponse({
    this.authorizationProviderId,
  });
  static AssociateWebsiteAuthorizationProviderResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateWebsiteAuthorizationProviderResponse();
}

class AssociateWebsiteCertificateAuthorityResponse {
  /// A unique identifier for the CA.
  final String websiteCaId;

  AssociateWebsiteCertificateAuthorityResponse({
    this.websiteCaId,
  });
  static AssociateWebsiteCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateWebsiteCertificateAuthorityResponse();
}

class CreateFleetResponse {
  /// The ARN of the fleet.
  final String fleetArn;

  CreateFleetResponse({
    this.fleetArn,
  });
  static CreateFleetResponse fromJson(Map<String, dynamic> json) =>
      CreateFleetResponse();
}

class DeleteFleetResponse {
  DeleteFleetResponse();
  static DeleteFleetResponse fromJson(Map<String, dynamic> json) =>
      DeleteFleetResponse();
}

class DescribeAuditStreamConfigurationResponse {
  /// The ARN of the Amazon Kinesis data stream that will receive the audit
  /// events.
  final String auditStreamArn;

  DescribeAuditStreamConfigurationResponse({
    this.auditStreamArn,
  });
  static DescribeAuditStreamConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAuditStreamConfigurationResponse();
}

class DescribeCompanyNetworkConfigurationResponse {
  /// The VPC with connectivity to associated websites.
  final String vpcId;

  /// The subnets used for X-ENI connections from Amazon WorkLink rendering
  /// containers.
  final List<String> subnetIds;

  /// The security groups associated with access to the provided subnets.
  final List<String> securityGroupIds;

  DescribeCompanyNetworkConfigurationResponse({
    this.vpcId,
    this.subnetIds,
    this.securityGroupIds,
  });
  static DescribeCompanyNetworkConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeCompanyNetworkConfigurationResponse();
}

class DescribeDevicePolicyConfigurationResponse {
  /// The certificate chain, including intermediate certificates and the root
  /// certificate authority certificate used to issue device certificates.
  final String deviceCaCertificate;

  DescribeDevicePolicyConfigurationResponse({
    this.deviceCaCertificate,
  });
  static DescribeDevicePolicyConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDevicePolicyConfigurationResponse();
}

class DescribeDeviceResponse {
  /// The current state of the device.
  final String status;

  /// The model of the device.
  final String model;

  /// The manufacturer of the device.
  final String manufacturer;

  /// The operating system of the device.
  final String operatingSystem;

  /// The operating system version of the device.
  final String operatingSystemVersion;

  /// The operating system patch level of the device.
  final String patchLevel;

  /// The date that the device first signed in to Amazon WorkLink.
  final DateTime firstAccessedTime;

  /// The date that the device last accessed Amazon WorkLink.
  final DateTime lastAccessedTime;

  /// The user name associated with the device.
  final String username;

  DescribeDeviceResponse({
    this.status,
    this.model,
    this.manufacturer,
    this.operatingSystem,
    this.operatingSystemVersion,
    this.patchLevel,
    this.firstAccessedTime,
    this.lastAccessedTime,
    this.username,
  });
  static DescribeDeviceResponse fromJson(Map<String, dynamic> json) =>
      DescribeDeviceResponse();
}

class DescribeDomainResponse {
  /// The name of the domain.
  final String domainName;

  /// The name to display.
  final String displayName;

  /// The time that the domain was added.
  final DateTime createdTime;

  /// The current state for the domain.
  final String domainStatus;

  /// The ARN of an issued ACM certificate that is valid for the domain being
  /// associated.
  final String acmCertificateArn;

  DescribeDomainResponse({
    this.domainName,
    this.displayName,
    this.createdTime,
    this.domainStatus,
    this.acmCertificateArn,
  });
  static DescribeDomainResponse fromJson(Map<String, dynamic> json) =>
      DescribeDomainResponse();
}

class DescribeFleetMetadataResponse {
  /// The time that the fleet was created.
  final DateTime createdTime;

  /// The time that the fleet was last updated.
  final DateTime lastUpdatedTime;

  /// The name of the fleet.
  final String fleetName;

  /// The name to display.
  final String displayName;

  /// The option to optimize for better performance by routing traffic through
  /// the closest AWS Region to users, which may be outside of your home Region.
  final bool optimizeForEndUserLocation;

  /// The identifier used by users to sign in to the Amazon WorkLink app.
  final String companyCode;

  /// The current state of the fleet.
  final String fleetStatus;

  DescribeFleetMetadataResponse({
    this.createdTime,
    this.lastUpdatedTime,
    this.fleetName,
    this.displayName,
    this.optimizeForEndUserLocation,
    this.companyCode,
    this.fleetStatus,
  });
  static DescribeFleetMetadataResponse fromJson(Map<String, dynamic> json) =>
      DescribeFleetMetadataResponse();
}

class DescribeIdentityProviderConfigurationResponse {
  /// The type of identity provider.
  final String identityProviderType;

  /// The SAML metadata document uploaded to the user’s identity provider.
  final String serviceProviderSamlMetadata;

  /// The SAML metadata document provided by the user’s identity provider.
  final String identityProviderSamlMetadata;

  DescribeIdentityProviderConfigurationResponse({
    this.identityProviderType,
    this.serviceProviderSamlMetadata,
    this.identityProviderSamlMetadata,
  });
  static DescribeIdentityProviderConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeIdentityProviderConfigurationResponse();
}

class DescribeWebsiteCertificateAuthorityResponse {
  /// The root certificate of the certificate authority.
  final String certificate;

  /// The time that the certificate authority was added.
  final DateTime createdTime;

  /// The certificate name to display.
  final String displayName;

  DescribeWebsiteCertificateAuthorityResponse({
    this.certificate,
    this.createdTime,
    this.displayName,
  });
  static DescribeWebsiteCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeWebsiteCertificateAuthorityResponse();
}

class DeviceSummary {
  /// The ID of the device.
  final String deviceId;

  /// The status of the device.
  final String deviceStatus;

  DeviceSummary({
    this.deviceId,
    this.deviceStatus,
  });
  static DeviceSummary fromJson(Map<String, dynamic> json) => DeviceSummary();
}

class DisassociateDomainResponse {
  DisassociateDomainResponse();
  static DisassociateDomainResponse fromJson(Map<String, dynamic> json) =>
      DisassociateDomainResponse();
}

class DisassociateWebsiteAuthorizationProviderResponse {
  DisassociateWebsiteAuthorizationProviderResponse();
  static DisassociateWebsiteAuthorizationProviderResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateWebsiteAuthorizationProviderResponse();
}

class DisassociateWebsiteCertificateAuthorityResponse {
  DisassociateWebsiteCertificateAuthorityResponse();
  static DisassociateWebsiteCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateWebsiteCertificateAuthorityResponse();
}

class DomainSummary {
  /// The name of the domain.
  final String domainName;

  /// The name to display.
  final String displayName;

  /// The time that the domain was created.
  final DateTime createdTime;

  /// The status of the domain.
  final String domainStatus;

  DomainSummary({
    @required this.domainName,
    this.displayName,
    @required this.createdTime,
    @required this.domainStatus,
  });
  static DomainSummary fromJson(Map<String, dynamic> json) => DomainSummary();
}

class FleetSummary {
  /// The ARN of the fleet.
  final String fleetArn;

  /// The time when the fleet was created.
  final DateTime createdTime;

  /// The time when the fleet was last updated.
  final DateTime lastUpdatedTime;

  /// The name of the fleet.
  final String fleetName;

  /// The name to display.
  final String displayName;

  /// The identifier used by users to sign into the Amazon WorkLink app.
  final String companyCode;

  /// The status of the fleet.
  final String fleetStatus;

  FleetSummary({
    this.fleetArn,
    this.createdTime,
    this.lastUpdatedTime,
    this.fleetName,
    this.displayName,
    this.companyCode,
    this.fleetStatus,
  });
  static FleetSummary fromJson(Map<String, dynamic> json) => FleetSummary();
}

class ListDevicesResponse {
  /// Information about the devices.
  final List<DeviceSummary> devices;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });
  static ListDevicesResponse fromJson(Map<String, dynamic> json) =>
      ListDevicesResponse();
}

class ListDomainsResponse {
  /// Information about the domains.
  final List<DomainSummary> domains;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListDomainsResponse({
    this.domains,
    this.nextToken,
  });
  static ListDomainsResponse fromJson(Map<String, dynamic> json) =>
      ListDomainsResponse();
}

class ListFleetsResponse {
  /// The summary list of the fleets.
  final List<FleetSummary> fleetSummaryList;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListFleetsResponse({
    this.fleetSummaryList,
    this.nextToken,
  });
  static ListFleetsResponse fromJson(Map<String, dynamic> json) =>
      ListFleetsResponse();
}

class ListWebsiteAuthorizationProvidersResponse {
  /// The website authorization providers.
  final List<WebsiteAuthorizationProviderSummary> websiteAuthorizationProviders;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If this value is null, it retrieves the first page.
  final String nextToken;

  ListWebsiteAuthorizationProvidersResponse({
    this.websiteAuthorizationProviders,
    this.nextToken,
  });
  static ListWebsiteAuthorizationProvidersResponse fromJson(
          Map<String, dynamic> json) =>
      ListWebsiteAuthorizationProvidersResponse();
}

class ListWebsiteCertificateAuthoritiesResponse {
  /// Information about the certificates.
  final List<WebsiteCaSummary> websiteCertificateAuthorities;

  /// The pagination token used to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListWebsiteCertificateAuthoritiesResponse({
    this.websiteCertificateAuthorities,
    this.nextToken,
  });
  static ListWebsiteCertificateAuthoritiesResponse fromJson(
          Map<String, dynamic> json) =>
      ListWebsiteCertificateAuthoritiesResponse();
}

class RestoreDomainAccessResponse {
  RestoreDomainAccessResponse();
  static RestoreDomainAccessResponse fromJson(Map<String, dynamic> json) =>
      RestoreDomainAccessResponse();
}

class RevokeDomainAccessResponse {
  RevokeDomainAccessResponse();
  static RevokeDomainAccessResponse fromJson(Map<String, dynamic> json) =>
      RevokeDomainAccessResponse();
}

class SignOutUserResponse {
  SignOutUserResponse();
  static SignOutUserResponse fromJson(Map<String, dynamic> json) =>
      SignOutUserResponse();
}

class UpdateAuditStreamConfigurationResponse {
  UpdateAuditStreamConfigurationResponse();
  static UpdateAuditStreamConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateAuditStreamConfigurationResponse();
}

class UpdateCompanyNetworkConfigurationResponse {
  UpdateCompanyNetworkConfigurationResponse();
  static UpdateCompanyNetworkConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateCompanyNetworkConfigurationResponse();
}

class UpdateDevicePolicyConfigurationResponse {
  UpdateDevicePolicyConfigurationResponse();
  static UpdateDevicePolicyConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateDevicePolicyConfigurationResponse();
}

class UpdateDomainMetadataResponse {
  UpdateDomainMetadataResponse();
  static UpdateDomainMetadataResponse fromJson(Map<String, dynamic> json) =>
      UpdateDomainMetadataResponse();
}

class UpdateFleetMetadataResponse {
  UpdateFleetMetadataResponse();
  static UpdateFleetMetadataResponse fromJson(Map<String, dynamic> json) =>
      UpdateFleetMetadataResponse();
}

class UpdateIdentityProviderConfigurationResponse {
  UpdateIdentityProviderConfigurationResponse();
  static UpdateIdentityProviderConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateIdentityProviderConfigurationResponse();
}

class WebsiteAuthorizationProviderSummary {
  /// A unique identifier for the authorization provider.
  final String authorizationProviderId;

  /// The authorization provider type.
  final String authorizationProviderType;

  /// The domain name of the authorization provider. This applies only to
  /// SAML-based authorization providers.
  final String domainName;

  /// The time of creation.
  final DateTime createdTime;

  WebsiteAuthorizationProviderSummary({
    this.authorizationProviderId,
    @required this.authorizationProviderType,
    this.domainName,
    this.createdTime,
  });
  static WebsiteAuthorizationProviderSummary fromJson(
          Map<String, dynamic> json) =>
      WebsiteAuthorizationProviderSummary();
}

class WebsiteCaSummary {
  /// A unique identifier for the CA.
  final String websiteCaId;

  /// The time when the CA was added.
  final DateTime createdTime;

  /// The name to display.
  final String displayName;

  WebsiteCaSummary({
    this.websiteCaId,
    this.createdTime,
    this.displayName,
  });
  static WebsiteCaSummary fromJson(Map<String, dynamic> json) =>
      WebsiteCaSummary();
}
