import 'package:meta/meta.dart';

/// Amazon Route 53 API actions let you register domain names and perform
/// related operations.
class Route53DomainsApi {
  /// This operation checks the availability of one domain name. Note that if
  /// the availability status of a domain is pending, you must submit another
  /// request to determine the availability of the domain name.
  ///
  /// [domainName]: The name of the domain that you want to get availability
  /// for.
  ///
  /// Constraints: The domain name can contain only the letters a through z, the
  /// numbers 0 through 9, and hyphen (-). Internationalized Domain Names are
  /// not supported.
  ///
  /// [idnLangCode]: Reserved for future use.
  Future<CheckDomainAvailabilityResponse> checkDomainAvailability(
      String domainName,
      {String idnLangCode}) async {
    return CheckDomainAvailabilityResponse.fromJson({});
  }

  /// Checks whether a domain name can be transferred to Amazon Route 53.
  ///
  /// [domainName]: The name of the domain that you want to transfer to Amazon
  /// Route 53.
  ///
  /// Constraints: The domain name can contain only the letters a through z, the
  /// numbers 0 through 9, and hyphen (-). Internationalized Domain Names are
  /// not supported.
  ///
  /// [authCode]: If the registrar for the top-level domain (TLD) requires an
  /// authorization code to transfer the domain, the code that you got from the
  /// current registrar for the domain.
  Future<CheckDomainTransferabilityResponse> checkDomainTransferability(
      String domainName,
      {String authCode}) async {
    return CheckDomainTransferabilityResponse.fromJson({});
  }

  /// This operation deletes the specified tags for a domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// [domainName]: The domain for which you want to delete one or more tags.
  ///
  /// [tagsToDelete]: A list of tag keys to delete.
  Future<DeleteTagsForDomainResponse> deleteTagsForDomain(
      {@required String domainName,
      @required List<String> tagsToDelete}) async {
    return DeleteTagsForDomainResponse.fromJson({});
  }

  /// This operation disables automatic renewal of domain registration for the
  /// specified domain.
  ///
  /// [domainName]: The name of the domain that you want to disable automatic
  /// renewal for.
  Future<DisableDomainAutoRenewResponse> disableDomainAutoRenew(
      String domainName) async {
    return DisableDomainAutoRenewResponse.fromJson({});
  }

  /// This operation removes the transfer lock on the domain (specifically the
  /// `clientTransferProhibited` status) to allow domain transfers. We recommend
  /// you refrain from performing this action unless you intend to transfer the
  /// domain to a different registrar. Successful submission returns an
  /// operation ID that you can use to track the progress and completion of the
  /// action. If the request is not completed successfully, the domain
  /// registrant will be notified by email.
  ///
  /// [domainName]: The name of the domain that you want to remove the transfer
  /// lock for.
  Future<DisableDomainTransferLockResponse> disableDomainTransferLock(
      String domainName) async {
    return DisableDomainTransferLockResponse.fromJson({});
  }

  /// This operation configures Amazon Route 53 to automatically renew the
  /// specified domain before the domain registration expires. The cost of
  /// renewing your domain registration is billed to your AWS account.
  ///
  /// The period during which you can renew a domain name varies by TLD. For a
  /// list of TLDs and their renewal policies, see
  /// ["Renewal, restoration, and deletion times"](http://wiki.gandi.net/en/domains/renew#renewal_restoration_and_deletion_times)
  /// on the website for our registrar associate, Gandi. Amazon Route 53
  /// requires that you renew before the end of the renewal period that is
  /// listed on the Gandi website so we can complete processing before the
  /// deadline.
  ///
  /// [domainName]: The name of the domain that you want to enable automatic
  /// renewal for.
  Future<EnableDomainAutoRenewResponse> enableDomainAutoRenew(
      String domainName) async {
    return EnableDomainAutoRenewResponse.fromJson({});
  }

  /// This operation sets the transfer lock on the domain (specifically the
  /// `clientTransferProhibited` status) to prevent domain transfers. Successful
  /// submission returns an operation ID that you can use to track the progress
  /// and completion of the action. If the request is not completed
  /// successfully, the domain registrant will be notified by email.
  ///
  /// [domainName]: The name of the domain that you want to set the transfer
  /// lock for.
  Future<EnableDomainTransferLockResponse> enableDomainTransferLock(
      String domainName) async {
    return EnableDomainTransferLockResponse.fromJson({});
  }

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation returns information about whether the registrant contact has
  /// responded.
  ///
  /// If you want us to resend the email, use the
  /// `ResendContactReachabilityEmail` operation.
  ///
  /// [domainName]: The name of the domain for which you want to know whether
  /// the registrant contact has confirmed that the email address is valid.
  Future<GetContactReachabilityStatusResponse> getContactReachabilityStatus(
      {String domainName}) async {
    return GetContactReachabilityStatusResponse.fromJson({});
  }

  /// This operation returns detailed information about a specified domain that
  /// is associated with the current AWS account. Contact information for the
  /// domain is also returned as part of the output.
  ///
  /// [domainName]: The name of the domain that you want to get detailed
  /// information about.
  Future<GetDomainDetailResponse> getDomainDetail(String domainName) async {
    return GetDomainDetailResponse.fromJson({});
  }

