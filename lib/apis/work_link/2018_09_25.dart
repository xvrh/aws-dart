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
  final _client;
  WorkLinkApi(client)
      : _client = client.configured('WorkLink', serializer: 'rest-json');

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
    var response_ = await _client.send('AssociateDomain', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
      if (displayName != null) 'DisplayName': displayName,
      'AcmCertificateArn': acmCertificateArn,
    });
    return AssociateDomainResponse.fromJson(response_);
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
    var response_ =
        await _client.send('AssociateWebsiteAuthorizationProvider', {
      'FleetArn': fleetArn,
      'AuthorizationProviderType': authorizationProviderType,
      if (domainName != null) 'DomainName': domainName,
    });
    return AssociateWebsiteAuthorizationProviderResponse.fromJson(response_);
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
    var response_ = await _client.send('AssociateWebsiteCertificateAuthority', {
      'FleetArn': fleetArn,
      'Certificate': certificate,
      if (displayName != null) 'DisplayName': displayName,
    });
    return AssociateWebsiteCertificateAuthorityResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateFleet', {
      'FleetName': fleetName,
      if (displayName != null) 'DisplayName': displayName,
      if (optimizeForEndUserLocation != null)
        'OptimizeForEndUserLocation': optimizeForEndUserLocation,
    });
    return CreateFleetResponse.fromJson(response_);
  }

  /// Deletes a fleet. Prevents users from accessing previously associated
  /// websites.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DeleteFleetResponse> deleteFleet(String fleetArn) async {
    var response_ = await _client.send('DeleteFleet', {
      'FleetArn': fleetArn,
    });
    return DeleteFleetResponse.fromJson(response_);
  }

  /// Describes the configuration for delivering audit streams to the customer
  /// account.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeAuditStreamConfigurationResponse>
      describeAuditStreamConfiguration(String fleetArn) async {
    var response_ = await _client.send('DescribeAuditStreamConfiguration', {
      'FleetArn': fleetArn,
    });
    return DescribeAuditStreamConfigurationResponse.fromJson(response_);
  }

  /// Describes the networking configuration to access the internal websites
  /// associated with the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeCompanyNetworkConfigurationResponse>
      describeCompanyNetworkConfiguration(String fleetArn) async {
    var response_ = await _client.send('DescribeCompanyNetworkConfiguration', {
      'FleetArn': fleetArn,
    });
    return DescribeCompanyNetworkConfigurationResponse.fromJson(response_);
  }

  /// Provides information about a user's device.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [deviceId]: A unique identifier for a registered user's device.
  Future<DescribeDeviceResponse> describeDevice(
      {@required String fleetArn, @required String deviceId}) async {
    var response_ = await _client.send('DescribeDevice', {
      'FleetArn': fleetArn,
      'DeviceId': deviceId,
    });
    return DescribeDeviceResponse.fromJson(response_);
  }

  /// Describes the device policy configuration for the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeDevicePolicyConfigurationResponse>
      describeDevicePolicyConfiguration(String fleetArn) async {
    var response_ = await _client.send('DescribeDevicePolicyConfiguration', {
      'FleetArn': fleetArn,
    });
    return DescribeDevicePolicyConfigurationResponse.fromJson(response_);
  }

  /// Provides information about the domain.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<DescribeDomainResponse> describeDomain(
      {@required String fleetArn, @required String domainName}) async {
    var response_ = await _client.send('DescribeDomain', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
    });
    return DescribeDomainResponse.fromJson(response_);
  }

  /// Provides basic information for the specified fleet, excluding identity
  /// provider, networking, and device configuration details.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeFleetMetadataResponse> describeFleetMetadata(
      String fleetArn) async {
    var response_ = await _client.send('DescribeFleetMetadata', {
      'FleetArn': fleetArn,
    });
    return DescribeFleetMetadataResponse.fromJson(response_);
  }

  /// Describes the identity provider configuration of the specified fleet.
  ///
  /// [fleetArn]: The ARN of the fleet.
  Future<DescribeIdentityProviderConfigurationResponse>
      describeIdentityProviderConfiguration(String fleetArn) async {
    var response_ =
        await _client.send('DescribeIdentityProviderConfiguration', {
      'FleetArn': fleetArn,
    });
    return DescribeIdentityProviderConfigurationResponse.fromJson(response_);
  }

  /// Provides information about the certificate authority.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [websiteCaId]: A unique identifier for the certificate authority.
  Future<DescribeWebsiteCertificateAuthorityResponse>
      describeWebsiteCertificateAuthority(
          {@required String fleetArn, @required String websiteCaId}) async {
    var response_ = await _client.send('DescribeWebsiteCertificateAuthority', {
      'FleetArn': fleetArn,
      'WebsiteCaId': websiteCaId,
    });
    return DescribeWebsiteCertificateAuthorityResponse.fromJson(response_);
  }

  /// Disassociates a domain from Amazon WorkLink. End users lose the ability to
  /// access the domain with Amazon WorkLink.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<DisassociateDomainResponse> disassociateDomain(
      {@required String fleetArn, @required String domainName}) async {
    var response_ = await _client.send('DisassociateDomain', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
    });
    return DisassociateDomainResponse.fromJson(response_);
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
    var response_ =
        await _client.send('DisassociateWebsiteAuthorizationProvider', {
      'FleetArn': fleetArn,
      'AuthorizationProviderId': authorizationProviderId,
    });
    return DisassociateWebsiteAuthorizationProviderResponse.fromJson(response_);
  }

  /// Removes a certificate authority (CA).
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [websiteCaId]: A unique identifier for the CA.
  Future<DisassociateWebsiteCertificateAuthorityResponse>
      disassociateWebsiteCertificateAuthority(
          {@required String fleetArn, @required String websiteCaId}) async {
    var response_ =
        await _client.send('DisassociateWebsiteCertificateAuthority', {
      'FleetArn': fleetArn,
      'WebsiteCaId': websiteCaId,
    });
    return DisassociateWebsiteCertificateAuthorityResponse.fromJson(response_);
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
    var response_ = await _client.send('ListDevices', {
      'FleetArn': fleetArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDevicesResponse.fromJson(response_);
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
    var response_ = await _client.send('ListDomains', {
      'FleetArn': fleetArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDomainsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListFleets', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListFleetsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListWebsiteAuthorizationProviders', {
      'FleetArn': fleetArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWebsiteAuthorizationProvidersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListWebsiteCertificateAuthorities', {
      'FleetArn': fleetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListWebsiteCertificateAuthoritiesResponse.fromJson(response_);
  }

  /// Moves a domain to ACTIVE status if it was in the INACTIVE status.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<RestoreDomainAccessResponse> restoreDomainAccess(
      {@required String fleetArn, @required String domainName}) async {
    var response_ = await _client.send('RestoreDomainAccess', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
    });
    return RestoreDomainAccessResponse.fromJson(response_);
  }

  /// Moves a domain to INACTIVE status if it was in the ACTIVE status.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [domainName]: The name of the domain.
  Future<RevokeDomainAccessResponse> revokeDomainAccess(
      {@required String fleetArn, @required String domainName}) async {
    var response_ = await _client.send('RevokeDomainAccess', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
    });
    return RevokeDomainAccessResponse.fromJson(response_);
  }

  /// Signs the user out from all of their devices. The user can sign in again
  /// if they have valid credentials.
  ///
  /// [fleetArn]: The ARN of the fleet.
  ///
  /// [username]: The name of the user.
  Future<SignOutUserResponse> signOutUser(
      {@required String fleetArn, @required String username}) async {
    var response_ = await _client.send('SignOutUser', {
      'FleetArn': fleetArn,
      'Username': username,
    });
    return SignOutUserResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateAuditStreamConfiguration', {
      'FleetArn': fleetArn,
      if (auditStreamArn != null) 'AuditStreamArn': auditStreamArn,
    });
    return UpdateAuditStreamConfigurationResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateCompanyNetworkConfiguration', {
      'FleetArn': fleetArn,
      'VpcId': vpcId,
      'SubnetIds': subnetIds,
      'SecurityGroupIds': securityGroupIds,
    });
    return UpdateCompanyNetworkConfigurationResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateDevicePolicyConfiguration', {
      'FleetArn': fleetArn,
      if (deviceCaCertificate != null)
        'DeviceCaCertificate': deviceCaCertificate,
    });
    return UpdateDevicePolicyConfigurationResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateDomainMetadata', {
      'FleetArn': fleetArn,
      'DomainName': domainName,
      if (displayName != null) 'DisplayName': displayName,
    });
    return UpdateDomainMetadataResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateFleetMetadata', {
      'FleetArn': fleetArn,
      if (displayName != null) 'DisplayName': displayName,
      if (optimizeForEndUserLocation != null)
        'OptimizeForEndUserLocation': optimizeForEndUserLocation,
    });
    return UpdateFleetMetadataResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateIdentityProviderConfiguration', {
      'FleetArn': fleetArn,
      'IdentityProviderType': identityProviderType,
      if (identityProviderSamlMetadata != null)
        'IdentityProviderSamlMetadata': identityProviderSamlMetadata,
    });
    return UpdateIdentityProviderConfigurationResponse.fromJson(response_);
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
      AssociateWebsiteAuthorizationProviderResponse(
        authorizationProviderId: json.containsKey('AuthorizationProviderId')
            ? json['AuthorizationProviderId'] as String
            : null,
      );
}

