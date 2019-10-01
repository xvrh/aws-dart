import 'package:meta/meta.dart';

/// Amazon Route 53 API actions let you register domain names and perform
/// related operations.
class Route53DomainsApi {
  /// This operation checks the availability of one domain name. Note that if
  /// the availability status of a domain is pending, you must submit another
  /// request to determine the availability of the domain name.
  Future<void> checkDomainAvailability(String domainName,
      {String idnLangCode}) async {}

  /// Checks whether a domain name can be transferred to Amazon Route 53.
  Future<void> checkDomainTransferability(String domainName,
      {String authCode}) async {}

  /// This operation deletes the specified tags for a domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  Future<void> deleteTagsForDomain(
      {@required String domainName,
      @required List<String> tagsToDelete}) async {}

  /// This operation disables automatic renewal of domain registration for the
  /// specified domain.
  Future<void> disableDomainAutoRenew(String domainName) async {}

  /// This operation removes the transfer lock on the domain (specifically the
  /// `clientTransferProhibited` status) to allow domain transfers. We recommend
  /// you refrain from performing this action unless you intend to transfer the
  /// domain to a different registrar. Successful submission returns an
  /// operation ID that you can use to track the progress and completion of the
  /// action. If the request is not completed successfully, the domain
  /// registrant will be notified by email.
  Future<void> disableDomainTransferLock(String domainName) async {}

  /// This operation configures Amazon Route 53 to automatically renew the
  /// specified domain before the domain registration expires. The cost of
  /// renewing your domain registration is billed to your AWS account.
  ///
  /// The period during which you can renew a domain name varies by TLD. For a
  /// list of TLDs and their renewal policies, see ["Renewal, restoration, and
  /// deletion
  /// times"](http://wiki.gandi.net/en/domains/renew#renewal_restoration_and_deletion_times)
  /// on the website for our registrar associate, Gandi. Amazon Route 53
  /// requires that you renew before the end of the renewal period that is
  /// listed on the Gandi website so we can complete processing before the
  /// deadline.
  Future<void> enableDomainAutoRenew(String domainName) async {}

  /// This operation sets the transfer lock on the domain (specifically the
  /// `clientTransferProhibited` status) to prevent domain transfers. Successful
  /// submission returns an operation ID that you can use to track the progress
  /// and completion of the action. If the request is not completed
  /// successfully, the domain registrant will be notified by email.
  Future<void> enableDomainTransferLock(String domainName) async {}

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation returns information about whether the registrant contact has
  /// responded.
  ///
  /// If you want us to resend the email, use the
  /// `ResendContactReachabilityEmail` operation.
  Future<void> getContactReachabilityStatus({String domainName}) async {}

  /// This operation returns detailed information about a specified domain that
  /// is associated with the current AWS account. Contact information for the
  /// domain is also returned as part of the output.
  Future<void> getDomainDetail(String domainName) async {}

  /// The GetDomainSuggestions operation returns a list of suggested domain
  /// names given a string, which can either be a domain name or simply a word
  /// or phrase (without spaces).
  Future<void> getDomainSuggestions(
      {@required String domainName,
      @required int suggestionCount,
      @required bool onlyAvailable}) async {}

  /// This operation returns the current status of an operation that is not
  /// completed.
  Future<void> getOperationDetail(String operationId) async {}

  /// This operation returns all the domain names registered with Amazon Route
  /// 53 for the current AWS account.
  Future<void> listDomains({String marker, int maxItems}) async {}

  /// This operation returns the operation IDs of operations that are not yet
  /// complete.
  Future<void> listOperations(
      {DateTime submittedSince, String marker, int maxItems}) async {}

  /// This operation returns all of the tags that are associated with the
  /// specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  Future<void> listTagsForDomain(String domainName) async {}

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
  /// more information, see [Amazon Route 53
  /// Pricing](http://aws.amazon.com/route53/pricing/).
  Future<void> registerDomain(
      {@required String domainName,
      String idnLangCode,
      @required int durationInYears,
      bool autoRenew,
      @required ContactDetail adminContact,
      @required ContactDetail registrantContact,
      @required ContactDetail techContact,
      bool privacyProtectAdminContact,
      bool privacyProtectRegistrantContact,
      bool privacyProtectTechContact}) async {}

  /// This operation renews a domain for the specified number of years. The cost
  /// of renewing your domain is billed to your AWS account.
  ///
  /// We recommend that you renew your domain several weeks before the
  /// expiration date. Some TLD registries delete domains before the expiration
  /// date if you haven't renewed far enough in advance. For more information
  /// about renewing domain registration, see [Renewing Registration for a
  /// Domain](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html)
  /// in the Amazon Route 53 Developer Guide.
  Future<void> renewDomain(
      {@required String domainName,
      int durationInYears,
      @required int currentExpiryYear}) async {}

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation resends the confirmation email to the current email address for
  /// the registrant contact.
  Future<void> resendContactReachabilityEmail({String domainName}) async {}

  /// This operation returns the AuthCode for the domain. To transfer a domain
  /// to another registrar, you provide this value to the new registrar.
  Future<void> retrieveDomainAuthCode(String domainName) async {}

  /// This operation transfers a domain from another registrar to Amazon Route
  /// 53. When the transfer is complete, the domain is registered either with
  /// Amazon Registrar (for .com, .net, and .org domains) or with our registrar
  /// associate, Gandi (for all other TLDs).
  ///
  /// For transfer requirements, a detailed procedure, and information about
  /// viewing the status of a domain transfer, see [Transferring Registration
  /// for a Domain to Amazon Route
  /// 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html)
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
  Future<void> transferDomain(
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
      bool privacyProtectTechContact}) async {}

  /// This operation updates the contact information for a particular domain.
  /// You must specify information for at least one contact: registrant,
  /// administrator, or technical.
  ///
  /// If the update is successful, this method returns an operation ID that you
  /// can use to track the progress and completion of the action. If the request
  /// is not completed successfully, the domain registrant will be notified by
  /// email.
  Future<void> updateDomainContact(String domainName,
      {ContactDetail adminContact,
      ContactDetail registrantContact,
      ContactDetail techContact}) async {}

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
  Future<void> updateDomainContactPrivacy(String domainName,
      {bool adminPrivacy, bool registrantPrivacy, bool techPrivacy}) async {}

  /// This operation replaces the current set of name servers for the domain
  /// with the specified set of name servers. If you use Amazon Route 53 as your
  /// DNS service, specify the four name servers in the delegation set for the
  /// hosted zone for the domain.
  ///
  /// If successful, this operation returns an operation ID that you can use to
  /// track the progress and completion of the action. If the request is not
  /// completed successfully, the domain registrant will be notified by email.
  Future<void> updateDomainNameservers(
      {@required String domainName,
      String fiAuthKey,
      @required List<Nameserver> nameservers}) async {}

  /// This operation adds or updates tags for a specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  Future<void> updateTagsForDomain(String domainName,
      {List<Tag> tagsToUpdate}) async {}

  /// Returns all the domain-related billing records for the current AWS account
  /// for a specified period
  Future<void> viewBilling(
      {DateTime start, DateTime end, String marker, int maxItems}) async {}
}

class BillingRecord {}

class CheckDomainAvailabilityResponse {}

class CheckDomainTransferabilityResponse {}

class ContactDetail {}

class DeleteTagsForDomainResponse {}

class DisableDomainAutoRenewResponse {}

class DisableDomainTransferLockResponse {}

class DomainSuggestion {}

class DomainSummary {}

class DomainTransferability {}

class EnableDomainAutoRenewResponse {}

class EnableDomainTransferLockResponse {}

class ExtraParam {}

class GetContactReachabilityStatusResponse {}

class GetDomainDetailResponse {}

class GetDomainSuggestionsResponse {}

class GetOperationDetailResponse {}

class ListDomainsResponse {}

class ListOperationsResponse {}

class ListTagsForDomainResponse {}

class Nameserver {}

class OperationSummary {}

class RegisterDomainResponse {}

class RenewDomainResponse {}

class ResendContactReachabilityEmailResponse {}

class RetrieveDomainAuthCodeResponse {}

class Tag {}

class TransferDomainResponse {}

class UpdateDomainContactPrivacyResponse {}

class UpdateDomainContactResponse {}

class UpdateDomainNameserversResponse {}

class UpdateTagsForDomainResponse {}

class ViewBillingResponse {}