  /// The GetDomainSuggestions operation returns a list of suggested domain
  /// names given a string, which can either be a domain name or simply a word
  /// or phrase (without spaces).
  ///
  /// [domainName]: A domain name that you want to use as the basis for a list
  /// of possible domain names. The domain name must contain a top-level domain
  /// (TLD), such as .com, that Amazon Route 53 supports. For a list of TLDs,
  /// see
  /// [Domains that You Can Register with Amazon Route 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// [suggestionCount]: The number of suggested domain names that you want
  /// Amazon Route 53 to return.
  ///
  /// [onlyAvailable]: If `OnlyAvailable` is `true`, Amazon Route 53 returns
  /// only domain names that are available. If `OnlyAvailable` is `false`,
  /// Amazon Route 53 returns domain names without checking whether they're
  /// available to be registered. To determine whether the domain is available,
  /// you can call `checkDomainAvailability` for each suggestion.
  Future<GetDomainSuggestionsResponse> getDomainSuggestions(
      {@required String domainName,
      @required int suggestionCount,
      @required bool onlyAvailable}) async {
    return GetDomainSuggestionsResponse.fromJson({});
  }

  /// This operation returns the current status of an operation that is not
  /// completed.
  ///
  /// [operationId]: The identifier for the operation for which you want to get
  /// the status. Amazon Route 53 returned the identifier in the response to the
  /// original request.
  Future<GetOperationDetailResponse> getOperationDetail(
      String operationId) async {
    return GetOperationDetailResponse.fromJson({});
  }

  /// This operation returns all the domain names registered with Amazon Route
  /// 53 for the current AWS account.
  ///
  /// [marker]: For an initial request for a list of domains, omit this element.
  /// If the number of domains that are associated with the current AWS account
  /// is greater than the value that you specified for `MaxItems`, you can use
  /// `Marker` to return additional domains. Get the value of `NextPageMarker`
  /// from the previous response, and submit another request that includes the
  /// value of `NextPageMarker` in the `Marker` element.
  ///
  /// Constraints: The marker must match the value specified in the previous
  /// request.
  ///
  /// [maxItems]: Number of domains to be returned.
  ///
  /// Default: 20
  Future<ListDomainsResponse> listDomains({String marker, int maxItems}) async {
    return ListDomainsResponse.fromJson({});
  }

  /// This operation returns the operation IDs of operations that are not yet
  /// complete.
  ///
  /// [submittedSince]: An optional parameter that lets you get information
  /// about all the operations that you submitted after a specified date and
  /// time. Specify the date and time in Coordinated Universal time (UTC).
  ///
  /// [marker]: For an initial request for a list of operations, omit this
  /// element. If the number of operations that are not yet complete is greater
  /// than the value that you specified for `MaxItems`, you can use `Marker` to
  /// return additional operations. Get the value of `NextPageMarker` from the
  /// previous response, and submit another request that includes the value of
  /// `NextPageMarker` in the `Marker` element.
  ///
  /// [maxItems]: Number of domains to be returned.
  ///
  /// Default: 20
  Future<ListOperationsResponse> listOperations(
      {DateTime submittedSince, String marker, int maxItems}) async {
    return ListOperationsResponse.fromJson({});
  }

  /// This operation returns all of the tags that are associated with the
  /// specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// [domainName]: The domain for which you want to get a list of tags.
  Future<ListTagsForDomainResponse> listTagsForDomain(String domainName) async {
    return ListTagsForDomainResponse.fromJson({});
  }

  /// This operation registers a domain. Domains are registered either by Amazon
  /// Registrar (for .com, .net, and .org domains) or by our registrar
  /// associate, Gandi (for all other domains). For some top-level domains
  /// (TLDs), this operation requires extra parameters.
  ///
  /// When you register a domain, Amazon Route 53 does the following:
  ///
  /// *   Creates a Amazon Route 53 hosted zone that has the same name as the
  /// domain. Amazon Route 53 assigns four name servers to your hosted zone and
  /// automatically updates your domain registration with the names of these
  /// name servers.
  ///
  /// *   Enables autorenew, so your domain registration will renew
  /// automatically each year. We'll notify you in advance of the renewal date
  /// so you can choose whether to renew the registration.
  ///
  /// *   Optionally enables privacy protection, so WHOIS queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you don't
  /// enable privacy protection, WHOIS queries return the information that you
  /// entered for the registrant, admin, and tech contacts.
  ///
  /// *   If registration is successful, returns an operation ID that you can
  /// use to track the progress and completion of the action. If the request is
  /// not completed successfully, the domain registrant is notified by email.
  ///
  /// *   Charges your AWS account an amount based on the top-level domain. For
  /// more information, see
  /// [Amazon Route 53 Pricing](http://aws.amazon.com/route53/pricing/).
  ///
  /// [domainName]: The domain name that you want to register.
  ///
  /// Constraints: The domain name can contain only the letters a through z, the
  /// numbers 0 through 9, and hyphen (-). Internationalized Domain Names are
  /// not supported.
  ///
  /// [idnLangCode]: Reserved for future use.
  ///
  /// [durationInYears]: The number of years that you want to register the
  /// domain for. Domains are registered for a minimum of one year. The maximum
  /// period depends on the top-level domain. For the range of valid values for
  /// your domain, see
  /// [Domains that You Can Register with Amazon Route 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// Default: 1
  ///
  /// [autoRenew]: Indicates whether the domain will be automatically renewed
  /// (`true`) or not (`false`). Autorenewal only takes effect after the account
  /// is charged.
  ///
  /// Default: `true`
  ///
  /// [adminContact]: Provides detailed contact information.
  ///
  /// [registrantContact]: Provides detailed contact information.
  ///
  /// [techContact]: Provides detailed contact information.
  ///
  /// [privacyProtectAdminContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the admin contact.
  ///
  /// Default: `true`
  ///
  /// [privacyProtectRegistrantContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the registrant contact (the domain owner).
  ///
  /// Default: `true`
  ///
  /// [privacyProtectTechContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the technical contact.
  ///
  /// Default: `true`
  Future<RegisterDomainResponse> registerDomain(
      {@required String domainName,
      String idnLangCode,
      @required int durationInYears,
      bool autoRenew,
      @required ContactDetail adminContact,
      @required ContactDetail registrantContact,
      @required ContactDetail techContact,
      bool privacyProtectAdminContact,
      bool privacyProtectRegistrantContact,
      bool privacyProtectTechContact}) async {
    return RegisterDomainResponse.fromJson({});
  }