class AssociateWebsiteCertificateAuthorityResponse {
  /// A unique identifier for the CA.
  final String websiteCaId;

  AssociateWebsiteCertificateAuthorityResponse({
    this.websiteCaId,
  });
  static AssociateWebsiteCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateWebsiteCertificateAuthorityResponse(
        websiteCaId: json.containsKey('WebsiteCaId')
            ? json['WebsiteCaId'] as String
            : null,
      );
}

class CreateFleetResponse {
  /// The ARN of the fleet.
  final String fleetArn;

  CreateFleetResponse({
    this.fleetArn,
  });
  static CreateFleetResponse fromJson(Map<String, dynamic> json) =>
      CreateFleetResponse(
        fleetArn:
            json.containsKey('FleetArn') ? json['FleetArn'] as String : null,
      );
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
      DescribeAuditStreamConfigurationResponse(
        auditStreamArn: json.containsKey('AuditStreamArn')
            ? json['AuditStreamArn'] as String
            : null,
      );
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
      DescribeCompanyNetworkConfigurationResponse(
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        subnetIds: json.containsKey('SubnetIds')
            ? (json['SubnetIds'] as List).map((e) => e as String).toList()
            : null,
        securityGroupIds: json.containsKey('SecurityGroupIds')
            ? (json['SecurityGroupIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
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
      DescribeDevicePolicyConfigurationResponse(
        deviceCaCertificate: json.containsKey('DeviceCaCertificate')
            ? json['DeviceCaCertificate'] as String
            : null,
      );
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
      DescribeDeviceResponse(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        model: json.containsKey('Model') ? json['Model'] as String : null,
        manufacturer: json.containsKey('Manufacturer')
            ? json['Manufacturer'] as String
            : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? json['OperatingSystem'] as String
            : null,
        operatingSystemVersion: json.containsKey('OperatingSystemVersion')
            ? json['OperatingSystemVersion'] as String
            : null,
        patchLevel: json.containsKey('PatchLevel')
            ? json['PatchLevel'] as String
            : null,
        firstAccessedTime: json.containsKey('FirstAccessedTime')
            ? DateTime.parse(json['FirstAccessedTime'])
            : null,
        lastAccessedTime: json.containsKey('LastAccessedTime')
            ? DateTime.parse(json['LastAccessedTime'])
            : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
      );
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
      DescribeDomainResponse(
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        domainStatus: json.containsKey('DomainStatus')
            ? json['DomainStatus'] as String
            : null,
        acmCertificateArn: json.containsKey('AcmCertificateArn')
            ? json['AcmCertificateArn'] as String
            : null,
      );
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
      DescribeFleetMetadataResponse(
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
        fleetName:
            json.containsKey('FleetName') ? json['FleetName'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        optimizeForEndUserLocation:
            json.containsKey('OptimizeForEndUserLocation')
                ? json['OptimizeForEndUserLocation'] as bool
                : null,
        companyCode: json.containsKey('CompanyCode')
            ? json['CompanyCode'] as String
            : null,
        fleetStatus: json.containsKey('FleetStatus')
            ? json['FleetStatus'] as String
            : null,
      );
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
      DescribeIdentityProviderConfigurationResponse(
        identityProviderType: json.containsKey('IdentityProviderType')
            ? json['IdentityProviderType'] as String
            : null,
        serviceProviderSamlMetadata:
            json.containsKey('ServiceProviderSamlMetadata')
                ? json['ServiceProviderSamlMetadata'] as String
                : null,
        identityProviderSamlMetadata:
            json.containsKey('IdentityProviderSamlMetadata')
                ? json['IdentityProviderSamlMetadata'] as String
                : null,
      );
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
      DescribeWebsiteCertificateAuthorityResponse(
        certificate: json.containsKey('Certificate')
            ? json['Certificate'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
      );
}

/// The summary of devices.
class DeviceSummary {
  /// The ID of the device.
  final String deviceId;

  /// The status of the device.
  final String deviceStatus;

  DeviceSummary({
    this.deviceId,
    this.deviceStatus,
  });
  static DeviceSummary fromJson(Map<String, dynamic> json) => DeviceSummary(
        deviceId:
            json.containsKey('DeviceId') ? json['DeviceId'] as String : null,
        deviceStatus: json.containsKey('DeviceStatus')
            ? json['DeviceStatus'] as String
            : null,
      );
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

/// The summary of the domain.
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
  static DomainSummary fromJson(Map<String, dynamic> json) => DomainSummary(
        domainName: json['DomainName'] as String,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        createdTime: DateTime.parse(json['CreatedTime']),
        domainStatus: json['DomainStatus'] as String,
      );
}

/// The summary of the fleet.
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
  static FleetSummary fromJson(Map<String, dynamic> json) => FleetSummary(
        fleetArn:
            json.containsKey('FleetArn') ? json['FleetArn'] as String : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
        fleetName:
            json.containsKey('FleetName') ? json['FleetName'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        companyCode: json.containsKey('CompanyCode')
            ? json['CompanyCode'] as String
            : null,
        fleetStatus: json.containsKey('FleetStatus')
            ? json['FleetStatus'] as String
            : null,
      );
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
      ListDevicesResponse(
        devices: json.containsKey('Devices')
            ? (json['Devices'] as List)
                .map((e) => DeviceSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListDomainsResponse(
        domains: json.containsKey('Domains')
            ? (json['Domains'] as List)
                .map((e) => DomainSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListFleetsResponse(
        fleetSummaryList: json.containsKey('FleetSummaryList')
            ? (json['FleetSummaryList'] as List)
                .map((e) => FleetSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListWebsiteAuthorizationProvidersResponse(
        websiteAuthorizationProviders:
            json.containsKey('WebsiteAuthorizationProviders')
                ? (json['WebsiteAuthorizationProviders'] as List)
                    .map((e) => WebsiteAuthorizationProviderSummary.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListWebsiteCertificateAuthoritiesResponse(
        websiteCertificateAuthorities:
            json.containsKey('WebsiteCertificateAuthorities')
                ? (json['WebsiteCertificateAuthorities'] as List)
                    .map((e) => WebsiteCaSummary.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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

/// The summary of the website authorization provider.
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
      WebsiteAuthorizationProviderSummary(
        authorizationProviderId: json.containsKey('AuthorizationProviderId')
            ? json['AuthorizationProviderId'] as String
            : null,
        authorizationProviderType: json['AuthorizationProviderType'] as String,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
      );
}

/// The summary of the certificate authority (CA).
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
      WebsiteCaSummary(
        websiteCaId: json.containsKey('WebsiteCaId')
            ? json['WebsiteCaId'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
      );
}