  /// This operation renews a domain for the specified number of years. The cost
  /// of renewing your domain is billed to your AWS account.
  ///
  /// We recommend that you renew your domain several weeks before the
  /// expiration date. Some TLD registries delete domains before the expiration
  /// date if you haven't renewed far enough in advance. For more information
  /// about renewing domain registration, see
  /// [Renewing Registration for a Domain](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html)
  /// in the Amazon Route 53 Developer Guide.
  ///
  /// [domainName]: The name of the domain that you want to renew.
  ///
  /// [durationInYears]: The number of years that you want to renew the domain
  /// for. The maximum number of years depends on the top-level domain. For the
  /// range of valid values for your domain, see
  /// [Domains that You Can Register with Amazon Route 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// Default: 1
  ///
  /// [currentExpiryYear]: The year when the registration for the domain is set
  /// to expire. This value must match the current expiration date for the
  /// domain.
  Future<RenewDomainResponse> renewDomain(
      {@required String domainName,
      int durationInYears,
      @required int currentExpiryYear}) async {
    return RenewDomainResponse.fromJson({});
  }

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation resends the confirmation email to the current email address for
  /// the registrant contact.
  ///
  /// [domainName]: The name of the domain for which you want Amazon Route 53 to
  /// resend a confirmation email to the registrant contact.
  Future<ResendContactReachabilityEmailResponse> resendContactReachabilityEmail(
      {String domainName}) async {
    return ResendContactReachabilityEmailResponse.fromJson({});
  }

  /// This operation returns the AuthCode for the domain. To transfer a domain
  /// to another registrar, you provide this value to the new registrar.
  ///
  /// [domainName]: The name of the domain that you want to get an authorization
  /// code for.
  Future<RetrieveDomainAuthCodeResponse> retrieveDomainAuthCode(
      String domainName) async {
    return RetrieveDomainAuthCodeResponse.fromJson({});
  }

  /// This operation transfers a domain from another registrar to Amazon Route
  /// 53. When the transfer is complete, the domain is registered either with
  /// Amazon Registrar (for .com, .net, and .org domains) or with our registrar
  /// associate, Gandi (for all other TLDs).
  ///
  /// For transfer requirements, a detailed procedure, and information about
  /// viewing the status of a domain transfer, see
  /// [Transferring Registration for a Domain to Amazon Route 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// If the registrar for your domain is also the DNS service provider for the
  /// domain, we highly recommend that you consider transferring your DNS
  /// service to Amazon Route 53 or to another DNS service provider before you
  /// transfer your registration. Some registrars provide free DNS service when
  /// you purchase a domain registration. When you transfer the registration,
  /// the previous registrar will not renew your domain registration and could
  /// end your DNS service at any time.
  ///
  ///  If the registrar for your domain is also the DNS service provider for the
  /// domain and you don't transfer DNS service to another provider, your
  /// website, email, and the web applications associated with the domain might
  /// become unavailable.
  ///
  /// If the transfer is successful, this method returns an operation ID that
  /// you can use to track the progress and completion of the action. If the
  /// transfer doesn't complete successfully, the domain registrant will be
  /// notified by email.
  ///
  /// [domainName]: The name of the domain that you want to transfer to Amazon
  /// Route 53.
  ///
  /// Constraints: The domain name can contain only the letters a through z, the
  /// numbers 0 through 9, and hyphen (-). Internationalized Domain Names are
  /// not supported.
  ///
  /// [idnLangCode]: Reserved for future use.
  ///
  /// [durationInYears]: The number of years that you want to register the
  /// domain for. Domains are registered for a minimum of one year. The maximum
  /// period depends on the top-level domain.
  ///
  /// Default: 1
  ///
  /// [nameservers]: Contains details for the host and glue IP addresses.
  ///
  /// [authCode]: The authorization code for the domain. You get this value from
  /// the current registrar.
  ///
  /// [autoRenew]: Indicates whether the domain will be automatically renewed
  /// (true) or not (false). Autorenewal only takes effect after the account is
  /// charged.
  ///
  /// Default: true
  ///
  /// [adminContact]: Provides detailed contact information.
  ///
  /// [registrantContact]: Provides detailed contact information.
  ///
  /// [techContact]: Provides detailed contact information.
  ///
  /// [privacyProtectAdminContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the admin contact.
  ///
  /// Default: `true`
  ///
  /// [privacyProtectRegistrantContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the registrant contact (domain owner).
  ///
  /// Default: `true`
  ///
  /// [privacyProtectTechContact]: Whether you want to conceal contact
  /// information from WHOIS queries. If you specify `true`, WHOIS ("who is")
  /// queries return contact information either for Amazon Registrar (for .com,
  /// .net, and .org domains) or for our registrar associate, Gandi (for all
  /// other TLDs). If you specify `false`, WHOIS queries return the information
  /// that you entered for the technical contact.
  ///
  /// Default: `true`
  Future<TransferDomainResponse> transferDomain(
      {@required String domainName,
      String idnLangCode,
      @required int durationInYears,
      List<Nameserver> nameservers,
      String authCode,
      bool autoRenew,
      @required ContactDetail adminContact,
      @required ContactDetail registrantContact,
      @required ContactDetail techContact,
      bool privacyProtectAdminContact,
      bool privacyProtectRegistrantContact,
      bool privacyProtectTechContact}) async {
    return TransferDomainResponse.fromJson({});
  }

  /// This operation updates the contact information for a particular domain.
  /// You must specify information for at least one contact: registrant,
  /// administrator, or technical.
  ///
  /// If the update is successful, this method returns an operation ID that you
  /// can use to track the progress and completion of the action. If the request
  /// is not completed successfully, the domain registrant will be notified by
  /// email.
  ///
  /// [domainName]: The name of the domain that you want to update contact
  /// information for.
  ///
  /// [adminContact]: Provides detailed contact information.
  ///
  /// [registrantContact]: Provides detailed contact information.
  ///
  /// [techContact]: Provides detailed contact information.
  Future<UpdateDomainContactResponse> updateDomainContact(String domainName,
      {ContactDetail adminContact,
      ContactDetail registrantContact,
      ContactDetail techContact}) async {
    return UpdateDomainContactResponse.fromJson({});
  }

  /// This operation updates the specified domain contact's privacy setting.
  /// When privacy protection is enabled, contact information such as email
  /// address is replaced either with contact information for Amazon Registrar
  /// (for .com, .net, and .org domains) or with contact information for our
  /// registrar associate, Gandi.
  ///
  /// This operation affects only the contact information for the specified
  /// contact type (registrant, administrator, or tech). If the request
  /// succeeds, Amazon Route 53 returns an operation ID that you can use with
  /// GetOperationDetail to track the progress and completion of the action. If
  /// the request doesn't complete successfully, the domain registrant will be
  /// notified by email.
  ///
  /// [domainName]: The name of the domain that you want to update the privacy
  /// setting for.
  ///
  /// [adminPrivacy]: Whether you want to conceal contact information from WHOIS
  /// queries. If you specify `true`, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// `false`, WHOIS queries return the information that you entered for the
  /// admin contact.
  ///
  /// [registrantPrivacy]: Whether you want to conceal contact information from
  /// WHOIS queries. If you specify `true`, WHOIS ("who is") queries return
  /// contact information either for Amazon Registrar (for .com, .net, and .org
  /// domains) or for our registrar associate, Gandi (for all other TLDs). If
  /// you specify `false`, WHOIS queries return the information that you entered
  /// for the registrant contact (domain owner).
  ///
  /// [techPrivacy]: Whether you want to conceal contact information from WHOIS
  /// queries. If you specify `true`, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// `false`, WHOIS queries return the information that you entered for the
  /// technical contact.
  Future<UpdateDomainContactPrivacyResponse> updateDomainContactPrivacy(
      String domainName,
      {bool adminPrivacy,
      bool registrantPrivacy,
      bool techPrivacy}) async {
    return UpdateDomainContactPrivacyResponse.fromJson({});
  }

  /// This operation replaces the current set of name servers for the domain
  /// with the specified set of name servers. If you use Amazon Route 53 as your
  /// DNS service, specify the four name servers in the delegation set for the
  /// hosted zone for the domain.
  ///
  /// If successful, this operation returns an operation ID that you can use to
  /// track the progress and completion of the action. If the request is not
  /// completed successfully, the domain registrant will be notified by email.
  ///
  /// [domainName]: The name of the domain that you want to change name servers
  /// for.
  ///
  /// [fiAuthKey]: The authorization key for .fi domains
  ///
  /// [nameservers]: A list of new name servers for the domain.
  Future<UpdateDomainNameserversResponse> updateDomainNameservers(
      {@required String domainName,
      String fiAuthKey,
      @required List<Nameserver> nameservers}) async {
    return UpdateDomainNameserversResponse.fromJson({});
  }

  /// This operation adds or updates tags for a specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// [domainName]: The domain for which you want to add or update tags.
  ///
  /// [tagsToUpdate]: A list of the tag keys and values that you want to add or
  /// update. If you specify a key that already exists, the corresponding value
  /// will be replaced.
  Future<UpdateTagsForDomainResponse> updateTagsForDomain(String domainName,
      {List<Tag> tagsToUpdate}) async {
    return UpdateTagsForDomainResponse.fromJson({});
  }

  /// Returns all the domain-related billing records for the current AWS account
  /// for a specified period
  ///
  /// [start]: The beginning date and time for the time period for which you
  /// want a list of billing records. Specify the date and time in Coordinated
  /// Universal time (UTC).
  ///
  /// [end]: The end date and time for the time period for which you want a list
  /// of billing records. Specify the date and time in Coordinated Universal
  /// time (UTC).
  ///
  /// [marker]: For an initial request for a list of billing records, omit this
  /// element. If the number of billing records that are associated with the
  /// current AWS account during the specified period is greater than the value
  /// that you specified for `MaxItems`, you can use `Marker` to return
  /// additional billing records. Get the value of `NextPageMarker` from the
  /// previous response, and submit another request that includes the value of
  /// `NextPageMarker` in the `Marker` element.
  ///
  /// Constraints: The marker must match the value of `NextPageMarker` that was
  /// returned in the previous response.
  ///
  /// [maxItems]: The number of billing records to be returned.
  ///
  /// Default: 20
  Future<ViewBillingResponse> viewBilling(
      {DateTime start, DateTime end, String marker, int maxItems}) async {
    return ViewBillingResponse.fromJson({});
  }
}

/// Information for one billing record.
class BillingRecord {
  /// The name of the domain that the billing record applies to. If the domain
  /// name contains characters other than a-z, 0-9, and - (hyphen), such as an
  /// internationalized domain name, then this value is in Punycode. For more
  /// information, see
  /// [DNS Domain Name Format](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html)
  /// in the _Amazon Route 53 Developer Guidezzz_.
  final String domainName;

  /// The operation that you were charged for.
  final String operation;

  /// The ID of the invoice that is associated with the billing record.
  final String invoiceId;

  /// The date that the operation was billed, in Unix format.
  final DateTime billDate;

  /// The price that you were charged for the operation, in US dollars.
  ///
  /// Example value: 12.0
  final double price;

  BillingRecord({
    this.domainName,
    this.operation,
    this.invoiceId,
    this.billDate,
    this.price,
  });
  static BillingRecord fromJson(Map<String, dynamic> json) => BillingRecord();
}

/// The CheckDomainAvailability response includes the following elements.
class CheckDomainAvailabilityResponse {
  /// Whether the domain name is available for registering.
  ///
  ///  You can register only domains designated as `AVAILABLE`.
  ///
  /// Valid values:
  ///
  /// AVAILABLE
  ///
  /// The domain name is available.
  ///
  /// AVAILABLE_RESERVED
  ///
  /// The domain name is reserved under specific conditions.
  ///
  /// AVAILABLE_PREORDER
  ///
  /// The domain name is available and can be preordered.
  ///
  /// DONT_KNOW
  ///
  /// The TLD registry didn't reply with a definitive answer about whether the
  /// domain name is available. Amazon Route 53 can return this response for a
  /// variety of reasons, for example, the registry is performing maintenance.
  /// Try again later.
  ///
  /// PENDING
  ///
  /// The TLD registry didn't return a response in the expected amount of time.
  /// When the response is delayed, it usually takes just a few extra seconds.
  /// You can resubmit the request immediately.
  ///
  /// RESERVED
  ///
  /// The domain name has been reserved for another person or organization.
  ///
  /// UNAVAILABLE
  ///
  /// The domain name is not available.
  ///
  /// UNAVAILABLE_PREMIUM
  ///
  /// The domain name is not available.
  ///
  /// UNAVAILABLE_RESTRICTED
  ///
  /// The domain name is forbidden.
  final String availability;

  CheckDomainAvailabilityResponse({
    @required this.availability,
  });
  static CheckDomainAvailabilityResponse fromJson(Map<String, dynamic> json) =>
      CheckDomainAvailabilityResponse();
}

/// The CheckDomainTransferability response includes the following elements.
class CheckDomainTransferabilityResponse {
  /// A complex type that contains information about whether the specified
  /// domain can be transferred to Amazon Route 53.
  final DomainTransferability transferability;

  CheckDomainTransferabilityResponse({
    @required this.transferability,
  });
  static CheckDomainTransferabilityResponse fromJson(
          Map<String, dynamic> json) =>
      CheckDomainTransferabilityResponse();
}

/// ContactDetail includes the following elements.
class ContactDetail {
  /// First name of contact.
  final String firstName;

  /// Last name of contact.
  final String lastName;

  /// Indicates whether the contact is a person, company, association, or public
  /// organization. If you choose an option other than `PERSON`, you must enter
  /// an organization name, and you can't enable privacy protection for the
  /// contact.
  final String contactType;

  /// Name of the organization for contact types other than `PERSON`.
  final String organizationName;

  /// First line of the contact's address.
  final String addressLine1;

  /// Second line of contact's address, if any.
  final String addressLine2;

  /// The city of the contact's address.
  final String city;

  /// The state or province of the contact's city.
  final String state;

  /// Code for the country of the contact's address.
  final String countryCode;

  /// The zip or postal code of the contact's address.
  final String zipCode;

  /// The phone number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format
  /// "+[country dialing code].[number including any area code>]". For example,
  /// a US phone number might appear as `"+1.1234567890"`.
  final String phoneNumber;

  /// Email address of the contact.
  final String email;

  /// Fax number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format
  /// "+[country dialing code].[number including any area code]". For example, a
  /// US phone number might appear as `"+1.1234567890"`.
  final String fax;

  /// A list of name-value pairs for parameters required by certain top-level
  /// domains.
  final List<ExtraParam> extraParams;

  ContactDetail({
    this.firstName,
    this.lastName,
    this.contactType,
    this.organizationName,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.countryCode,
    this.zipCode,
    this.phoneNumber,
    this.email,
    this.fax,
    this.extraParams,
  });
  static ContactDetail fromJson(Map<String, dynamic> json) => ContactDetail();
}

class DeleteTagsForDomainResponse {
  DeleteTagsForDomainResponse();
  static DeleteTagsForDomainResponse fromJson(Map<String, dynamic> json) =>
      DeleteTagsForDomainResponse();
}

class DisableDomainAutoRenewResponse {
  DisableDomainAutoRenewResponse();
  static DisableDomainAutoRenewResponse fromJson(Map<String, dynamic> json) =>
      DisableDomainAutoRenewResponse();
}

/// The DisableDomainTransferLock response includes the following element.
class DisableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  DisableDomainTransferLockResponse({
    @required this.operationId,
  });
  static DisableDomainTransferLockResponse fromJson(
          Map<String, dynamic> json) =>
      DisableDomainTransferLockResponse();
}

/// Information about one suggested domain name.
class DomainSuggestion {
  /// A suggested domain name.
  final String domainName;

  /// Whether the domain name is available for registering.
  ///
  ///  You can register only the domains that are designated as `AVAILABLE`.
  ///
  /// Valid values:
  ///
  /// AVAILABLE
  ///
  /// The domain name is available.
  ///
  /// AVAILABLE_RESERVED
  ///
  /// The domain name is reserved under specific conditions.
  ///
  /// AVAILABLE_PREORDER
  ///
  /// The domain name is available and can be preordered.
  ///
  /// DONT_KNOW
  ///
  /// The TLD registry didn't reply with a definitive answer about whether the
  /// domain name is available. Amazon Route 53 can return this response for a
  /// variety of reasons, for example, the registry is performing maintenance.
  /// Try again later.
  ///
  /// PENDING
  ///
  /// The TLD registry didn't return a response in the expected amount of time.
  /// When the response is delayed, it usually takes just a few extra seconds.
  /// You can resubmit the request immediately.
  ///
  /// RESERVED
  ///
  /// The domain name has been reserved for another person or organization.
  ///
  /// UNAVAILABLE
  ///
  /// The domain name is not available.
  ///
  /// UNAVAILABLE_PREMIUM
  ///
  /// The domain name is not available.
  ///
  /// UNAVAILABLE_RESTRICTED
  ///
  /// The domain name is forbidden.
  final String availability;

  DomainSuggestion({
    this.domainName,
    this.availability,
  });
  static DomainSuggestion fromJson(Map<String, dynamic> json) =>
      DomainSuggestion();
}

/// Summary information about one domain.
class DomainSummary {
  /// The name of the domain that the summary information applies to.
  final String domainName;

  /// Indicates whether the domain is automatically renewed upon expiration.
  final bool autoRenew;

  /// Indicates whether a domain is locked from unauthorized transfer to another
  /// party.
  final bool transferLock;

  /// Expiration date of the domain in Coordinated Universal Time (UTC).
  final DateTime expiry;

  DomainSummary({
    @required this.domainName,
    this.autoRenew,
    this.transferLock,
    this.expiry,
  });
  static DomainSummary fromJson(Map<String, dynamic> json) => DomainSummary();
}

/// A complex type that contains information about whether the specified domain
/// can be transferred to Amazon Route 53.
class DomainTransferability {
  final String transferable;

  DomainTransferability({
    this.transferable,
  });
  static DomainTransferability fromJson(Map<String, dynamic> json) =>
      DomainTransferability();
}

class EnableDomainAutoRenewResponse {
  EnableDomainAutoRenewResponse();
  static EnableDomainAutoRenewResponse fromJson(Map<String, dynamic> json) =>
      EnableDomainAutoRenewResponse();
}

/// The EnableDomainTransferLock response includes the following elements.
class EnableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  EnableDomainTransferLockResponse({
    @required this.operationId,
  });
  static EnableDomainTransferLockResponse fromJson(Map<String, dynamic> json) =>
      EnableDomainTransferLockResponse();
}

/// ExtraParam includes the following elements.
class ExtraParam {
  /// Name of the additional parameter required by the top-level domain. Here
  /// are the top-level domains that require additional parameters and which
  /// parameters they require:
  ///
  /// *    **.com.au and .net.au:** `AU_ID_NUMBER` and `AU_ID_TYPE`
  ///
  /// *    **.ca:** `BRAND_NUMBER`, `CA_LEGAL_TYPE`, and
  /// `CA_BUSINESS_ENTITY_TYPE`
  ///
  /// *    **.es:** `ES_IDENTIFICATION`, `ES_IDENTIFICATION_TYPE`, and
  /// `ES_LEGAL_FORM`
  ///
  /// *    **.fi:** `BIRTH_DATE_IN_YYYY_MM_DD`, `FI_BUSINESS_NUMBER`,
  /// `FI_ID_NUMBER`, `FI_NATIONALITY`, and `FI_ORGANIZATION_TYPE`
  ///
  /// *    **.fr:** `BRAND_NUMBER`, `BIRTH_DEPARTMENT`,
  /// `BIRTH_DATE_IN_YYYY_MM_DD`, `BIRTH_COUNTRY`, and `BIRTH_CITY`
  ///
  /// *    **.it:** `BIRTH_COUNTRY`, `IT_PIN`, and `IT_REGISTRANT_ENTITY_TYPE`
  ///
  /// *    **.ru:** `BIRTH_DATE_IN_YYYY_MM_DD` and `RU_PASSPORT_DATA`
  ///
  /// *    **.se:** `BIRTH_COUNTRY` and `SE_ID_NUMBER`
  ///
  /// *    **.sg:** `SG_ID_NUMBER`
  ///
  /// *    **.co.uk, .me.uk, and .org.uk:** `UK_CONTACT_TYPE` and
  /// `UK_COMPANY_NUMBER`
  ///
  ///
  /// In addition, many TLDs require `VAT_NUMBER`.
  final String name;

  /// Values corresponding to the additional parameter names required by some
  /// top-level domains.
  final String value;

  ExtraParam({
    @required this.name,
    @required this.value,
  });
  static ExtraParam fromJson(Map<String, dynamic> json) => ExtraParam();
}

class GetContactReachabilityStatusResponse {
  /// The domain name for which you requested the reachability status.
  final String domainName;

  /// Whether the registrant contact has responded. Values include the
  /// following:
  ///
  /// PENDING
  ///
  /// We sent the confirmation email and haven't received a response yet.
  ///
  /// DONE
  ///
  /// We sent the email and got confirmation from the registrant contact.
  ///
  /// EXPIRED
  ///
  /// The time limit expired before the registrant contact responded.
  final String status;

  GetContactReachabilityStatusResponse({
    this.domainName,
    this.status,
  });
  static GetContactReachabilityStatusResponse fromJson(
          Map<String, dynamic> json) =>
      GetContactReachabilityStatusResponse();
}

/// The GetDomainDetail response includes the following elements.
class GetDomainDetailResponse {
  /// The name of a domain.
  final String domainName;

  /// The name of the domain.
  final List<Nameserver> nameservers;

  /// Specifies whether the domain registration is set to renew automatically.
  final bool autoRenew;

  /// Provides details about the domain administrative contact.
  final ContactDetail adminContact;

  /// Provides details about the domain registrant.
  final ContactDetail registrantContact;

  /// Provides details about the domain technical contact.
  final ContactDetail techContact;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is `true`, WHOIS ("who is") queries return contact information
  /// either for Amazon Registrar (for .com, .net, and .org domains) or for our
  /// registrar associate, Gandi (for all other TLDs). If the value is `false`,
  /// WHOIS queries return the information that you entered for the admin
  /// contact.
  final bool adminPrivacy;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is `true`, WHOIS ("who is") queries return contact information
  /// either for Amazon Registrar (for .com, .net, and .org domains) or for our
  /// registrar associate, Gandi (for all other TLDs). If the value is `false`,
  /// WHOIS queries return the information that you entered for the registrant
  /// contact (domain owner).
  final bool registrantPrivacy;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is `true`, WHOIS ("who is") queries return contact information
  /// either for Amazon Registrar (for .com, .net, and .org domains) or for our
  /// registrar associate, Gandi (for all other TLDs). If the value is `false`,
  /// WHOIS queries return the information that you entered for the technical
  /// contact.
  final bool techPrivacy;

  /// Name of the registrar of the domain as identified in the registry. Domains
  /// with a .com, .net, or .org TLD are registered by Amazon Registrar. All
  /// other domains are registered by our registrar associate, Gandi. The value
  /// for domains that are registered by Gandi is `"GANDI SAS"`.
  final String registrarName;

  /// The fully qualified name of the WHOIS server that can answer the WHOIS
  /// query for the domain.
  final String whoIsServer;

  /// Web address of the registrar.
  final String registrarUrl;

  /// Email address to contact to report incorrect contact information for a
  /// domain, to report that the domain is being used to send spam, to report
  /// that someone is cybersquatting on a domain name, or report some other type
  /// of abuse.
  final String abuseContactEmail;

  /// Phone number for reporting abuse.
  final String abuseContactPhone;

  /// Reserved for future use.
  final String registryDomainId;

  /// The date when the domain was created as found in the response to a WHOIS
  /// query. The date and time is in Coordinated Universal time (UTC).
  final DateTime creationDate;

  /// The last updated date of the domain as found in the response to a WHOIS
  /// query. The date and time is in Coordinated Universal time (UTC).
  final DateTime updatedDate;

  /// The date when the registration for the domain is set to expire. The date
  /// and time is in Coordinated Universal time (UTC).
  final DateTime expirationDate;

  /// Reseller of the domain. Domains registered or transferred using Amazon
  /// Route 53 domains will have `"Amazon"` as the reseller.
  final String reseller;

  /// Reserved for future use.
  final String dnsSec;

  /// An array of domain name status codes, also known as Extensible
  /// Provisioning Protocol (EPP) status codes.
  ///
  /// ICANN, the organization that maintains a central database of domain names,
  /// has developed a set of domain name status codes that tell you the status
  /// of a variety of operations on a domain name, for example, registering a
  /// domain name, transferring a domain name to another registrar, renewing the
  /// registration for a domain name, and so on. All registrars use this same
  /// set of status codes.
  ///
  /// For a current list of domain name status codes and an explanation of what
  /// each code means, go to the [ICANN website](https://www.icann.org/) and
  /// search for `epp status codes`. (Search on the ICANN website; web searches
  /// sometimes return an old version of the document.)
  final List<String> statusList;

  GetDomainDetailResponse({
    @required this.domainName,
    @required this.nameservers,
    this.autoRenew,
    @required this.adminContact,
    @required this.registrantContact,
    @required this.techContact,
    this.adminPrivacy,
    this.registrantPrivacy,
    this.techPrivacy,
    this.registrarName,
    this.whoIsServer,
    this.registrarUrl,
    this.abuseContactEmail,
    this.abuseContactPhone,
    this.registryDomainId,
    this.creationDate,
    this.updatedDate,
    this.expirationDate,
    this.reseller,
    this.dnsSec,
    this.statusList,
  });
  static GetDomainDetailResponse fromJson(Map<String, dynamic> json) =>
      GetDomainDetailResponse();
}

class GetDomainSuggestionsResponse {
  /// A list of possible domain names. If you specified `true` for
  /// `OnlyAvailable` in the request, the list contains only domains that are
  /// available for registration.
  final List<DomainSuggestion> suggestionsList;

  GetDomainSuggestionsResponse({
    this.suggestionsList,
  });
  static GetDomainSuggestionsResponse fromJson(Map<String, dynamic> json) =>
      GetDomainSuggestionsResponse();
}

/// The GetOperationDetail response includes the following elements.
class GetOperationDetailResponse {
  /// The identifier for the operation.
  final String operationId;

  /// The current status of the requested operation in the system.
  final String status;

  /// Detailed information on the status including possible errors.
  final String message;

  /// The name of a domain.
  final String domainName;

  /// The type of operation that was requested.
  final String type;

  /// The date when the request was submitted.
  final DateTime submittedDate;

  GetOperationDetailResponse({
    this.operationId,
    this.status,
    this.message,
    this.domainName,
    this.type,
    this.submittedDate,
  });
  static GetOperationDetailResponse fromJson(Map<String, dynamic> json) =>
      GetOperationDetailResponse();
}

/// The ListDomains response includes the following elements.
class ListDomainsResponse {
  /// A summary of domains.
  final List<DomainSummary> domains;

  /// If there are more domains than you specified for `MaxItems` in the
  /// request, submit another request and include the value of `NextPageMarker`
  /// in the value of `Marker`.
  final String nextPageMarker;

  ListDomainsResponse({
    @required this.domains,
    this.nextPageMarker,
  });
  static ListDomainsResponse fromJson(Map<String, dynamic> json) =>
      ListDomainsResponse();
}

/// The ListOperations response includes the following elements.
class ListOperationsResponse {
  /// Lists summaries of the operations.
  final List<OperationSummary> operations;

  /// If there are more operations than you specified for `MaxItems` in the
  /// request, submit another request and include the value of `NextPageMarker`
  /// in the value of `Marker`.
  final String nextPageMarker;

  ListOperationsResponse({
    @required this.operations,
    this.nextPageMarker,
  });
  static ListOperationsResponse fromJson(Map<String, dynamic> json) =>
      ListOperationsResponse();
}

/// The ListTagsForDomain response includes the following elements.
class ListTagsForDomainResponse {
  /// A list of the tags that are associated with the specified domain.
  final List<Tag> tagList;

  ListTagsForDomainResponse({
    @required this.tagList,
  });
  static ListTagsForDomainResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForDomainResponse();
}

/// Nameserver includes the following elements.
class Nameserver {
  /// The fully qualified host name of the name server.
  ///
  /// Constraint: Maximum 255 characters
  final String name;

  /// Glue IP address of a name server entry. Glue IP addresses are required
  /// only when the name of the name server is a subdomain of the domain. For
  /// example, if your domain is example.com and the name server for the domain
  /// is ns.example.com, you need to specify the IP address for ns.example.com.
  ///
  /// Constraints: The list can contain only one IPv4 and one IPv6 address.
  final List<String> glueIps;

  Nameserver({
    @required this.name,
    this.glueIps,
  });
  static Nameserver fromJson(Map<String, dynamic> json) => Nameserver();
}

/// OperationSummary includes the following elements.
class OperationSummary {
  /// Identifier returned to track the requested action.
  final String operationId;

  /// The current status of the requested operation in the system.
  final String status;

  /// Type of the action requested.
  final String type;

  /// The date when the request was submitted.
  final DateTime submittedDate;

  OperationSummary({
    @required this.operationId,
    @required this.status,
    @required this.type,
    @required this.submittedDate,
  });
  static OperationSummary fromJson(Map<String, dynamic> json) =>
      OperationSummary();
}

/// The RegisterDomain response includes the following element.
class RegisterDomainResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  RegisterDomainResponse({
    @required this.operationId,
  });
  static RegisterDomainResponse fromJson(Map<String, dynamic> json) =>
      RegisterDomainResponse();
}

class RenewDomainResponse {
  /// The identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  RenewDomainResponse({
    @required this.operationId,
  });
  static RenewDomainResponse fromJson(Map<String, dynamic> json) =>
      RenewDomainResponse();
}

class ResendContactReachabilityEmailResponse {
  /// The domain name for which you requested a confirmation email.
  final String domainName;

  /// The email address for the registrant contact at the time that we sent the
  /// verification email.
  final String emailAddress;

  ///  `True` if the email address for the registrant contact has already been
  /// verified, and `false` otherwise. If the email address has already been
  /// verified, we don't send another confirmation email.
  final bool isAlreadyVerified;

  ResendContactReachabilityEmailResponse({
    this.domainName,
    this.emailAddress,
    this.isAlreadyVerified,
  });
  static ResendContactReachabilityEmailResponse fromJson(
          Map<String, dynamic> json) =>
      ResendContactReachabilityEmailResponse();
}

/// The RetrieveDomainAuthCode response includes the following element.
class RetrieveDomainAuthCodeResponse {
  /// The authorization code for the domain.
  final String authCode;

  RetrieveDomainAuthCodeResponse({
    @required this.authCode,
  });
  static RetrieveDomainAuthCodeResponse fromJson(Map<String, dynamic> json) =>
      RetrieveDomainAuthCodeResponse();
}

/// Each tag includes the following elements.
class Tag {
  /// The key (name) of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+-@"
  ///
  /// Constraints: Each key can be 1-128 characters long.
  final String key;

  /// The value of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+-@"
  ///
  /// Constraints: Each value can be 0-256 characters long.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// The TranserDomain response includes the following element.
class TransferDomainResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  TransferDomainResponse({
    @required this.operationId,
  });
  static TransferDomainResponse fromJson(Map<String, dynamic> json) =>
      TransferDomainResponse();
}

/// The UpdateDomainContactPrivacy response includes the following element.
class UpdateDomainContactPrivacyResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  UpdateDomainContactPrivacyResponse({
    @required this.operationId,
  });
  static UpdateDomainContactPrivacyResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateDomainContactPrivacyResponse();
}

/// The UpdateDomainContact response includes the following element.
class UpdateDomainContactResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  UpdateDomainContactResponse({
    @required this.operationId,
  });
  static UpdateDomainContactResponse fromJson(Map<String, dynamic> json) =>
      UpdateDomainContactResponse();
}

/// The UpdateDomainNameservers response includes the following element.
class UpdateDomainNameserversResponse {
  /// Identifier for tracking the progress of the request. To use this ID to
  /// query the operation status, use GetOperationDetail.
  final String operationId;

  UpdateDomainNameserversResponse({
    @required this.operationId,
  });
  static UpdateDomainNameserversResponse fromJson(Map<String, dynamic> json) =>
      UpdateDomainNameserversResponse();
}

class UpdateTagsForDomainResponse {
  UpdateTagsForDomainResponse();
  static UpdateTagsForDomainResponse fromJson(Map<String, dynamic> json) =>
      UpdateTagsForDomainResponse();
}

/// The ViewBilling response includes the following elements.
class ViewBillingResponse {
  /// If there are more billing records than you specified for `MaxItems` in the
  /// request, submit another request and include the value of `NextPageMarker`
  /// in the value of `Marker`.
  final String nextPageMarker;

  /// A summary of billing records.
  final List<BillingRecord> billingRecords;

  ViewBillingResponse({
    this.nextPageMarker,
    this.billingRecords,
  });
  static ViewBillingResponse fromJson(Map<String, dynamic> json) =>
      ViewBillingResponse();
}
