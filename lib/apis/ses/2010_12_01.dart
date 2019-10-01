import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Simple Email Service
///
///  This document contains reference information for the [Amazon Simple Email
/// Service](https://aws.amazon.com/ses/) (Amazon SES) API, version 2010-12-01.
/// This document is best used in conjunction with the [Amazon SES Developer
/// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html).
///
///   For a list of Amazon SES endpoints to use in service requests, see
/// [Regions and Amazon
/// SES](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html) in
/// the [Amazon SES Developer
/// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html).
class SesApi {
  /// Creates a receipt rule set by cloning an existing one. All receipt rules
  /// and configurations are copied to the new receipt rule set and are
  /// completely independent of the source rule set.
  ///
  /// For information about setting up rule sets, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the rule set to create. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Start and end with a letter or number.
  ///
  /// *   Contain less than 64 characters.
  ///
  /// [originalRuleSetName]: The name of the rule set to clone.
  Future<CloneReceiptRuleSetResponse> cloneReceiptRuleSet(
      {@required String ruleSetName,
      @required String originalRuleSetName}) async {
    return CloneReceiptRuleSetResponse.fromJson({});
  }

  /// Creates a configuration set.
  ///
  /// Configuration sets enable you to publish email sending events. For
  /// information about using configuration sets, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSet]: A data structure that contains the name of the
  /// configuration set.
  Future<CreateConfigurationSetResponse> createConfigurationSet(
      ConfigurationSet configurationSet) async {
    return CreateConfigurationSetResponse.fromJson({});
  }

  /// Creates a configuration set event destination.
  ///
  ///  When you create or update an event destination, you must provide one, and
  /// only one, destination. The destination can be CloudWatch, Amazon Kinesis
  /// Firehose, or Amazon Simple Notification Service (Amazon SNS).
  ///
  /// An event destination is the AWS service to which Amazon SES publishes the
  /// email sending events associated with a configuration set. For information
  /// about using configuration sets, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set that the event
  /// destination should be associated with.
  ///
  /// [eventDestination]: An object that describes the AWS service that email
  /// sending event information will be published to.
  Future<CreateConfigurationSetEventDestinationResponse>
      createConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required EventDestination eventDestination}) async {
    return CreateConfigurationSetEventDestinationResponse.fromJson({});
  }

  /// Creates an association between a configuration set and a custom domain for
  /// open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html).
  ///
  /// [configurationSetName]: The name of the configuration set that the
  /// tracking options should be associated with.
  Future<CreateConfigurationSetTrackingOptionsResponse>
      createConfigurationSetTrackingOptions(
          {@required String configurationSetName,
          @required TrackingOptions trackingOptions}) async {
    return CreateConfigurationSetTrackingOptionsResponse.fromJson({});
  }

  /// Creates a new custom verification email template.
  ///
  /// For more information about custom verification email templates, see [Using
  /// Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the custom verification email template.
  ///
  /// [fromEmailAddress]: The email address that the custom verification email
  /// is sent from.
  ///
  /// [templateSubject]: The subject line of the custom verification email.
  ///
  /// [templateContent]: The content of the custom verification email. The total
  /// size of the email must be less than 10 MB. The message body may contain
  /// HTML, with some limitations. For more information, see [Custom
  /// Verification Email Frequently Asked
  /// Questions](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// [successRedirectionUrl]: The URL that the recipient of the verification
  /// email is sent to if his or her address is successfully verified.
  ///
  /// [failureRedirectionUrl]: The URL that the recipient of the verification
  /// email is sent to if his or her address is not successfully verified.
  Future<void> createCustomVerificationEmailTemplate(
      {@required String templateName,
      @required String fromEmailAddress,
      @required String templateSubject,
      @required String templateContent,
      @required String successRedirectionUrl,
      @required String failureRedirectionUrl}) async {}

  /// Creates a new IP address filter.
  ///
  /// For information about setting up IP address filters, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [filter]: A data structure that describes the IP address filter to create,
  /// which consists of a name, an IP address range, and whether to allow or
  /// block mail from it.
  Future<CreateReceiptFilterResponse> createReceiptFilter(
      ReceiptFilter filter) async {
    return CreateReceiptFilterResponse.fromJson({});
  }

  /// Creates a receipt rule.
  ///
  /// For information about setting up receipt rules, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the rule set that the receipt rule will be
  /// added to.
  ///
  /// [after]: The name of an existing rule after which the new rule will be
  /// placed. If this parameter is null, the new rule will be inserted at the
  /// beginning of the rule list.
  ///
  /// [rule]: A data structure that contains the specified rule's name, actions,
  /// recipients, domains, enabled status, scan status, and TLS policy.
  Future<CreateReceiptRuleResponse> createReceiptRule(
      {@required String ruleSetName,
      String after,
      @required ReceiptRule rule}) async {
    return CreateReceiptRuleResponse.fromJson({});
  }

  /// Creates an empty receipt rule set.
  ///
  /// For information about setting up receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the rule set to create. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Start and end with a letter or number.
  ///
  /// *   Contain less than 64 characters.
  Future<CreateReceiptRuleSetResponse> createReceiptRuleSet(
      String ruleSetName) async {
    return CreateReceiptRuleSetResponse.fromJson({});
  }

  /// Creates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single API operation. For more
  /// information, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [template]: The content of the email, composed of a subject line, an HTML
  /// part, and a text-only part.
  Future<CreateTemplateResponse> createTemplate(Template template) async {
    return CreateTemplateResponse.fromJson({});
  }

  /// Deletes a configuration set. Configuration sets enable you to publish
  /// email sending events. For information about using configuration sets, see
  /// the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set to delete.
  Future<DeleteConfigurationSetResponse> deleteConfigurationSet(
      String configurationSetName) async {
    return DeleteConfigurationSetResponse.fromJson({});
  }

  /// Deletes a configuration set event destination. Configuration set event
  /// destinations are associated with configuration sets, which enable you to
  /// publish email sending events. For information about using configuration
  /// sets, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set from which to
  /// delete the event destination.
  ///
  /// [eventDestinationName]: The name of the event destination to delete.
  Future<DeleteConfigurationSetEventDestinationResponse>
      deleteConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required String eventDestinationName}) async {
    return DeleteConfigurationSetEventDestinationResponse.fromJson({});
  }

  /// Deletes an association between a configuration set and a custom domain for
  /// open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html).
  ///
  ///
  ///
  /// Deleting this kind of association will result in emails sent using the
  /// specified configuration set to capture open and click events using the
  /// standard, Amazon SES-operated domains.
  ///
  /// [configurationSetName]: The name of the configuration set from which you
  /// want to delete the tracking options.
  Future<DeleteConfigurationSetTrackingOptionsResponse>
      deleteConfigurationSetTrackingOptions(String configurationSetName) async {
    return DeleteConfigurationSetTrackingOptionsResponse.fromJson({});
  }

  /// Deletes an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see [Using
  /// Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the custom verification email template that
  /// you want to delete.
  Future<void> deleteCustomVerificationEmailTemplate(
      String templateName) async {}

  /// Deletes the specified identity (an email address or a domain) from the
  /// list of verified identities.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The identity to be removed from the list of identities for the
  /// AWS Account.
  Future<DeleteIdentityResponse> deleteIdentity(String identity) async {
    return DeleteIdentityResponse.fromJson({});
  }

  /// Deletes the specified sending authorization policy for the given identity
  /// (an email address or a domain). This API returns successfully even if a
  /// policy with the specified name does not exist.
  ///
  ///  This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  ///
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The identity that is associated with the policy that you want
  /// to delete. You can specify the identity by using its name or by using its
  /// Amazon Resource Name (ARN). Examples: `user@example.com`, `example.com`,
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  ///
  /// To successfully call this API, you must own the identity.
  ///
  /// [policyName]: The name of the policy to be deleted.
  Future<DeleteIdentityPolicyResponse> deleteIdentityPolicy(
      {@required String identity, @required String policyName}) async {
    return DeleteIdentityPolicyResponse.fromJson({});
  }

  /// Deletes the specified IP address filter.
  ///
  /// For information about managing IP address filters, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [filterName]: The name of the IP address filter to delete.
  Future<DeleteReceiptFilterResponse> deleteReceiptFilter(
      String filterName) async {
    return DeleteReceiptFilterResponse.fromJson({});
  }

  /// Deletes the specified receipt rule.
  ///
  /// For information about managing receipt rules, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set that contains the receipt
  /// rule to delete.
  ///
  /// [ruleName]: The name of the receipt rule to delete.
  Future<DeleteReceiptRuleResponse> deleteReceiptRule(
      {@required String ruleSetName, @required String ruleName}) async {
    return DeleteReceiptRuleResponse.fromJson({});
  }

  /// Deletes the specified receipt rule set and all of the receipt rules it
  /// contains.
  ///
  ///  The currently active rule set cannot be deleted.
  ///
  /// For information about managing receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set to delete.
  Future<DeleteReceiptRuleSetResponse> deleteReceiptRuleSet(
      String ruleSetName) async {
    return DeleteReceiptRuleSetResponse.fromJson({});
  }

  /// Deletes an email template.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the template to be deleted.
  Future<DeleteTemplateResponse> deleteTemplate(String templateName) async {
    return DeleteTemplateResponse.fromJson({});
  }

  /// Deprecated. Use the `DeleteIdentity` operation to delete email addresses
  /// and domains.
  ///
  /// [emailAddress]: An email address to be removed from the list of verified
  /// addresses.
  Future<void> deleteVerifiedEmailAddress(String emailAddress) async {}

  /// Returns the metadata and receipt rules for the receipt rule set that is
  /// currently active.
  ///
  /// For information about setting up receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html).
  ///
  /// You can execute this operation no more than once per second.
  Future<DescribeActiveReceiptRuleSetResponse>
      describeActiveReceiptRuleSet() async {
    return DescribeActiveReceiptRuleSetResponse.fromJson({});
  }

  /// Returns the details of the specified configuration set. For information
  /// about using configuration sets, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set to describe.
  ///
  /// [configurationSetAttributeNames]: A list of configuration set attributes
  /// to return.
  Future<DescribeConfigurationSetResponse> describeConfigurationSet(
      String configurationSetName,
      {List<String> configurationSetAttributeNames}) async {
    return DescribeConfigurationSetResponse.fromJson({});
  }

  /// Returns the details of the specified receipt rule.
  ///
  /// For information about setting up receipt rules, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set that the receipt rule
  /// belongs to.
  ///
  /// [ruleName]: The name of the receipt rule.
  Future<DescribeReceiptRuleResponse> describeReceiptRule(
      {@required String ruleSetName, @required String ruleName}) async {
    return DescribeReceiptRuleResponse.fromJson({});
  }

  /// Returns the details of the specified receipt rule set.
  ///
  /// For information about managing receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set to describe.
  Future<DescribeReceiptRuleSetResponse> describeReceiptRuleSet(
      String ruleSetName) async {
    return DescribeReceiptRuleSetResponse.fromJson({});
  }

  /// Returns the email sending status of the Amazon SES account for the current
  /// region.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetAccountSendingEnabledResponse> getAccountSendingEnabled() async {
    return GetAccountSendingEnabledResponse.fromJson({});
  }

  /// Returns the custom email verification template for the template name you
  /// specify.
  ///
  /// For more information about custom verification email templates, see [Using
  /// Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the custom verification email template that
  /// you want to retrieve.
  Future<GetCustomVerificationEmailTemplateResponse>
      getCustomVerificationEmailTemplate(String templateName) async {
    return GetCustomVerificationEmailTemplateResponse.fromJson({});
  }

  /// Returns the current status of Easy DKIM signing for an entity. For domain
  /// name identities, this operation also returns the DKIM tokens that are
  /// required for Easy DKIM signing, and whether Amazon SES has successfully
  /// verified that these tokens have been published.
  ///
  /// This operation takes a list of identities as input and returns the
  /// following information for each:
  ///
  /// *   Whether Easy DKIM signing is enabled or disabled.
  ///
  /// *   A set of DKIM tokens that represent the identity. If the identity is
  /// an email address, the tokens represent the domain of that address.
  ///
  /// *   Whether Amazon SES has successfully verified the DKIM tokens published
  /// in the domain's DNS. This information is only returned for domain name
  /// identities, not for email addresses.
  ///
  ///
  /// This operation is throttled at one request per second and can only get
  /// DKIM attributes for up to 100 identities at a time.
  ///
  /// For more information about creating DNS records using DKIM tokens, go to
  /// the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html).
  ///
  /// [identities]: A list of one or more verified identities - email addresses,
  /// domains, or both.
  Future<GetIdentityDkimAttributesResponse> getIdentityDkimAttributes(
      List<String> identities) async {
    return GetIdentityDkimAttributesResponse.fromJson({});
  }

  /// Returns the custom MAIL FROM attributes for a list of identities (email
  /// addresses : domains).
  ///
  /// This operation is throttled at one request per second and can only get
  /// custom MAIL FROM attributes for up to 100 identities at a time.
  ///
  /// [identities]: A list of one or more identities.
  Future<GetIdentityMailFromDomainAttributesResponse>
      getIdentityMailFromDomainAttributes(List<String> identities) async {
    return GetIdentityMailFromDomainAttributesResponse.fromJson({});
  }

  /// Given a list of verified identities (email addresses and/or domains),
  /// returns a structure describing identity notification attributes.
  ///
  /// This operation is throttled at one request per second and can only get
  /// notification attributes for up to 100 identities at a time.
  ///
  /// For more information about using notifications with Amazon SES, see the
  /// [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html).
  ///
  /// [identities]: A list of one or more identities. You can specify an
  /// identity by using its name or by using its Amazon Resource Name (ARN).
  /// Examples: `user@example.com`, `example.com`,
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  Future<GetIdentityNotificationAttributesResponse>
      getIdentityNotificationAttributes(List<String> identities) async {
    return GetIdentityNotificationAttributesResponse.fromJson({});
  }

  /// Returns the requested sending authorization policies for the given
  /// identity (an email address or a domain). The policies are returned as a
  /// map of policy names to policy contents. You can retrieve a maximum of 20
  /// policies at a time.
  ///
  ///  This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  ///
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The identity for which the policies will be retrieved. You can
  /// specify an identity by using its name or by using its Amazon Resource Name
  /// (ARN). Examples: `user@example.com`, `example.com`,
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  ///
  /// To successfully call this API, you must own the identity.
  ///
  /// [policyNames]: A list of the names of policies to be retrieved. You can
  /// retrieve a maximum of 20 policies at a time. If you do not know the names
  /// of the policies that are attached to the identity, you can use
  /// `ListIdentityPolicies`.
  Future<GetIdentityPoliciesResponse> getIdentityPolicies(
      {@required String identity, @required List<String> policyNames}) async {
    return GetIdentityPoliciesResponse.fromJson({});
  }

  /// Given a list of identities (email addresses and/or domains), returns the
  /// verification status and (for domain identities) the verification token for
  /// each identity.
  ///
  /// The verification status of an email address is "Pending" until the email
  /// address owner clicks the link within the verification email that Amazon
  /// SES sent to that address. If the email address owner clicks the link
  /// within 24 hours, the verification status of the email address changes to
  /// "Success". If the link is not clicked within 24 hours, the verification
  /// status changes to "Failed." In that case, if you still want to verify the
  /// email address, you must restart the verification process from the
  /// beginning.
  ///
  /// For domain identities, the domain's verification status is "Pending" as
  /// Amazon SES searches for the required TXT record in the DNS settings of the
  /// domain. When Amazon SES detects the record, the domain's verification
  /// status changes to "Success". If Amazon SES is unable to detect the record
  /// within 72 hours, the domain's verification status changes to "Failed." In
  /// that case, if you still want to verify the domain, you must restart the
  /// verification process from the beginning.
  ///
  /// This operation is throttled at one request per second and can only get
  /// verification attributes for up to 100 identities at a time.
  ///
  /// [identities]: A list of identities.
  Future<GetIdentityVerificationAttributesResponse>
      getIdentityVerificationAttributes(List<String> identities) async {
    return GetIdentityVerificationAttributesResponse.fromJson({});
  }

  /// Provides the sending limits for the Amazon SES account.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendQuotaResponse> getSendQuota() async {
    return GetSendQuotaResponse.fromJson({});
  }

  /// Provides sending statistics for the current AWS Region. The result is a
  /// list of data points, representing the last two weeks of sending activity.
  /// Each data point in the list contains statistics for a 15-minute period of
  /// time.
  ///
  /// You can execute this operation no more than once per second.
  Future<GetSendStatisticsResponse> getSendStatistics() async {
    return GetSendStatisticsResponse.fromJson({});
  }

  /// Displays the template object (which includes the Subject line, HTML part
  /// and text part) for the template you specify.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the template you want to retrieve.
  Future<GetTemplateResponse> getTemplate(String templateName) async {
    return GetTemplateResponse.fromJson({});
  }

  /// Provides a list of the configuration sets associated with your Amazon SES
  /// account in the current AWS Region. For information about using
  /// configuration sets, see [Monitoring Your Amazon SES Sending
  /// Activity](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// You can execute this operation no more than once per second. This
  /// operation will return up to 1,000 configuration sets each time it is run.
  /// If your Amazon SES account has more than 1,000 configuration sets, this
  /// operation will also return a NextToken element. You can then execute the
  /// `ListConfigurationSets` operation again, passing the `NextToken` parameter
  /// and the value of the NextToken element to retrieve additional results.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListConfigurationSets` to indicate the position of the configuration set
  /// in the configuration set list.
  ///
  /// [maxItems]: The number of configuration sets to return.
  Future<ListConfigurationSetsResponse> listConfigurationSets(
      {String nextToken, int maxItems}) async {
    return ListConfigurationSetsResponse.fromJson({});
  }

  /// Lists the existing custom verification email templates for your account in
  /// the current AWS Region.
  ///
  /// For more information about custom verification email templates, see [Using
  /// Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [nextToken]: An array the contains the name and creation time stamp for
  /// each template in your Amazon SES account.
  ///
  /// [maxResults]: The maximum number of custom verification email templates to
  /// return. This value must be at least 1 and less than or equal to 50. If you
  /// do not specify a value, or if you specify a value less than 1 or greater
  /// than 50, the operation will return up to 50 results.
  Future<ListCustomVerificationEmailTemplatesResponse>
      listCustomVerificationEmailTemplates(
          {String nextToken, int maxResults}) async {
    return ListCustomVerificationEmailTemplatesResponse.fromJson({});
  }

  /// Returns a list containing all of the identities (email addresses and
  /// domains) for your AWS account in the current AWS Region, regardless of
  /// verification status.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identityType]: The type of the identities to list. Possible values are
  /// "EmailAddress" and "Domain". If this parameter is omitted, then all
  /// identities will be listed.
  ///
  /// [nextToken]: The token to use for pagination.
  ///
  /// [maxItems]: The maximum number of identities per page. Possible values are
  /// 1-1000 inclusive.
  Future<ListIdentitiesResponse> listIdentities(
      {String identityType, String nextToken, int maxItems}) async {
    return ListIdentitiesResponse.fromJson({});
  }

  /// Returns a list of sending authorization policies that are attached to the
  /// given identity (an email address or a domain). This API returns only a
  /// list. If you want the actual policy content, you can use
  /// `GetIdentityPolicies`.
  ///
  ///  This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  ///
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The identity that is associated with the policy for which the
  /// policies will be listed. You can specify an identity by using its name or
  /// by using its Amazon Resource Name (ARN). Examples: `user@example.com`,
  /// `example.com`, `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  ///
  /// To successfully call this API, you must own the identity.
  Future<ListIdentityPoliciesResponse> listIdentityPolicies(
      String identity) async {
    return ListIdentityPoliciesResponse.fromJson({});
  }

  /// Lists the IP address filters associated with your AWS account in the
  /// current AWS Region.
  ///
  /// For information about managing IP address filters, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html).
  ///
  /// You can execute this operation no more than once per second.
  Future<ListReceiptFiltersResponse> listReceiptFilters() async {
    return ListReceiptFiltersResponse.fromJson({});
  }

  /// Lists the receipt rule sets that exist under your AWS account in the
  /// current AWS Region. If there are additional receipt rule sets to be
  /// retrieved, you will receive a `NextToken` that you can provide to the next
  /// call to `ListReceiptRuleSets` to retrieve the additional entries.
  ///
  /// For information about managing receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListReceiptRuleSets` to indicate the position in the receipt rule set
  /// list.
  Future<ListReceiptRuleSetsResponse> listReceiptRuleSets(
      {String nextToken}) async {
    return ListReceiptRuleSetsResponse.fromJson({});
  }

  /// Lists the email templates present in your Amazon SES account in the
  /// current AWS Region.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [nextToken]: A token returned from a previous call to `ListTemplates` to
  /// indicate the position in the list of email templates.
  ///
  /// [maxItems]: The maximum number of templates to return. This value must be
  /// at least 1 and less than or equal to 10. If you do not specify a value, or
  /// if you specify a value less than 1 or greater than 10, the operation will
  /// return up to 10 results.
  Future<ListTemplatesResponse> listTemplates(
      {String nextToken, int maxItems}) async {
    return ListTemplatesResponse.fromJson({});
  }

  /// Deprecated. Use the `ListIdentities` operation to list the email addresses
  /// and domains associated with your account.
  Future<ListVerifiedEmailAddressesResponse>
      listVerifiedEmailAddresses() async {
    return ListVerifiedEmailAddressesResponse.fromJson({});
  }

  /// Adds or updates the delivery options for a configuration set.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// specify the delivery options for.
  ///
  /// [deliveryOptions]: Specifies whether messages that use the configuration
  /// set are required to use Transport Layer Security (TLS).
  Future<PutConfigurationSetDeliveryOptionsResponse>
      putConfigurationSetDeliveryOptions(String configurationSetName,
          {DeliveryOptions deliveryOptions}) async {
    return PutConfigurationSetDeliveryOptionsResponse.fromJson({});
  }

  /// Adds or updates a sending authorization policy for the specified identity
  /// (an email address or a domain).
  ///
  ///  This API is for the identity owner only. If you have not verified the
  /// identity, this API will return an error.
  ///
  /// Sending authorization is a feature that enables an identity owner to
  /// authorize other senders to use its identities. For information about using
  /// sending authorization, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The identity that the policy will apply to. You can specify an
  /// identity by using its name or by using its Amazon Resource Name (ARN).
  /// Examples: `user@example.com`, `example.com`,
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  ///
  /// To successfully call this API, you must own the identity.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// The policy name cannot exceed 64 characters and can only include
  /// alphanumeric characters, dashes, and underscores.
  ///
  /// [policy]: The text of the policy in JSON format. The policy cannot exceed
  /// 4 KB.
  ///
  /// For information about the syntax of sending authorization policies, see
  /// the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-policies.html).
  Future<PutIdentityPolicyResponse> putIdentityPolicy(
      {@required String identity,
      @required String policyName,
      @required String policy}) async {
    return PutIdentityPolicyResponse.fromJson({});
  }

  /// Reorders the receipt rules within a receipt rule set.
  ///
  ///  All of the rules in the rule set must be represented in this request.
  /// That is, this API will return an error if the reorder request doesn't
  /// explicitly position all of the rules.
  ///
  /// For information about managing receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set to reorder.
  ///
  /// [ruleNames]: A list of the specified receipt rule set's receipt rules in
  /// the order that you want to put them.
  Future<ReorderReceiptRuleSetResponse> reorderReceiptRuleSet(
      {@required String ruleSetName, @required List<String> ruleNames}) async {
    return ReorderReceiptRuleSetResponse.fromJson({});
  }

  /// Generates and sends a bounce message to the sender of an email you
  /// received through Amazon SES. You can only use this API on an email up to
  /// 24 hours after you receive it.
  ///
  ///  You cannot use this API to send generic bounces for mail that was not
  /// received by Amazon SES.
  ///
  /// For information about receiving email through Amazon SES, see the [Amazon
  /// SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [originalMessageId]: The message ID of the message to be bounced.
  ///
  /// [bounceSender]: The address to use in the "From" header of the bounce
  /// message. This must be an identity that you have verified with Amazon SES.
  ///
  /// [explanation]: Human-readable text for the bounce message to explain the
  /// failure. If not specified, the text will be auto-generated based on the
  /// bounced recipient information.
  ///
  /// [messageDsn]: Message-related DSN fields. If not specified, Amazon SES
  /// will choose the values.
  ///
  /// [bouncedRecipientInfoList]: A list of recipients of the bounced message,
  /// including the information required to create the Delivery Status
  /// Notifications (DSNs) for the recipients. You must specify at least one
  /// `BouncedRecipientInfo` in the list.
  ///
  /// [bounceSenderArn]: This parameter is used only for sending authorization.
  /// It is the ARN of the identity that is associated with the sending
  /// authorization policy that permits you to use the address in the "From"
  /// header of the bounce. For more information about sending authorization,
  /// see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  Future<SendBounceResponse> sendBounce(
      {@required String originalMessageId,
      @required String bounceSender,
      String explanation,
      MessageDsn messageDsn,
      @required List<BouncedRecipientInfo> bouncedRecipientInfoList,
      String bounceSenderArn}) async {
    return SendBounceResponse.fromJson({});
  }

  /// Composes an email message to multiple destinations. The message body is
  /// created using an email template.
  ///
  /// In order to send email using the `SendBulkTemplatedEmail` operation, your
  /// call to the API must meet the following requirements:
  ///
  /// *   The call must refer to an existing email template. You can create
  /// email templates using the CreateTemplate operation.
  ///
  /// *   The message must be sent from a verified email address or domain.
  ///
  /// *   If your account is still in the Amazon SES sandbox, you may only send
  /// to verified addresses or domains, or to email addresses associated with
  /// the Amazon SES Mailbox Simulator. For more information, see [Verifying
  /// Email Addresses and
  /// Domains](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// *   The maximum message size is 10 MB.
  ///
  /// *   Each `Destination` parameter must include at least one recipient email
  /// address. The recipient address can be a To: address, a CC: address, or a
  /// BCC: address. If a recipient email address is invalid (that is, it is not
  /// in the format _UserName@\[SubDomain.\]Domain.TopLevelDomain_), the entire
  /// message will be rejected, even if the message contains other recipients
  /// that are valid.
  ///
  /// *   The message may not include more than 50 recipients, across the To:,
  /// CC: and BCC: fields. If you need to send an email message to a larger
  /// audience, you can divide your recipient list into groups of 50 or fewer,
  /// and then call the `SendBulkTemplatedEmail` operation several times to send
  /// the message to each group.
  ///
  /// *   The number of destinations you can contact in a single call to the API
  /// may be limited by your account's maximum sending rate.
  ///
  /// [source]: The email address that is sending the email. This email address
  /// must be either individually verified with Amazon SES, or from a domain
  /// that has been verified with Amazon SES. For information about verifying
  /// identities, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html).
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// `SourceArn` parameter. For more information about sending authorization,
  /// see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  ///
  ///
  /// Amazon SES does not support the SMTPUTF8 extension, as described in
  /// [RFC6531](https://tools.ietf.org/html/rfc6531). For this reason, the
  /// _local part_ of a source email address (the part of the email address that
  /// precedes the @ sign) may only contain [7-bit ASCII
  /// characters](https://en.wikipedia.org/wiki/Email_address#Local-part). If
  /// the _domain part_ of an address (the part after the @ sign) contains
  /// non-ASCII characters, they must be encoded using Punycode, as described in
  /// [RFC3492](https://tools.ietf.org/html/rfc3492.html). The sender name (also
  /// known as the _friendly name_) may contain non-ASCII characters. These
  /// characters must be encoded using MIME encoded-word syntax, as described in
  /// [RFC 2047](https://tools.ietf.org/html/rfc2047). MIME encoded-word syntax
  /// uses the following form: `=?charset?encoding?encoded-text?=`.
  ///
  /// [sourceArn]: This parameter is used only for sending authorization. It is
  /// the ARN of the identity that is associated with the sending authorization
  /// policy that permits you to send for the email address specified in the
  /// `Source` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to send from `user@example.com`, then you
  /// would specify the `SourceArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `Source` to be `user@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [replyToAddresses]: The reply-to email address(es) for the message. If the
  /// recipient replies to the message, each reply-to address will receive the
  /// reply.
  ///
  /// [returnPath]: The email address that bounces and complaints will be
  /// forwarded to when feedback forwarding is enabled. If the message cannot be
  /// delivered to the recipient, then an error message will be returned from
  /// the recipient's ISP; this message will then be forwarded to the email
  /// address specified by the `ReturnPath` parameter. The `ReturnPath`
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
  ///
  /// [returnPathArn]: This parameter is used only for sending authorization. It
  /// is the ARN of the identity that is associated with the sending
  /// authorization policy that permits you to use the email address specified
  /// in the `ReturnPath` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to use `feedback@example.com`, then you
  /// would specify the `ReturnPathArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `ReturnPath` to be `feedback@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [configurationSetName]: The name of the configuration set to use when you
  /// send an email using `SendBulkTemplatedEmail`.
  ///
  /// [defaultTags]: A list of tags, in the form of name/value pairs, to apply
  /// to an email that you send to a destination using `SendBulkTemplatedEmail`.
  ///
  /// [template]: The template to use when sending this email.
  ///
  /// [templateArn]: The ARN of the template to use when sending this email.
  ///
  /// [defaultTemplateData]: A list of replacement values to apply to the
  /// template when replacement data is not specified in a Destination object.
  /// These values act as a default or fallback option when no other data is
  /// available.
  ///
  /// The template data is a JSON object, typically consisting of key-value
  /// pairs in which the keys correspond to replacement tags in the email
  /// template.
  ///
  /// [destinations]: One or more `Destination` objects. All of the recipients
  /// in a `Destination` will receive the same version of the email. You can
  /// specify up to 50 `Destination` objects within a `Destinations` array.
  Future<SendBulkTemplatedEmailResponse> sendBulkTemplatedEmail(
      {@required String source,
      String sourceArn,
      List<String> replyToAddresses,
      String returnPath,
      String returnPathArn,
      String configurationSetName,
      List<MessageTag> defaultTags,
      @required String template,
      String templateArn,
      String defaultTemplateData,
      @required List<BulkEmailDestination> destinations}) async {
    return SendBulkTemplatedEmailResponse.fromJson({});
  }

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current AWS Region and attempts to verify it. As a result
  /// of executing this operation, a customized verification email is sent to
  /// the specified address.
  ///
  /// To use this operation, you must first create a custom verification email
  /// template. For more information about creating and using custom
  /// verification email templates, see [Using Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [emailAddress]: The email address to verify.
  ///
  /// [templateName]: The name of the custom verification email template to use
  /// when sending the verification email.
  ///
  /// [configurationSetName]: Name of a configuration set to use when sending
  /// the verification email.
  Future<SendCustomVerificationEmailResponse> sendCustomVerificationEmail(
      {@required String emailAddress,
      @required String templateName,
      String configurationSetName}) async {
    return SendCustomVerificationEmailResponse.fromJson({});
  }

  /// Composes an email message and immediately queues it for sending. In order
  /// to send email using the `SendEmail` operation, your message must meet the
  /// following requirements:
  ///
  /// *   The message must be sent from a verified email address or domain. If
  /// you attempt to send email using a non-verified address or domain, the
  /// operation will result in an "Email address not verified" error.
  ///
  /// *   If your account is still in the Amazon SES sandbox, you may only send
  /// to verified addresses or domains, or to email addresses associated with
  /// the Amazon SES Mailbox Simulator. For more information, see [Verifying
  /// Email Addresses and
  /// Domains](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// *   The maximum message size is 10 MB.
  ///
  /// *   The message must include at least one recipient email address. The
  /// recipient address can be a To: address, a CC: address, or a BCC: address.
  /// If a recipient email address is invalid (that is, it is not in the format
  /// _UserName@\[SubDomain.\]Domain.TopLevelDomain_), the entire message will
  /// be rejected, even if the message contains other recipients that are valid.
  ///
  /// *   The message may not include more than 50 recipients, across the To:,
  /// CC: and BCC: fields. If you need to send an email message to a larger
  /// audience, you can divide your recipient list into groups of 50 or fewer,
  /// and then call the `SendEmail` operation several times to send the message
  /// to each group.
  ///
  ///
  ///
  ///
  /// For every message that you send, the total number of recipients (including
  /// each recipient in the To:, CC: and BCC: fields) is counted against the
  /// maximum number of emails you can send in a 24-hour period (your _sending
  /// quota_). For more information about sending quotas in Amazon SES, see
  /// [Managing Your Amazon SES Sending
  /// Limits](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// [source]: The email address that is sending the email. This email address
  /// must be either individually verified with Amazon SES, or from a domain
  /// that has been verified with Amazon SES. For information about verifying
  /// identities, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html).
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// `SourceArn` parameter. For more information about sending authorization,
  /// see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  ///
  ///
  /// Amazon SES does not support the SMTPUTF8 extension, as described in
  /// [RFC6531](https://tools.ietf.org/html/rfc6531). For this reason, the
  /// _local part_ of a source email address (the part of the email address that
  /// precedes the @ sign) may only contain [7-bit ASCII
  /// characters](https://en.wikipedia.org/wiki/Email_address#Local-part). If
  /// the _domain part_ of an address (the part after the @ sign) contains
  /// non-ASCII characters, they must be encoded using Punycode, as described in
  /// [RFC3492](https://tools.ietf.org/html/rfc3492.html). The sender name (also
  /// known as the _friendly name_) may contain non-ASCII characters. These
  /// characters must be encoded using MIME encoded-word syntax, as described in
  /// [RFC 2047](https://tools.ietf.org/html/rfc2047). MIME encoded-word syntax
  /// uses the following form: `=?charset?encoding?encoded-text?=`.
  ///
  /// [destination]: The destination for this email, composed of To:, CC:, and
  /// BCC: fields.
  ///
  /// [message]: The message to be sent.
  ///
  /// [replyToAddresses]: The reply-to email address(es) for the message. If the
  /// recipient replies to the message, each reply-to address will receive the
  /// reply.
  ///
  /// [returnPath]: The email address that bounces and complaints will be
  /// forwarded to when feedback forwarding is enabled. If the message cannot be
  /// delivered to the recipient, then an error message will be returned from
  /// the recipient's ISP; this message will then be forwarded to the email
  /// address specified by the `ReturnPath` parameter. The `ReturnPath`
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
  ///
  /// [sourceArn]: This parameter is used only for sending authorization. It is
  /// the ARN of the identity that is associated with the sending authorization
  /// policy that permits you to send for the email address specified in the
  /// `Source` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to send from `user@example.com`, then you
  /// would specify the `SourceArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `Source` to be `user@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [returnPathArn]: This parameter is used only for sending authorization. It
  /// is the ARN of the identity that is associated with the sending
  /// authorization policy that permits you to use the email address specified
  /// in the `ReturnPath` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to use `feedback@example.com`, then you
  /// would specify the `ReturnPathArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `ReturnPath` to be `feedback@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [tags]: A list of tags, in the form of name/value pairs, to apply to an
  /// email that you send using `SendEmail`. Tags correspond to characteristics
  /// of the email that you define, so that you can publish email sending
  /// events.
  ///
  /// [configurationSetName]: The name of the configuration set to use when you
  /// send an email using `SendEmail`.
  Future<SendEmailResponse> sendEmail(
      {@required String source,
      @required Destination destination,
      @required Message message,
      List<String> replyToAddresses,
      String returnPath,
      String sourceArn,
      String returnPathArn,
      List<MessageTag> tags,
      String configurationSetName}) async {
    return SendEmailResponse.fromJson({});
  }

  /// Composes an email message and immediately queues it for sending.
  ///
  /// This operation is more flexible than the `SendEmail` API operation. When
  /// you use the `SendRawEmail` operation, you can specify the headers of the
  /// message as well as its content. This flexibility is useful, for example,
  /// when you want to send a multipart MIME email (such a message that contains
  /// both a text and an HTML version). You can also use this operation to send
  /// messages that include attachments.
  ///
  /// The `SendRawEmail` operation has the following requirements:
  ///
  /// *   You can only send email from [verified email addresses or
  /// domains](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html).
  /// If you try to send email from an address that isn't verified, the
  /// operation results in an "Email address not verified" error.
  ///
  /// *   If your account is still in the [Amazon SES
  /// sandbox](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html),
  /// you can only send email to other verified addresses in your account, or to
  /// addresses that are associated with the [Amazon SES mailbox
  /// simulator](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mailbox-simulator.html).
  ///
  /// *   The maximum message size, including attachments, is 10 MB.
  ///
  /// *   Each message has to include at least one recipient address. A
  /// recipient address includes any address on the To:, CC:, or BCC: lines.
  ///
  /// *   If you send a single message to more than one recipient address, and
  /// one of the recipient addresses isn't in a valid format (that is, it's not
  /// in the format _UserName@\[SubDomain.\]Domain.TopLevelDomain_), Amazon SES
  /// rejects the entire message, even if the other addresses are valid.
  ///
  /// *   Each message can include up to 50 recipient addresses across the To:,
  /// CC:, or BCC: lines. If you need to send a single message to more than 50
  /// recipients, you have to split the list of recipient addresses into groups
  /// of less than 50 recipients, and send separate messages to each group.
  ///
  /// *   Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for
  /// MIME message parts. However, if Amazon SES has to modify the contents of
  /// your message (for example, if you use open and click tracking), 8-bit
  /// content isn't preserved. For this reason, we highly recommend that you
  /// encode all content that isn't 7-bit ASCII. For more information, see [MIME
  /// Encoding](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html#send-email-mime-encoding)
  /// in the _Amazon SES Developer Guide_.
  ///
  ///
  /// Additionally, keep the following considerations in mind when using the
  /// `SendRawEmail` operation:
  ///
  /// *   Although you can customize the message headers when using the
  /// `SendRawEmail` operation, Amazon SES will automatically apply its own
  /// `Message-ID` and `Date` headers; if you passed these headers when creating
  /// the message, they will be overwritten by the values that Amazon SES
  /// provides.
  ///
  /// *   If you are using sending authorization to send on behalf of another
  /// user, `SendRawEmail` enables you to specify the cross-account identity for
  /// the email's Source, From, and Return-Path parameters in one of two ways:
  /// you can pass optional parameters `SourceArn`, `FromArn`, and/or
  /// `ReturnPathArn` to the API, or you can include the following X-headers in
  /// the header of your raw email:
  ///
  ///     *    `X-SES-SOURCE-ARN`
  ///
  ///     *    `X-SES-FROM-ARN`
  ///
  ///     *    `X-SES-RETURN-PATH-ARN`
  ///
  ///
  ///      Don't include these X-headers in the DKIM signature. Amazon SES
  /// removes these before it sends the email.
  ///
  ///     If you only specify the `SourceIdentityArn` parameter, Amazon SES sets
  /// the From and Return-Path addresses to the same identity that you
  /// specified.
  ///
  ///     For more information about sending authorization, see the [Using
  /// Sending Authorization with Amazon
  /// SES](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// *   For every message that you send, the total number of recipients
  /// (including each recipient in the To:, CC: and BCC: fields) is counted
  /// against the maximum number of emails you can send in a 24-hour period
  /// (your _sending quota_). For more information about sending quotas in
  /// Amazon SES, see [Managing Your Amazon SES Sending
  /// Limits](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// [source]: The identity's email address. If you do not provide a value for
  /// this parameter, you must specify a "From" address in the raw text of the
  /// message. (You can also specify both.)
  ///
  ///  Amazon SES does not support the SMTPUTF8 extension, as described
  /// in[RFC6531](https://tools.ietf.org/html/rfc6531). For this reason, the
  /// _local part_ of a source email address (the part of the email address that
  /// precedes the @ sign) may only contain [7-bit ASCII
  /// characters](https://en.wikipedia.org/wiki/Email_address#Local-part). If
  /// the _domain part_ of an address (the part after the @ sign) contains
  /// non-ASCII characters, they must be encoded using Punycode, as described in
  /// [RFC3492](https://tools.ietf.org/html/rfc3492.html). The sender name (also
  /// known as the _friendly name_) may contain non-ASCII characters. These
  /// characters must be encoded using MIME encoded-word syntax, as described in
  /// [RFC 2047](https://tools.ietf.org/html/rfc2047). MIME encoded-word syntax
  /// uses the following form: `=?charset?encoding?encoded-text?=`.
  ///
  /// If you specify the `Source` parameter and have feedback forwarding
  /// enabled, then bounces and complaints will be sent to this email address.
  /// This takes precedence over any Return-Path header that you might include
  /// in the raw text of the message.
  ///
  /// [destinations]: A list of destinations for the message, consisting of To:,
  /// CC:, and BCC: addresses.
  ///
  /// [rawMessage]: The raw email message itself. The message has to meet the
  /// following criteria:
  ///
  /// *   The message has to contain a header and a body, separated by a blank
  /// line.
  ///
  /// *   All of the required header fields must be present in the message.
  ///
  /// *   Each part of a multipart MIME message must be formatted properly.
  ///
  /// *   Attachments must be of a content type that Amazon SES supports. For a
  /// list on unsupported content types, see [Unsupported Attachment
  /// Types](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// *   The entire message must be base64-encoded.
  ///
  /// *   If any of the MIME parts in your message contain content that is
  /// outside of the 7-bit ASCII character range, we highly recommend that you
  /// encode that content. For more information, see [Sending Raw
  /// Email](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// *   Per [RFC 5321](https://tools.ietf.org/html/rfc5321#section-4.5.3.1.6),
  /// the maximum length of each line of text, including the <CRLF>, must not
  /// exceed 1,000 characters.
  ///
  /// [fromArn]: This parameter is used only for sending authorization. It is
  /// the ARN of the identity that is associated with the sending authorization
  /// policy that permits you to specify a particular "From" address in the
  /// header of the raw email.
  ///
  /// Instead of using this parameter, you can use the X-header `X-SES-FROM-ARN`
  /// in the raw message of the email. If you use both the `FromArn` parameter
  /// and the corresponding X-header, Amazon SES uses the value of the `FromArn`
  /// parameter.
  ///
  ///
  ///
  /// For information about when to use this parameter, see the description of
  /// `SendRawEmail` in this guide, or see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html).
  ///
  /// [sourceArn]: This parameter is used only for sending authorization. It is
  /// the ARN of the identity that is associated with the sending authorization
  /// policy that permits you to send for the email address specified in the
  /// `Source` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to send from `user@example.com`, then you
  /// would specify the `SourceArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `Source` to be `user@example.com`.
  ///
  /// Instead of using this parameter, you can use the X-header
  /// `X-SES-SOURCE-ARN` in the raw message of the email. If you use both the
  /// `SourceArn` parameter and the corresponding X-header, Amazon SES uses the
  /// value of the `SourceArn` parameter.
  ///
  ///
  ///
  /// For information about when to use this parameter, see the description of
  /// `SendRawEmail` in this guide, or see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html).
  ///
  /// [returnPathArn]: This parameter is used only for sending authorization. It
  /// is the ARN of the identity that is associated with the sending
  /// authorization policy that permits you to use the email address specified
  /// in the `ReturnPath` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to use `feedback@example.com`, then you
  /// would specify the `ReturnPathArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `ReturnPath` to be `feedback@example.com`.
  ///
  /// Instead of using this parameter, you can use the X-header
  /// `X-SES-RETURN-PATH-ARN` in the raw message of the email. If you use both
  /// the `ReturnPathArn` parameter and the corresponding X-header, Amazon SES
  /// uses the value of the `ReturnPathArn` parameter.
  ///
  ///
  ///
  /// For information about when to use this parameter, see the description of
  /// `SendRawEmail` in this guide, or see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html).
  ///
  /// [tags]: A list of tags, in the form of name/value pairs, to apply to an
  /// email that you send using `SendRawEmail`. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// [configurationSetName]: The name of the configuration set to use when you
  /// send an email using `SendRawEmail`.
  Future<SendRawEmailResponse> sendRawEmail(RawMessage rawMessage,
      {String source,
      List<String> destinations,
      String fromArn,
      String sourceArn,
      String returnPathArn,
      List<MessageTag> tags,
      String configurationSetName}) async {
    return SendRawEmailResponse.fromJson({});
  }

  /// Composes an email message using an email template and immediately queues
  /// it for sending.
  ///
  /// In order to send email using the `SendTemplatedEmail` operation, your call
  /// to the API must meet the following requirements:
  ///
  /// *   The call must refer to an existing email template. You can create
  /// email templates using the CreateTemplate operation.
  ///
  /// *   The message must be sent from a verified email address or domain.
  ///
  /// *   If your account is still in the Amazon SES sandbox, you may only send
  /// to verified addresses or domains, or to email addresses associated with
  /// the Amazon SES Mailbox Simulator. For more information, see [Verifying
  /// Email Addresses and
  /// Domains](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// *   The maximum message size is 10 MB.
  ///
  /// *   Calls to the `SendTemplatedEmail` operation may only include one
  /// `Destination` parameter. A destination is a set of recipients who will
  /// receive the same version of the email. The `Destination` parameter can
  /// include up to 50 recipients, across the To:, CC: and BCC: fields.
  ///
  /// *   The `Destination` parameter must include at least one recipient email
  /// address. The recipient address can be a To: address, a CC: address, or a
  /// BCC: address. If a recipient email address is invalid (that is, it is not
  /// in the format _UserName@\[SubDomain.\]Domain.TopLevelDomain_), the entire
  /// message will be rejected, even if the message contains other recipients
  /// that are valid.
  ///
  ///
  ///
  ///
  /// If your call to the `SendTemplatedEmail` operation includes all of the
  /// required parameters, Amazon SES accepts it and returns a Message ID.
  /// However, if Amazon SES can't render the email because the template
  /// contains errors, it doesn't send the email. Additionally, because it
  /// already accepted the message, Amazon SES doesn't return a message stating
  /// that it was unable to send the email.
  ///
  /// For these reasons, we highly recommend that you set up Amazon SES to send
  /// you notifications when Rendering Failure events occur. For more
  /// information, see [Sending Personalized Email Using the Amazon SES
  /// API](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html)
  /// in the _Amazon Simple Email Service Developer Guide_.
  ///
  /// [source]: The email address that is sending the email. This email address
  /// must be either individually verified with Amazon SES, or from a domain
  /// that has been verified with Amazon SES. For information about verifying
  /// identities, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html).
  ///
  /// If you are sending on behalf of another user and have been permitted to do
  /// so by a sending authorization policy, then you must also specify the
  /// `SourceArn` parameter. For more information about sending authorization,
  /// see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  ///
  ///
  /// Amazon SES does not support the SMTPUTF8 extension, as described in
  /// [RFC6531](https://tools.ietf.org/html/rfc6531). For this reason, the
  /// _local part_ of a source email address (the part of the email address that
  /// precedes the @ sign) may only contain [7-bit ASCII
  /// characters](https://en.wikipedia.org/wiki/Email_address#Local-part). If
  /// the _domain part_ of an address (the part after the @ sign) contains
  /// non-ASCII characters, they must be encoded using Punycode, as described in
  /// [RFC3492](https://tools.ietf.org/html/rfc3492.html). The sender name (also
  /// known as the _friendly name_) may contain non-ASCII characters. These
  /// characters must be encoded using MIME encoded-word syntax, as described
  /// in[RFC 2047](https://tools.ietf.org/html/rfc2047). MIME encoded-word
  /// syntax uses the following form: `=?charset?encoding?encoded-text?=`.
  ///
  /// [destination]: The destination for this email, composed of To:, CC:, and
  /// BCC: fields. A Destination can include up to 50 recipients across these
  /// three fields.
  ///
  /// [replyToAddresses]: The reply-to email address(es) for the message. If the
  /// recipient replies to the message, each reply-to address will receive the
  /// reply.
  ///
  /// [returnPath]: The email address that bounces and complaints will be
  /// forwarded to when feedback forwarding is enabled. If the message cannot be
  /// delivered to the recipient, then an error message will be returned from
  /// the recipient's ISP; this message will then be forwarded to the email
  /// address specified by the `ReturnPath` parameter. The `ReturnPath`
  /// parameter is never overwritten. This email address must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
  ///
  /// [sourceArn]: This parameter is used only for sending authorization. It is
  /// the ARN of the identity that is associated with the sending authorization
  /// policy that permits you to send for the email address specified in the
  /// `Source` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to send from `user@example.com`, then you
  /// would specify the `SourceArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `Source` to be `user@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [returnPathArn]: This parameter is used only for sending authorization. It
  /// is the ARN of the identity that is associated with the sending
  /// authorization policy that permits you to use the email address specified
  /// in the `ReturnPath` parameter.
  ///
  /// For example, if the owner of `example.com` (which has ARN
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`) attaches a
  /// policy to it that authorizes you to use `feedback@example.com`, then you
  /// would specify the `ReturnPathArn` to be
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`, and the
  /// `ReturnPath` to be `feedback@example.com`.
  ///
  /// For more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  ///
  /// [tags]: A list of tags, in the form of name/value pairs, to apply to an
  /// email that you send using `SendTemplatedEmail`. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// [configurationSetName]: The name of the configuration set to use when you
  /// send an email using `SendTemplatedEmail`.
  ///
  /// [template]: The template to use when sending this email.
  ///
  /// [templateArn]: The ARN of the template to use when sending this email.
  ///
  /// [templateData]: A list of replacement values to apply to the template.
  /// This parameter is a JSON object, typically consisting of key-value pairs
  /// in which the keys correspond to replacement tags in the email template.
  Future<SendTemplatedEmailResponse> sendTemplatedEmail(
      {@required String source,
      @required Destination destination,
      List<String> replyToAddresses,
      String returnPath,
      String sourceArn,
      String returnPathArn,
      List<MessageTag> tags,
      String configurationSetName,
      @required String template,
      String templateArn,
      @required String templateData}) async {
    return SendTemplatedEmailResponse.fromJson({});
  }

  /// Sets the specified receipt rule set as the active receipt rule set.
  ///
  ///  To disable your email-receiving through Amazon SES completely, you can
  /// call this API with RuleSetName set to null.
  ///
  /// For information about managing receipt rule sets, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set to make active. Setting
  /// this value to null disables all email receiving.
  Future<SetActiveReceiptRuleSetResponse> setActiveReceiptRuleSet(
      {String ruleSetName}) async {
    return SetActiveReceiptRuleSetResponse.fromJson({});
  }

  /// Enables or disables Easy DKIM signing of email sent from an identity. If
  /// Easy DKIM signing is enabled for a domain, then Amazon SES uses DKIM to
  /// sign all email that it sends from addresses on that domain. If Easy DKIM
  /// signing is enabled for an email address, then Amazon SES uses DKIM to sign
  /// all email it sends from that address.
  ///
  ///  For email addresses (for example, `user@example.com`), you can only
  /// enable DKIM signing if the corresponding domain (in this case,
  /// `example.com`) has been set up to use Easy DKIM.
  ///
  /// You can enable DKIM signing for an identity at any time after you start
  /// the verification process for the identity, even if the verification
  /// process isn't complete.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about Easy DKIM signing, go to the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html).
  ///
  /// [identity]: The identity for which DKIM signing should be enabled or
  /// disabled.
  ///
  /// [dkimEnabled]: Sets whether DKIM signing is enabled for an identity. Set
  /// to `true` to enable DKIM signing for this identity; `false` to disable it.
  Future<SetIdentityDkimEnabledResponse> setIdentityDkimEnabled(
      {@required String identity, @required bool dkimEnabled}) async {
    return SetIdentityDkimEnabledResponse.fromJson({});
  }

  /// Given an identity (an email address or a domain), enables or disables
  /// whether Amazon SES forwards bounce and complaint notifications as email.
  /// Feedback forwarding can only be disabled when Amazon Simple Notification
  /// Service (Amazon SNS) topics are specified for both bounces and complaints.
  ///
  ///  Feedback forwarding does not apply to delivery notifications. Delivery
  /// notifications are only available through Amazon SNS.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about using notifications with Amazon SES, see the
  /// [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html).
  ///
  /// [identity]: The identity for which to set bounce and complaint
  /// notification forwarding. Examples: `user@example.com`, `example.com`.
  ///
  /// [forwardingEnabled]: Sets whether Amazon SES will forward bounce and
  /// complaint notifications as email. `true` specifies that Amazon SES will
  /// forward bounce and complaint notifications as email, in addition to any
  /// Amazon SNS topic publishing otherwise specified. `false` specifies that
  /// Amazon SES will publish bounce and complaint notifications only through
  /// Amazon SNS. This value can only be set to `false` when Amazon SNS topics
  /// are set for both `Bounce` and `Complaint` notification types.
  Future<SetIdentityFeedbackForwardingEnabledResponse>
      setIdentityFeedbackForwardingEnabled(
          {@required String identity, @required bool forwardingEnabled}) async {
    return SetIdentityFeedbackForwardingEnabledResponse.fromJson({});
  }

  /// Given an identity (an email address or a domain), sets whether Amazon SES
  /// includes the original email headers in the Amazon Simple Notification
  /// Service (Amazon SNS) notifications of a specified type.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about using notifications with Amazon SES, see the
  /// [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html).
  ///
  /// [identity]: The identity for which to enable or disable headers in
  /// notifications. Examples: `user@example.com`, `example.com`.
  ///
  /// [notificationType]: The notification type for which to enable or disable
  /// headers in notifications.
  ///
  /// [enabled]: Sets whether Amazon SES includes the original email headers in
  /// Amazon SNS notifications of the specified notification type. A value of
  /// `true` specifies that Amazon SES will include headers in notifications,
  /// and a value of `false` specifies that Amazon SES will not include headers
  /// in notifications.
  ///
  /// This value can only be set when `NotificationType` is already set to use a
  /// particular Amazon SNS topic.
  Future<SetIdentityHeadersInNotificationsEnabledResponse>
      setIdentityHeadersInNotificationsEnabled(
          {@required String identity,
          @required String notificationType,
          @required bool enabled}) async {
    return SetIdentityHeadersInNotificationsEnabledResponse.fromJson({});
  }

  /// Enables or disables the custom MAIL FROM domain setup for a verified
  /// identity (an email address or a domain).
  ///
  ///  To send emails using the specified MAIL FROM domain, you must add an MX
  /// record to your MAIL FROM domain's DNS settings. If you want your emails to
  /// pass Sender Policy Framework (SPF) checks, you must also add or update an
  /// SPF record. For more information, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html).
  ///
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [identity]: The verified identity for which you want to enable or disable
  /// the specified custom MAIL FROM domain.
  ///
  /// [mailFromDomain]: The custom MAIL FROM domain that you want the verified
  /// identity to use. The MAIL FROM domain must 1) be a subdomain of the
  /// verified identity, 2) not be used in a "From" address if the MAIL FROM
  /// domain is the destination of email feedback forwarding (for more
  /// information, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from.html)),
  /// and 3) not be used to receive emails. A value of `null` disables the
  /// custom MAIL FROM setting for the identity.
  ///
  /// [behaviorOnMXFailure]: The action that you want Amazon SES to take if it
  /// cannot successfully read the required MX record when you send an email. If
  /// you choose `UseDefaultValue`, Amazon SES will use amazonses.com (or a
  /// subdomain of that) as the MAIL FROM domain. If you choose `RejectMessage`,
  /// Amazon SES will return a `MailFromDomainNotVerified` error and not send
  /// the email.
  ///
  /// The action specified in `BehaviorOnMXFailure` is taken when the custom
  /// MAIL FROM domain setup is in the `Pending`, `Failed`, and
  /// `TemporaryFailure` states.
  Future<SetIdentityMailFromDomainResponse> setIdentityMailFromDomain(
      String identity,
      {String mailFromDomain,
      String behaviorOnMXFailure}) async {
    return SetIdentityMailFromDomainResponse.fromJson({});
  }

  /// Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when
  /// delivering notifications. When you use this operation, you specify a
  /// verified identity, such as an email address or domain. When you send an
  /// email that uses the chosen identity in the Source field, Amazon SES sends
  /// notifications to the topic you specified. You can send bounce, complaint,
  /// or delivery notifications (or any combination of the three) to the Amazon
  /// SNS topic that you specify.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// For more information about feedback notification, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html).
  ///
  /// [identity]: The identity (email address or domain) that you want to set
  /// the Amazon SNS topic for.
  ///
  ///  You can only specify a verified identity for this parameter.
  ///
  /// You can specify an identity by using its name or by using its Amazon
  /// Resource Name (ARN). The following examples are all valid identities:
  /// `sender@example.com`, `example.com`,
  /// `arn:aws:ses:us-east-1:123456789012:identity/example.com`.
  ///
  /// [notificationType]: The type of notifications that will be published to
  /// the specified Amazon SNS topic.
  ///
  /// [snsTopic]: The Amazon Resource Name (ARN) of the Amazon SNS topic. If the
  /// parameter is omitted from the request or a null value is passed,
  /// `SnsTopic` is cleared and publishing is disabled.
  Future<SetIdentityNotificationTopicResponse> setIdentityNotificationTopic(
      {@required String identity,
      @required String notificationType,
      String snsTopic}) async {
    return SetIdentityNotificationTopicResponse.fromJson({});
  }

  /// Sets the position of the specified receipt rule in the receipt rule set.
  ///
  /// For information about managing receipt rules, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set that contains the receipt
  /// rule to reposition.
  ///
  /// [ruleName]: The name of the receipt rule to reposition.
  ///
  /// [after]: The name of the receipt rule after which to place the specified
  /// receipt rule.
  Future<SetReceiptRulePositionResponse> setReceiptRulePosition(
      {@required String ruleSetName,
      @required String ruleName,
      String after}) async {
    return SetReceiptRulePositionResponse.fromJson({});
  }

  /// Creates a preview of the MIME content of an email when provided with a
  /// template and a set of replacement data.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the template that you want to render.
  ///
  /// [templateData]: A list of replacement values to apply to the template.
  /// This parameter is a JSON object, typically consisting of key-value pairs
  /// in which the keys correspond to replacement tags in the email template.
  Future<TestRenderTemplateResponse> testRenderTemplate(
      {@required String templateName, @required String templateData}) async {
    return TestRenderTemplateResponse.fromJson({});
  }

  /// Enables or disables email sending across your entire Amazon SES account in
  /// the current AWS Region. You can use this operation in conjunction with
  /// Amazon CloudWatch alarms to temporarily pause email sending across your
  /// Amazon SES account in a given AWS Region when reputation metrics (such as
  /// your bounce or complaint rates) reach certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [enabled]: Describes whether email sending is enabled or disabled for your
  /// Amazon SES account in the current AWS Region.
  Future<void> updateAccountSendingEnabled({bool enabled}) async {}

  /// Updates the event destination of a configuration set. Event destinations
  /// are associated with configuration sets, which enable you to publish email
  /// sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon
  /// Simple Notification Service (Amazon SNS). For information about using
  /// configuration sets, see [Monitoring Your Amazon SES Sending
  /// Activity](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html)
  /// in the _Amazon SES Developer Guide._
  ///
  ///  When you create or update an event destination, you must provide one, and
  /// only one, destination. The destination can be Amazon CloudWatch, Amazon
  /// Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set that contains
  /// the event destination that you want to update.
  ///
  /// [eventDestination]: The event destination object that you want to apply to
  /// the specified configuration set.
  Future<UpdateConfigurationSetEventDestinationResponse>
      updateConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required EventDestination eventDestination}) async {
    return UpdateConfigurationSetEventDestinationResponse.fromJson({});
  }

  /// Enables or disables the publishing of reputation metrics for emails sent
  /// using a specific configuration set in a given AWS Region. Reputation
  /// metrics include bounce and complaint rates. These metrics are published to
  /// Amazon CloudWatch. By using CloudWatch, you can create alarms when bounce
  /// or complaint rates exceed certain thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// update.
  ///
  /// [enabled]: Describes whether or not Amazon SES will publish reputation
  /// metrics for the configuration set, such as bounce and complaint rates, to
  /// Amazon CloudWatch.
  Future<void> updateConfigurationSetReputationMetricsEnabled(
      {@required String configurationSetName, @required bool enabled}) async {}

  /// Enables or disables email sending for messages sent using a specific
  /// configuration set in a given AWS Region. You can use this operation in
  /// conjunction with Amazon CloudWatch alarms to temporarily pause email
  /// sending for a configuration set when the reputation metrics for that
  /// configuration set (such as your bounce on complaint rate) exceed certain
  /// thresholds.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// update.
  ///
  /// [enabled]: Describes whether email sending is enabled or disabled for the
  /// configuration set.
  Future<void> updateConfigurationSetSendingEnabled(
      {@required String configurationSetName, @required bool enabled}) async {}

  /// Modifies an association between a configuration set and a custom domain
  /// for open and click event tracking.
  ///
  /// By default, images and links used for tracking open and click events are
  /// hosted on domains operated by Amazon SES. You can configure a subdomain of
  /// your own to handle these events. For information about using custom
  /// domains, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html).
  ///
  /// [configurationSetName]: The name of the configuration set for which you
  /// want to update the custom tracking domain.
  Future<UpdateConfigurationSetTrackingOptionsResponse>
      updateConfigurationSetTrackingOptions(
          {@required String configurationSetName,
          @required TrackingOptions trackingOptions}) async {
    return UpdateConfigurationSetTrackingOptionsResponse.fromJson({});
  }

  /// Updates an existing custom verification email template.
  ///
  /// For more information about custom verification email templates, see [Using
  /// Custom Verification Email
  /// Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [templateName]: The name of the custom verification email template that
  /// you want to update.
  ///
  /// [fromEmailAddress]: The email address that the custom verification email
  /// is sent from.
  ///
  /// [templateSubject]: The subject line of the custom verification email.
  ///
  /// [templateContent]: The content of the custom verification email. The total
  /// size of the email must be less than 10 MB. The message body may contain
  /// HTML, with some limitations. For more information, see [Custom
  /// Verification Email Frequently Asked
  /// Questions](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq)
  /// in the _Amazon SES Developer Guide_.
  ///
  /// [successRedirectionUrl]: The URL that the recipient of the verification
  /// email is sent to if his or her address is successfully verified.
  ///
  /// [failureRedirectionUrl]: The URL that the recipient of the verification
  /// email is sent to if his or her address is not successfully verified.
  Future<void> updateCustomVerificationEmailTemplate(String templateName,
      {String fromEmailAddress,
      String templateSubject,
      String templateContent,
      String successRedirectionUrl,
      String failureRedirectionUrl}) async {}

  /// Updates a receipt rule.
  ///
  /// For information about managing receipt rules, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html).
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [ruleSetName]: The name of the receipt rule set that the receipt rule
  /// belongs to.
  ///
  /// [rule]: A data structure that contains the updated receipt rule
  /// information.
  Future<UpdateReceiptRuleResponse> updateReceiptRule(
      {@required String ruleSetName, @required ReceiptRule rule}) async {
    return UpdateReceiptRuleResponse.fromJson({});
  }

  /// Updates an email template. Email templates enable you to send personalized
  /// email to one or more destinations in a single API operation. For more
  /// information, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html).
  ///
  /// You can execute this operation no more than once per second.
  Future<UpdateTemplateResponse> updateTemplate(Template template) async {
    return UpdateTemplateResponse.fromJson({});
  }

  /// Returns a set of DKIM tokens for a domain identity.
  ///
  ///  When you execute the `VerifyDomainDkim` operation, the domain that you
  /// specify is added to the list of identities that are associated with your
  /// account. This is true even if you haven't already associated the domain
  /// with your account by using the `VerifyDomainIdentity` operation. However,
  /// you can't send email from the domain until you either successfully [verify
  /// it](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-domains.html)
  /// or you successfully [set up DKIM for
  /// it](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html).
  ///
  ///
  /// You use the tokens that are generated by this operation to create CNAME
  /// records. When Amazon SES detects that you've added these records to the
  /// DNS configuration for a domain, you can start sending email from that
  /// domain. You can start sending email even if you haven't added the TXT
  /// record provided by the VerifyDomainIdentity operation to the DNS
  /// configuration for your domain. All email that you send from the domain is
  /// authenticated using DKIM.
  ///
  /// To create the CNAME records for DKIM authentication, use the following
  /// values:
  ///
  /// *    **Name**: _token_._domainkey._example.com_
  ///
  /// *    **Type**: CNAME
  ///
  /// *    **Value**: _token_.dkim.amazonses.com
  ///
  ///
  /// In the preceding example, replace _token_ with one of the tokens that are
  /// generated when you execute this operation. Replace _example.com_ with your
  /// domain. Repeat this process for each token that's generated by this
  /// operation.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [domain]: The name of the domain to be verified for Easy DKIM signing.
  Future<VerifyDomainDkimResponse> verifyDomainDkim(String domain) async {
    return VerifyDomainDkimResponse.fromJson({});
  }

  /// Adds a domain to the list of identities for your Amazon SES account in the
  /// current AWS Region and attempts to verify it. For more information about
  /// verifying domains, see [Verifying Email Addresses and
  /// Domains](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html)
  /// in the _Amazon SES Developer Guide._
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [domain]: The domain to be verified.
  Future<VerifyDomainIdentityResponse> verifyDomainIdentity(
      String domain) async {
    return VerifyDomainIdentityResponse.fromJson({});
  }

  /// Deprecated. Use the `VerifyEmailIdentity` operation to verify a new email
  /// address.
  ///
  /// [emailAddress]: The email address to be verified.
  Future<void> verifyEmailAddress(String emailAddress) async {}

  /// Adds an email address to the list of identities for your Amazon SES
  /// account in the current AWS region and attempts to verify it. As a result
  /// of executing this operation, a verification email is sent to the specified
  /// address.
  ///
  /// You can execute this operation no more than once per second.
  ///
  /// [emailAddress]: The email address to be verified.
  Future<VerifyEmailIdentityResponse> verifyEmailIdentity(
      String emailAddress) async {
    return VerifyEmailIdentityResponse.fromJson({});
  }
}

class AddHeaderAction {
  /// The name of the header to add. Must be between 1 and 50 characters,
  /// inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and
  /// dashes only.
  final String headerName;

  /// Must be less than 2048 characters, and must not contain newline characters
  /// ("\\r" or "\\n").
  final String headerValue;

  AddHeaderAction({
    @required this.headerName,
    @required this.headerValue,
  });
  static AddHeaderAction fromJson(Map<String, dynamic> json) =>
      AddHeaderAction();
}

class Body {
  /// The content of the message, in text format. Use this for text-based email
  /// clients, or clients on high-latency networks (such as mobile devices).
  final Content text;

  /// The content of the message, in HTML format. Use this for email clients
  /// that can process HTML. You can include clickable links, formatted text,
  /// and much more in an HTML message.
  final Content html;

  Body({
    this.text,
    this.html,
  });
}

class BounceAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// bounce action is taken. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  /// The SMTP reply code, as defined by [RFC
  /// 5321](https://tools.ietf.org/html/rfc5321).
  final String smtpReplyCode;

  /// The SMTP enhanced status code, as defined by [RFC
  /// 3463](https://tools.ietf.org/html/rfc3463).
  final String statusCode;

  /// Human-readable text to include in the bounce message.
  final String message;

  /// The email address of the sender of the bounced email. This is the address
  /// from which the bounce message will be sent.
  final String sender;

  BounceAction({
    this.topicArn,
    @required this.smtpReplyCode,
    this.statusCode,
    @required this.message,
    @required this.sender,
  });
  static BounceAction fromJson(Map<String, dynamic> json) => BounceAction();
}

class BouncedRecipientInfo {
  /// The email address of the recipient of the bounced email.
  final String recipient;

  /// This parameter is used only for sending authorization. It is the ARN of
  /// the identity that is associated with the sending authorization policy that
  /// permits you to receive email for the recipient of the bounced email. For
  /// more information about sending authorization, see the [Amazon SES
  /// Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  final String recipientArn;

  /// The reason for the bounce. You must provide either this parameter or
  /// `RecipientDsnFields`.
  final String bounceType;

  /// Recipient-related DSN fields, most of which would normally be filled in
  /// automatically when provided with a `BounceType`. You must provide either
  /// this parameter or `BounceType`.
  final RecipientDsnFields recipientDsnFields;

  BouncedRecipientInfo({
    @required this.recipient,
    this.recipientArn,
    this.bounceType,
    this.recipientDsnFields,
  });
}

class BulkEmailDestination {
  final Destination destination;

  /// A list of tags, in the form of name/value pairs, to apply to an email that
  /// you send using `SendBulkTemplatedEmail`. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  final List<MessageTag> replacementTags;

  /// A list of replacement values to apply to the template. This parameter is a
  /// JSON object, typically consisting of key-value pairs in which the keys
  /// correspond to replacement tags in the email template.
  final String replacementTemplateData;

  BulkEmailDestination({
    @required this.destination,
    this.replacementTags,
    this.replacementTemplateData,
  });
}

class BulkEmailDestinationStatus {
  /// The status of a message sent using the `SendBulkTemplatedEmail` operation.
  ///
  /// Possible values for this parameter include:
  ///
  /// *    `Success`: Amazon SES accepted the message, and will attempt to
  /// deliver it to the recipients.
  ///
  /// *    `MessageRejected`: The message was rejected because it contained a
  /// virus.
  ///
  /// *    `MailFromDomainNotVerified`: The sender's email address or domain was
  /// not verified.
  ///
  /// *    `ConfigurationSetDoesNotExist`: The configuration set you specified
  /// does not exist.
  ///
  /// *    `TemplateDoesNotExist`: The template you specified does not exist.
  ///
  /// *    `AccountSuspended`: Your account has been shut down because of issues
  /// related to your email sending practices.
  ///
  /// *    `AccountThrottled`: The number of emails you can send has been
  /// reduced because your account has exceeded its allocated sending limit.
  ///
  /// *    `AccountDailyQuotaExceeded`: You have reached or exceeded the maximum
  /// number of emails you can send from your account in a 24-hour period.
  ///
  /// *    `InvalidSendingPoolName`: The configuration set you specified refers
  /// to an IP pool that does not exist.
  ///
  /// *    `AccountSendingPaused`: Email sending for the Amazon SES account was
  /// disabled using the UpdateAccountSendingEnabled operation.
  ///
  /// *    `ConfigurationSetSendingPaused`: Email sending for this configuration
  /// set was disabled using the UpdateConfigurationSetSendingEnabled operation.
  ///
  /// *    `InvalidParameterValue`: One or more of the parameters you specified
  /// when calling this operation was invalid. See the error message for
  /// additional information.
  ///
  /// *    `TransientFailure`: Amazon SES was unable to process your request
  /// because of a temporary issue.
  ///
  /// *    `Failed`: Amazon SES was unable to process your request. See the
  /// error message for additional information.
  final String status;

  /// A description of an error that prevented a message being sent using the
  /// `SendBulkTemplatedEmail` operation.
  final String error;

  /// The unique message identifier returned from the `SendBulkTemplatedEmail`
  /// operation.
  final String messageId;

  BulkEmailDestinationStatus({
    this.status,
    this.error,
    this.messageId,
  });
  static BulkEmailDestinationStatus fromJson(Map<String, dynamic> json) =>
      BulkEmailDestinationStatus();
}

class CloneReceiptRuleSetResponse {
  CloneReceiptRuleSetResponse();
  static CloneReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      CloneReceiptRuleSetResponse();
}

class CloudWatchDestination {
  /// A list of dimensions upon which to categorize your emails when you publish
  /// email sending events to Amazon CloudWatch.
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    @required this.dimensionConfigurations,
  });
  static CloudWatchDestination fromJson(Map<String, dynamic> json) =>
      CloudWatchDestination();
}

class CloudWatchDimensionConfiguration {
  /// The name of an Amazon CloudWatch dimension associated with an email
  /// sending metric. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Contain less than 256 characters.
  final String dimensionName;

  /// The place where Amazon SES finds the value of a dimension to publish to
  /// Amazon CloudWatch. If you want Amazon SES to use the message tags that you
  /// specify using an `X-SES-MESSAGE-TAGS` header or a parameter to the
  /// `SendEmail`/`SendRawEmail` API, choose `messageTag`. If you want Amazon
  /// SES to use your own email headers, choose `emailHeader`.
  final String dimensionValueSource;

  /// The default value of the dimension that is published to Amazon CloudWatch
  /// if you do not provide the value of the dimension when you send an email.
  /// The default value must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Contain less than 256 characters.
  final String defaultDimensionValue;

  CloudWatchDimensionConfiguration({
    @required this.dimensionName,
    @required this.dimensionValueSource,
    @required this.defaultDimensionValue,
  });
  static CloudWatchDimensionConfiguration fromJson(Map<String, dynamic> json) =>
      CloudWatchDimensionConfiguration();
}

class ConfigurationSet {
  /// The name of the configuration set. The name must meet the following
  /// requirements:
  ///
  /// *   Contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or
  /// dashes (-).
  ///
  /// *   Contain 64 characters or fewer.
  final String name;

  ConfigurationSet({
    @required this.name,
  });
  static ConfigurationSet fromJson(Map<String, dynamic> json) =>
      ConfigurationSet();
}

class Content {
  /// The textual data of the content.
  final String data;

  /// The character set of the content.
  final String charset;

  Content({
    @required this.data,
    this.charset,
  });
}

class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  static CreateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConfigurationSetEventDestinationResponse();
}

class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  static CreateConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      CreateConfigurationSetResponse();
}

class CreateConfigurationSetTrackingOptionsResponse {
  CreateConfigurationSetTrackingOptionsResponse();
  static CreateConfigurationSetTrackingOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConfigurationSetTrackingOptionsResponse();
}

class CreateReceiptFilterResponse {
  CreateReceiptFilterResponse();
  static CreateReceiptFilterResponse fromJson(Map<String, dynamic> json) =>
      CreateReceiptFilterResponse();
}

class CreateReceiptRuleResponse {
  CreateReceiptRuleResponse();
  static CreateReceiptRuleResponse fromJson(Map<String, dynamic> json) =>
      CreateReceiptRuleResponse();
}

class CreateReceiptRuleSetResponse {
  CreateReceiptRuleSetResponse();
  static CreateReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      CreateReceiptRuleSetResponse();
}

class CreateTemplateResponse {
  CreateTemplateResponse();
  static CreateTemplateResponse fromJson(Map<String, dynamic> json) =>
      CreateTemplateResponse();
}

class CustomVerificationEmailTemplate {
  /// The name of the custom verification email template.
  final String templateName;

  /// The email address that the custom verification email is sent from.
  final String fromEmailAddress;

  /// The subject line of the custom verification email.
  final String templateSubject;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String successRedirectionUrl;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String failureRedirectionUrl;

  CustomVerificationEmailTemplate({
    this.templateName,
    this.fromEmailAddress,
    this.templateSubject,
    this.successRedirectionUrl,
    this.failureRedirectionUrl,
  });
  static CustomVerificationEmailTemplate fromJson(Map<String, dynamic> json) =>
      CustomVerificationEmailTemplate();
}

class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  static DeleteConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteConfigurationSetEventDestinationResponse();
}

class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  static DeleteConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteConfigurationSetResponse();
}

class DeleteConfigurationSetTrackingOptionsResponse {
  DeleteConfigurationSetTrackingOptionsResponse();
  static DeleteConfigurationSetTrackingOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteConfigurationSetTrackingOptionsResponse();
}

class DeleteIdentityPolicyResponse {
  DeleteIdentityPolicyResponse();
  static DeleteIdentityPolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteIdentityPolicyResponse();
}

class DeleteIdentityResponse {
  DeleteIdentityResponse();
  static DeleteIdentityResponse fromJson(Map<String, dynamic> json) =>
      DeleteIdentityResponse();
}

class DeleteReceiptFilterResponse {
  DeleteReceiptFilterResponse();
  static DeleteReceiptFilterResponse fromJson(Map<String, dynamic> json) =>
      DeleteReceiptFilterResponse();
}

class DeleteReceiptRuleResponse {
  DeleteReceiptRuleResponse();
  static DeleteReceiptRuleResponse fromJson(Map<String, dynamic> json) =>
      DeleteReceiptRuleResponse();
}

class DeleteReceiptRuleSetResponse {
  DeleteReceiptRuleSetResponse();
  static DeleteReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteReceiptRuleSetResponse();
}

class DeleteTemplateResponse {
  DeleteTemplateResponse();
  static DeleteTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeleteTemplateResponse();
}

class DeliveryOptions {
  /// Specifies whether messages that use the configuration set are required to
  /// use Transport Layer Security (TLS). If the value is `Require`, messages
  /// are only delivered if a TLS connection can be established. If the value is
  /// `Optional`, messages can be delivered in plain text if a TLS connection
  /// can't be established.
  final String tlsPolicy;

  DeliveryOptions({
    this.tlsPolicy,
  });
  static DeliveryOptions fromJson(Map<String, dynamic> json) =>
      DeliveryOptions();
}

class DescribeActiveReceiptRuleSetResponse {
  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and a timestamp of when the rule set was
  /// created.
  final ReceiptRuleSetMetadata metadata;

  /// The receipt rules that belong to the active rule set.
  final List<ReceiptRule> rules;

  DescribeActiveReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  static DescribeActiveReceiptRuleSetResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeActiveReceiptRuleSetResponse();
}

class DescribeConfigurationSetResponse {
  /// The configuration set object associated with the specified configuration
  /// set.
  final ConfigurationSet configurationSet;

  /// A list of event destinations associated with the configuration set.
  final List<EventDestination> eventDestinations;

  /// The name of the custom open and click tracking domain associated with the
  /// configuration set.
  final TrackingOptions trackingOptions;

  final DeliveryOptions deliveryOptions;

  /// An object that represents the reputation settings for the configuration
  /// set.
  final ReputationOptions reputationOptions;

  DescribeConfigurationSetResponse({
    this.configurationSet,
    this.eventDestinations,
    this.trackingOptions,
    this.deliveryOptions,
    this.reputationOptions,
  });
  static DescribeConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      DescribeConfigurationSetResponse();
}

class DescribeReceiptRuleResponse {
  /// A data structure that contains the specified receipt rule's name, actions,
  /// recipients, domains, enabled status, scan status, and Transport Layer
  /// Security (TLS) policy.
  final ReceiptRule rule;

  DescribeReceiptRuleResponse({
    this.rule,
  });
  static DescribeReceiptRuleResponse fromJson(Map<String, dynamic> json) =>
      DescribeReceiptRuleResponse();
}

class DescribeReceiptRuleSetResponse {
  /// The metadata for the receipt rule set, which consists of the rule set name
  /// and the timestamp of when the rule set was created.
  final ReceiptRuleSetMetadata metadata;

  /// A list of the receipt rules that belong to the specified receipt rule set.
  final List<ReceiptRule> rules;

  DescribeReceiptRuleSetResponse({
    this.metadata,
    this.rules,
  });
  static DescribeReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      DescribeReceiptRuleSetResponse();
}

class Destination {
  /// The recipients to place on the To: line of the message.
  final List<String> toAddresses;

  /// The recipients to place on the CC: line of the message.
  final List<String> ccAddresses;

  /// The recipients to place on the BCC: line of the message.
  final List<String> bccAddresses;

  Destination({
    this.toAddresses,
    this.ccAddresses,
    this.bccAddresses,
  });
}

class EventDestination {
  /// The name of the event destination. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Contain less than 64 characters.
  final String name;

  /// Sets whether Amazon SES publishes events to this destination when you send
  /// an email with the associated configuration set. Set to `true` to enable
  /// publishing to this destination; set to `false` to prevent publishing to
  /// this destination. The default value is `false`.
  final bool enabled;

  /// The type of email sending events to publish to the event destination.
  final List<String> matchingEventTypes;

  /// An object that contains the delivery stream ARN and the IAM role ARN
  /// associated with an Amazon Kinesis Firehose event destination.
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An object that contains the names, default values, and sources of the
  /// dimensions associated with an Amazon CloudWatch event destination.
  final CloudWatchDestination cloudWatchDestination;

  /// An object that contains the topic ARN associated with an Amazon Simple
  /// Notification Service (Amazon SNS) event destination.
  final SnsDestination snsDestination;

  EventDestination({
    @required this.name,
    this.enabled,
    @required this.matchingEventTypes,
    this.kinesisFirehoseDestination,
    this.cloudWatchDestination,
    this.snsDestination,
  });
  static EventDestination fromJson(Map<String, dynamic> json) =>
      EventDestination();
}

class ExtensionField {
  /// The name of the header to add. Must be between 1 and 50 characters,
  /// inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and
  /// dashes only.
  final String name;

  /// The value of the header to add. Must be less than 2048 characters, and
  /// must not contain newline characters ("\\r" or "\\n").
  final String value;

  ExtensionField({
    @required this.name,
    @required this.value,
  });
}

class GetAccountSendingEnabledResponse {
  /// Describes whether email sending is enabled or disabled for your Amazon SES
  /// account in the current AWS Region.
  final bool enabled;

  GetAccountSendingEnabledResponse({
    this.enabled,
  });
  static GetAccountSendingEnabledResponse fromJson(Map<String, dynamic> json) =>
      GetAccountSendingEnabledResponse();
}

class GetCustomVerificationEmailTemplateResponse {
  /// The name of the custom verification email template.
  final String templateName;

  /// The email address that the custom verification email is sent from.
  final String fromEmailAddress;

  /// The subject line of the custom verification email.
  final String templateSubject;

  /// The content of the custom verification email.
  final String templateContent;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is successfully verified.
  final String successRedirectionUrl;

  /// The URL that the recipient of the verification email is sent to if his or
  /// her address is not successfully verified.
  final String failureRedirectionUrl;

  GetCustomVerificationEmailTemplateResponse({
    this.templateName,
    this.fromEmailAddress,
    this.templateSubject,
    this.templateContent,
    this.successRedirectionUrl,
    this.failureRedirectionUrl,
  });
  static GetCustomVerificationEmailTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      GetCustomVerificationEmailTemplateResponse();
}

class GetIdentityDkimAttributesResponse {
  /// The DKIM attributes for an email address or a domain.
  final Map<String, IdentityDkimAttributes> dkimAttributes;

  GetIdentityDkimAttributesResponse({
    @required this.dkimAttributes,
  });
  static GetIdentityDkimAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityDkimAttributesResponse();
}

class GetIdentityMailFromDomainAttributesResponse {
  /// A map of identities to custom MAIL FROM attributes.
  final Map<String, IdentityMailFromDomainAttributes> mailFromDomainAttributes;

  GetIdentityMailFromDomainAttributesResponse({
    @required this.mailFromDomainAttributes,
  });
  static GetIdentityMailFromDomainAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityMailFromDomainAttributesResponse();
}

class GetIdentityNotificationAttributesResponse {
  /// A map of Identity to IdentityNotificationAttributes.
  final Map<String, IdentityNotificationAttributes> notificationAttributes;

  GetIdentityNotificationAttributesResponse({
    @required this.notificationAttributes,
  });
  static GetIdentityNotificationAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityNotificationAttributesResponse();
}

class GetIdentityPoliciesResponse {
  /// A map of policy names to policies.
  final Map<String, String> policies;

  GetIdentityPoliciesResponse({
    @required this.policies,
  });
  static GetIdentityPoliciesResponse fromJson(Map<String, dynamic> json) =>
      GetIdentityPoliciesResponse();
}

class GetIdentityVerificationAttributesResponse {
  /// A map of Identities to IdentityVerificationAttributes objects.
  final Map<String, IdentityVerificationAttributes> verificationAttributes;

  GetIdentityVerificationAttributesResponse({
    @required this.verificationAttributes,
  });
  static GetIdentityVerificationAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityVerificationAttributesResponse();
}

class GetSendQuotaResponse {
  /// The maximum number of emails the user is allowed to send in a 24-hour
  /// interval. A value of -1 signifies an unlimited quota.
  final double max24HourSend;

  /// The maximum number of emails that Amazon SES can accept from the user's
  /// account per second.
  ///
  ///
  ///
  /// The rate at which Amazon SES accepts the user's messages might be less
  /// than the maximum send rate.
  final double maxSendRate;

  /// The number of emails sent during the previous 24 hours.
  final double sentLast24Hours;

  GetSendQuotaResponse({
    this.max24HourSend,
    this.maxSendRate,
    this.sentLast24Hours,
  });
  static GetSendQuotaResponse fromJson(Map<String, dynamic> json) =>
      GetSendQuotaResponse();
}

class GetSendStatisticsResponse {
  /// A list of data points, each of which represents 15 minutes of activity.
  final List<SendDataPoint> sendDataPoints;

  GetSendStatisticsResponse({
    this.sendDataPoints,
  });
  static GetSendStatisticsResponse fromJson(Map<String, dynamic> json) =>
      GetSendStatisticsResponse();
}

class GetTemplateResponse {
  final Template template;

  GetTemplateResponse({
    this.template,
  });
  static GetTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetTemplateResponse();
}

class IdentityDkimAttributes {
  /// Is true if DKIM signing is enabled for email sent from the identity. It's
  /// false otherwise. The default value is true.
  final bool dkimEnabled;

  /// Describes whether Amazon SES has successfully verified the DKIM DNS
  /// records (tokens) published in the domain name's DNS. (This only applies to
  /// domain identities, not email address identities.)
  final String dkimVerificationStatus;

  /// A set of character strings that represent the domain's identity. Using
  /// these tokens, you need to create DNS CNAME records that point to DKIM
  /// public keys that are hosted by Amazon SES. Amazon Web Services eventually
  /// detects that you've updated your DNS records. This detection process might
  /// take up to 72 hours. After successful detection, Amazon SES is able to
  /// DKIM-sign email originating from that domain. (This only applies to domain
  /// identities, not email address identities.)
  ///
  /// For more information about creating DNS records using DKIM tokens, see the
  /// [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html).
  final List<String> dkimTokens;

  IdentityDkimAttributes({
    @required this.dkimEnabled,
    @required this.dkimVerificationStatus,
    this.dkimTokens,
  });
  static IdentityDkimAttributes fromJson(Map<String, dynamic> json) =>
      IdentityDkimAttributes();
}

class IdentityMailFromDomainAttributes {
  /// The custom MAIL FROM domain that the identity is configured to use.
  final String mailFromDomain;

  /// The state that indicates whether Amazon SES has successfully read the MX
  /// record required for custom MAIL FROM domain setup. If the state is
  /// `Success`, Amazon SES uses the specified custom MAIL FROM domain when the
  /// verified identity sends an email. All other states indicate that Amazon
  /// SES takes the action described by `BehaviorOnMXFailure`.
  final String mailFromDomainStatus;

  /// The action that Amazon SES takes if it cannot successfully read the
  /// required MX record when you send an email. A value of `UseDefaultValue`
  /// indicates that if Amazon SES cannot read the required MX record, it uses
  /// amazonses.com (or a subdomain of that) as the MAIL FROM domain. A value of
  /// `RejectMessage` indicates that if Amazon SES cannot read the required MX
  /// record, Amazon SES returns a `MailFromDomainNotVerified` error and does
  /// not send the email.
  ///
  /// The custom MAIL FROM setup states that result in this behavior are
  /// `Pending`, `Failed`, and `TemporaryFailure`.
  final String behaviorOnMXFailure;

  IdentityMailFromDomainAttributes({
    @required this.mailFromDomain,
    @required this.mailFromDomainStatus,
    @required this.behaviorOnMXFailure,
  });
  static IdentityMailFromDomainAttributes fromJson(Map<String, dynamic> json) =>
      IdentityMailFromDomainAttributes();
}

class IdentityNotificationAttributes {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// will publish bounce notifications.
  final String bounceTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// will publish complaint notifications.
  final String complaintTopic;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES
  /// will publish delivery notifications.
  final String deliveryTopic;

  /// Describes whether Amazon SES will forward bounce and complaint
  /// notifications as email. `true` indicates that Amazon SES will forward
  /// bounce and complaint notifications as email, while `false` indicates that
  /// bounce and complaint notifications will be published only to the specified
  /// bounce and complaint Amazon SNS topics.
  final bool forwardingEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type `Bounce`. A value of `true` specifies that
  /// Amazon SES will include headers in bounce notifications, and a value of
  /// `false` specifies that Amazon SES will not include headers in bounce
  /// notifications.
  final bool headersInBounceNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type `Complaint`. A value of `true` specifies that
  /// Amazon SES will include headers in complaint notifications, and a value of
  /// `false` specifies that Amazon SES will not include headers in complaint
  /// notifications.
  final bool headersInComplaintNotificationsEnabled;

  /// Describes whether Amazon SES includes the original email headers in Amazon
  /// SNS notifications of type `Delivery`. A value of `true` specifies that
  /// Amazon SES will include headers in delivery notifications, and a value of
  /// `false` specifies that Amazon SES will not include headers in delivery
  /// notifications.
  final bool headersInDeliveryNotificationsEnabled;

  IdentityNotificationAttributes({
    @required this.bounceTopic,
    @required this.complaintTopic,
    @required this.deliveryTopic,
    @required this.forwardingEnabled,
    this.headersInBounceNotificationsEnabled,
    this.headersInComplaintNotificationsEnabled,
    this.headersInDeliveryNotificationsEnabled,
  });
  static IdentityNotificationAttributes fromJson(Map<String, dynamic> json) =>
      IdentityNotificationAttributes();
}

class IdentityVerificationAttributes {
  /// The verification status of the identity: "Pending", "Success", "Failed",
  /// or "TemporaryFailure".
  final String verificationStatus;

  /// The verification token for a domain identity. Null for email address
  /// identities.
  final String verificationToken;

  IdentityVerificationAttributes({
    @required this.verificationStatus,
    this.verificationToken,
  });
  static IdentityVerificationAttributes fromJson(Map<String, dynamic> json) =>
      IdentityVerificationAttributes();
}

class KinesisFirehoseDestination {
  /// The ARN of the IAM role under which Amazon SES publishes email sending
  /// events to the Amazon Kinesis Firehose stream.
  final String iamRoleArn;

  /// The ARN of the Amazon Kinesis Firehose stream that email sending events
  /// should be published to.
  final String deliveryStreamArn;

  KinesisFirehoseDestination({
    @required this.iamRoleArn,
    @required this.deliveryStreamArn,
  });
  static KinesisFirehoseDestination fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseDestination();
}

class LambdaAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// Lambda action is taken. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  /// The Amazon Resource Name (ARN) of the AWS Lambda function. An example of
  /// an AWS Lambda function ARN is
  /// `arn:aws:lambda:us-west-2:account-id:function:MyFunction`. For more
  /// information about AWS Lambda, see the [AWS Lambda Developer
  /// Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html).
  final String functionArn;

  /// The invocation type of the AWS Lambda function. An invocation type of
  /// `RequestResponse` means that the execution of the function will
  /// immediately result in a response, and a value of `Event` means that the
  /// function will be invoked asynchronously. The default value is `Event`. For
  /// information about AWS Lambda invocation types, see the [AWS Lambda
  /// Developer
  /// Guide](https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html).
  ///
  ///
  ///
  /// There is a 30-second timeout on `RequestResponse` invocations. You should
  /// use `Event` invocation in most cases. Use `RequestResponse` only when you
  /// want to make a mail flow decision, such as whether to stop the receipt
  /// rule or the receipt rule set.
  final String invocationType;

  LambdaAction({
    this.topicArn,
    @required this.functionArn,
    this.invocationType,
  });
  static LambdaAction fromJson(Map<String, dynamic> json) => LambdaAction();
}

class ListConfigurationSetsResponse {
  /// A list of configuration sets.
  final List<ConfigurationSet> configurationSets;

  /// A token indicating that there are additional configuration sets available
  /// to be listed. Pass this token to successive calls of
  /// `ListConfigurationSets`.
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  static ListConfigurationSetsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationSetsResponse();
}

class ListCustomVerificationEmailTemplatesResponse {
  /// A list of the custom verification email templates that exist in your
  /// account.
  final List<CustomVerificationEmailTemplate> customVerificationEmailTemplates;

  /// A token indicating that there are additional custom verification email
  /// templates available to be listed. Pass this token to a subsequent call to
  /// `ListTemplates` to retrieve the next 50 custom verification email
  /// templates.
  final String nextToken;

  ListCustomVerificationEmailTemplatesResponse({
    this.customVerificationEmailTemplates,
    this.nextToken,
  });
  static ListCustomVerificationEmailTemplatesResponse fromJson(
          Map<String, dynamic> json) =>
      ListCustomVerificationEmailTemplatesResponse();
}

class ListIdentitiesResponse {
  /// A list of identities.
  final List<String> identities;

  /// The token used for pagination.
  final String nextToken;

  ListIdentitiesResponse({
    @required this.identities,
    this.nextToken,
  });
  static ListIdentitiesResponse fromJson(Map<String, dynamic> json) =>
      ListIdentitiesResponse();
}

class ListIdentityPoliciesResponse {
  /// A list of names of policies that apply to the specified identity.
  final List<String> policyNames;

  ListIdentityPoliciesResponse({
    @required this.policyNames,
  });
  static ListIdentityPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListIdentityPoliciesResponse();
}

class ListReceiptFiltersResponse {
  /// A list of IP address filter data structures, which each consist of a name,
  /// an IP address range, and whether to allow or block mail from it.
  final List<ReceiptFilter> filters;

  ListReceiptFiltersResponse({
    this.filters,
  });
  static ListReceiptFiltersResponse fromJson(Map<String, dynamic> json) =>
      ListReceiptFiltersResponse();
}

class ListReceiptRuleSetsResponse {
  /// The metadata for the currently active receipt rule set. The metadata
  /// consists of the rule set name and the timestamp of when the rule set was
  /// created.
  final List<ReceiptRuleSetMetadata> ruleSets;

  /// A token indicating that there are additional receipt rule sets available
  /// to be listed. Pass this token to successive calls of `ListReceiptRuleSets`
  /// to retrieve up to 100 receipt rule sets at a time.
  final String nextToken;

  ListReceiptRuleSetsResponse({
    this.ruleSets,
    this.nextToken,
  });
  static ListReceiptRuleSetsResponse fromJson(Map<String, dynamic> json) =>
      ListReceiptRuleSetsResponse();
}

class ListTemplatesResponse {
  /// An array the contains the name and creation time stamp for each template
  /// in your Amazon SES account.
  final List<TemplateMetadata> templatesMetadata;

  /// A token indicating that there are additional email templates available to
  /// be listed. Pass this token to a subsequent call to `ListTemplates` to
  /// retrieve the next 50 email templates.
  final String nextToken;

  ListTemplatesResponse({
    this.templatesMetadata,
    this.nextToken,
  });
  static ListTemplatesResponse fromJson(Map<String, dynamic> json) =>
      ListTemplatesResponse();
}

class ListVerifiedEmailAddressesResponse {
  /// A list of email addresses that have been verified.
  final List<String> verifiedEmailAddresses;

  ListVerifiedEmailAddressesResponse({
    this.verifiedEmailAddresses,
  });
  static ListVerifiedEmailAddressesResponse fromJson(
          Map<String, dynamic> json) =>
      ListVerifiedEmailAddressesResponse();
}

class Message {
  /// The subject of the message: A short summary of the content, which will
  /// appear in the recipient's inbox.
  final Content subject;

  /// The message body.
  final Body body;

  Message({
    @required this.subject,
    @required this.body,
  });
}

class MessageDsn {
  /// The reporting MTA that attempted to deliver the message, formatted as
  /// specified in [RFC 3464](https://tools.ietf.org/html/rfc3464)
  /// (`mta-name-type; mta-name`). The default value is `dns;
  /// inbound-smtp.\[region\].amazonaws.com`.
  final String reportingMta;

  /// When the message was received by the reporting mail transfer agent (MTA),
  /// in [RFC 822](https://www.ietf.org/rfc/rfc0822.txt) date-time format.
  final DateTime arrivalDate;

  /// Additional X-headers to include in the DSN.
  final List<ExtensionField> extensionFields;

  MessageDsn({
    @required this.reportingMta,
    this.arrivalDate,
    this.extensionFields,
  });
}

class MessageTag {
  /// The name of the tag. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Contain less than 256 characters.
  final String name;

  /// The value of the tag. The value must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Contain less than 256 characters.
  final String value;

  MessageTag({
    @required this.name,
    @required this.value,
  });
}

class PutConfigurationSetDeliveryOptionsResponse {
  PutConfigurationSetDeliveryOptionsResponse();
  static PutConfigurationSetDeliveryOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationSetDeliveryOptionsResponse();
}

class PutIdentityPolicyResponse {
  PutIdentityPolicyResponse();
  static PutIdentityPolicyResponse fromJson(Map<String, dynamic> json) =>
      PutIdentityPolicyResponse();
}

class RawMessage {
  /// The raw data of the message. This data needs to base64-encoded if you are
  /// accessing Amazon SES directly through the HTTPS interface. If you are
  /// accessing Amazon SES using an AWS SDK, the SDK takes care of the base
  /// 64-encoding for you. In all cases, the client must ensure that the message
  /// format complies with Internet email standards regarding email header
  /// fields, MIME types, and MIME encoding.
  ///
  /// The To:, CC:, and BCC: headers in the raw message can contain a group
  /// list.
  ///
  /// If you are using `SendRawEmail` with sending authorization, you can
  /// include X-headers in the raw message to specify the "Source," "From," and
  /// "Return-Path" addresses. For more information, see the documentation for
  /// `SendRawEmail`.
  ///
  ///  Do not include these X-headers in the DKIM signature, because they are
  /// removed by Amazon SES before sending the email.
  ///
  /// For more information, go to the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html).
  final Uint8List data;

  RawMessage({
    @required this.data,
  });
}

class ReceiptAction {
  /// Saves the received message to an Amazon Simple Storage Service (Amazon S3)
  /// bucket and, optionally, publishes a notification to Amazon SNS.
  final S3Action s3Action;

  /// Rejects the received email by returning a bounce response to the sender
  /// and, optionally, publishes a notification to Amazon Simple Notification
  /// Service (Amazon SNS).
  final BounceAction bounceAction;

  /// Calls Amazon WorkMail and, optionally, publishes a notification to Amazon
  /// Amazon SNS.
  final WorkmailAction workmailAction;

  /// Calls an AWS Lambda function, and optionally, publishes a notification to
  /// Amazon SNS.
  final LambdaAction lambdaAction;

  /// Terminates the evaluation of the receipt rule set and optionally publishes
  /// a notification to Amazon SNS.
  final StopAction stopAction;

  /// Adds a header to the received email.
  final AddHeaderAction addHeaderAction;

  /// Publishes the email content within a notification to Amazon SNS.
  final SnsAction snsAction;

  ReceiptAction({
    this.s3Action,
    this.bounceAction,
    this.workmailAction,
    this.lambdaAction,
    this.stopAction,
    this.addHeaderAction,
    this.snsAction,
  });
  static ReceiptAction fromJson(Map<String, dynamic> json) => ReceiptAction();
}

class ReceiptFilter {
  /// The name of the IP address filter. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Start and end with a letter or number.
  ///
  /// *   Contain less than 64 characters.
  final String name;

  /// A structure that provides the IP addresses to block or allow, and whether
  /// to block or allow incoming mail from them.
  final ReceiptIpFilter ipFilter;

  ReceiptFilter({
    @required this.name,
    @required this.ipFilter,
  });
  static ReceiptFilter fromJson(Map<String, dynamic> json) => ReceiptFilter();
}

class ReceiptIpFilter {
  /// Indicates whether to block or allow incoming mail from the specified IP
  /// addresses.
  final String policy;

  /// A single IP address or a range of IP addresses that you want to block or
  /// allow, specified in Classless Inter-Domain Routing (CIDR) notation. An
  /// example of a single email address is 10.0.0.1. An example of a range of IP
  /// addresses is 10.0.0.1/24. For more information about CIDR notation, see
  /// [RFC 2317](https://tools.ietf.org/html/rfc2317).
  final String cidr;

  ReceiptIpFilter({
    @required this.policy,
    @required this.cidr,
  });
  static ReceiptIpFilter fromJson(Map<String, dynamic> json) =>
      ReceiptIpFilter();
}

class ReceiptRule {
  /// The name of the receipt rule. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Start and end with a letter or number.
  ///
  /// *   Contain less than 64 characters.
  final String name;

  /// If `true`, the receipt rule is active. The default value is `false`.
  final bool enabled;

  /// Specifies whether Amazon SES should require that incoming email is
  /// delivered over a connection encrypted with Transport Layer Security (TLS).
  /// If this parameter is set to `Require`, Amazon SES will bounce emails that
  /// are not received over TLS. The default is `Optional`.
  final String tlsPolicy;

  /// The recipient domains and email addresses that the receipt rule applies
  /// to. If this field is not specified, this rule will match all recipients
  /// under all verified domains.
  final List<String> recipients;

  /// An ordered list of actions to perform on messages that match at least one
  /// of the recipient email addresses or domains specified in the receipt rule.
  final List<ReceiptAction> actions;

  /// If `true`, then messages that this receipt rule applies to are scanned for
  /// spam and viruses. The default value is `false`.
  final bool scanEnabled;

  ReceiptRule({
    @required this.name,
    this.enabled,
    this.tlsPolicy,
    this.recipients,
    this.actions,
    this.scanEnabled,
  });
  static ReceiptRule fromJson(Map<String, dynamic> json) => ReceiptRule();
}

class ReceiptRuleSetMetadata {
  /// The name of the receipt rule set. The name must:
  ///
  /// *   This value can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   Start and end with a letter or number.
  ///
  /// *   Contain less than 64 characters.
  final String name;

  /// The date and time the receipt rule set was created.
  final DateTime createdTimestamp;

  ReceiptRuleSetMetadata({
    this.name,
    this.createdTimestamp,
  });
  static ReceiptRuleSetMetadata fromJson(Map<String, dynamic> json) =>
      ReceiptRuleSetMetadata();
}

class RecipientDsnFields {
  /// The email address that the message was ultimately delivered to. This
  /// corresponds to the `Final-Recipient` in the DSN. If not specified,
  /// `FinalRecipient` will be set to the `Recipient` specified in the
  /// `BouncedRecipientInfo` structure. Either `FinalRecipient` or the recipient
  /// in `BouncedRecipientInfo` must be a recipient of the original bounced
  /// message.
  ///
  ///
  ///
  /// Do not prepend the `FinalRecipient` email address with `rfc 822;`, as
  /// described in [RFC 3798](https://tools.ietf.org/html/rfc3798).
  final String finalRecipient;

  /// The action performed by the reporting mail transfer agent (MTA) as a
  /// result of its attempt to deliver the message to the recipient address.
  /// This is required by [RFC 3464](https://tools.ietf.org/html/rfc3464).
  final String action;

  /// The MTA to which the remote MTA attempted to deliver the message,
  /// formatted as specified in [RFC 3464](https://tools.ietf.org/html/rfc3464)
  /// (`mta-name-type; mta-name`). This parameter typically applies only to
  /// propagating synchronous bounces.
  final String remoteMta;

  /// The status code that indicates what went wrong. This is required by [RFC
  /// 3464](https://tools.ietf.org/html/rfc3464).
  final String status;

  /// An extended explanation of what went wrong; this is usually an SMTP
  /// response. See [RFC 3463](https://tools.ietf.org/html/rfc3463) for the
  /// correct formatting of this parameter.
  final String diagnosticCode;

  /// The time the final delivery attempt was made, in [RFC
  /// 822](https://www.ietf.org/rfc/rfc0822.txt) date-time format.
  final DateTime lastAttemptDate;

  /// Additional X-headers to include in the DSN.
  final List<ExtensionField> extensionFields;

  RecipientDsnFields({
    this.finalRecipient,
    @required this.action,
    this.remoteMta,
    @required this.status,
    this.diagnosticCode,
    this.lastAttemptDate,
    this.extensionFields,
  });
}

class ReorderReceiptRuleSetResponse {
  ReorderReceiptRuleSetResponse();
  static ReorderReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      ReorderReceiptRuleSetResponse();
}

class ReputationOptions {
  /// Describes whether email sending is enabled or disabled for the
  /// configuration set. If the value is `true`, then Amazon SES will send
  /// emails that use the configuration set. If the value is `false`, Amazon SES
  /// will not send emails that use the configuration set. The default value is
  /// `true`. You can change this setting using
  /// UpdateConfigurationSetSendingEnabled.
  final bool sendingEnabled;

  /// Describes whether or not Amazon SES publishes reputation metrics for the
  /// configuration set, such as bounce and complaint rates, to Amazon
  /// CloudWatch.
  ///
  /// If the value is `true`, reputation metrics are published. If the value is
  /// `false`, reputation metrics are not published. The default value is
  /// `false`.
  final bool reputationMetricsEnabled;

  /// The date and time at which the reputation metrics for the configuration
  /// set were last reset. Resetting these metrics is known as a _fresh start_.
  ///
  /// When you disable email sending for a configuration set using
  /// UpdateConfigurationSetSendingEnabled and later re-enable it, the
  /// reputation metrics for the configuration set (but not for the entire
  /// Amazon SES account) are reset.
  ///
  /// If email sending for the configuration set has never been disabled and
  /// later re-enabled, the value of this attribute is `null`.
  final DateTime lastFreshStart;

  ReputationOptions({
    this.sendingEnabled,
    this.reputationMetricsEnabled,
    this.lastFreshStart,
  });
  static ReputationOptions fromJson(Map<String, dynamic> json) =>
      ReputationOptions();
}

class S3Action {
  /// The ARN of the Amazon SNS topic to notify when the message is saved to the
  /// Amazon S3 bucket. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  /// The name of the Amazon S3 bucket that incoming email will be saved to.
  final String bucketName;

  /// The key prefix of the Amazon S3 bucket. The key prefix is similar to a
  /// directory name that enables you to store similar data under the same
  /// directory in a bucket.
  final String objectKeyPrefix;

  /// The customer master key that Amazon SES should use to encrypt your emails
  /// before saving them to the Amazon S3 bucket. You can use the default master
  /// key or a custom master key you created in AWS KMS as follows:
  ///
  /// *   To use the default master key, provide an ARN in the form of
  /// `arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses`. For
  /// example, if your AWS account ID is 123456789012 and you want to use the
  /// default master key in the US West (Oregon) region, the ARN of the default
  /// master key would be `arn:aws:kms:us-west-2:123456789012:alias/aws/ses`. If
  /// you use the default master key, you don't need to perform any extra steps
  /// to give Amazon SES permission to use the key.
  ///
  /// *   To use a custom master key you created in AWS KMS, provide the ARN of
  /// the master key and ensure that you add a statement to your key's policy to
  /// give Amazon SES permission to use it. For more information about giving
  /// permissions, see the [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html).
  ///
  ///
  /// For more information about key policies, see the [AWS KMS Developer
  /// Guide](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html).
  /// If you do not specify a master key, Amazon SES will not encrypt your
  /// emails.
  ///
  ///
  ///
  /// Your mail is encrypted by Amazon SES using the Amazon S3 encryption client
  /// before the mail is submitted to Amazon S3 for storage. It is not encrypted
  /// using Amazon S3 server-side encryption. This means that you must use the
  /// Amazon S3 encryption client to decrypt the email after retrieving it from
  /// Amazon S3, as the service has no access to use your AWS KMS keys for
  /// decryption. This encryption client is currently available with the [AWS
  /// SDK for Java](http://aws.amazon.com/sdk-for-java/) and [AWS SDK for
  /// Ruby](http://aws.amazon.com/sdk-for-ruby/) only. For more information
  /// about client-side encryption using AWS KMS master keys, see the [Amazon S3
  /// Developer
  /// Guide](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html).
  final String kmsKeyArn;

  S3Action({
    this.topicArn,
    @required this.bucketName,
    this.objectKeyPrefix,
    this.kmsKeyArn,
  });
  static S3Action fromJson(Map<String, dynamic> json) => S3Action();
}

class SnsAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. An
  /// example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  /// The encoding to use for the email within the Amazon SNS notification.
  /// UTF-8 is easier to use, but may not preserve all special characters when a
  /// message was encoded with a different encoding format. Base64 preserves all
  /// special characters. The default value is UTF-8.
  final String encoding;

  SnsAction({
    @required this.topicArn,
    this.encoding,
  });
  static SnsAction fromJson(Map<String, dynamic> json) => SnsAction();
}

class SnsDestination {
  /// The ARN of the Amazon SNS topic that email sending events will be
  /// published to. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  SnsDestination({
    @required this.topicArn,
  });
  static SnsDestination fromJson(Map<String, dynamic> json) => SnsDestination();
}

class SendBounceResponse {
  /// The message ID of the bounce message.
  final String messageId;

  SendBounceResponse({
    this.messageId,
  });
  static SendBounceResponse fromJson(Map<String, dynamic> json) =>
      SendBounceResponse();
}

class SendBulkTemplatedEmailResponse {
  /// The unique message identifier returned from the `SendBulkTemplatedEmail`
  /// action.
  final List<BulkEmailDestinationStatus> status;

  SendBulkTemplatedEmailResponse({
    @required this.status,
  });
  static SendBulkTemplatedEmailResponse fromJson(Map<String, dynamic> json) =>
      SendBulkTemplatedEmailResponse();
}

class SendCustomVerificationEmailResponse {
  /// The unique message identifier returned from the
  /// `SendCustomVerificationEmail` operation.
  final String messageId;

  SendCustomVerificationEmailResponse({
    this.messageId,
  });
  static SendCustomVerificationEmailResponse fromJson(
          Map<String, dynamic> json) =>
      SendCustomVerificationEmailResponse();
}

class SendDataPoint {
  /// Time of the data point.
  final DateTime timestamp;

  /// Number of emails that have been sent.
  final BigInt deliveryAttempts;

  /// Number of emails that have bounced.
  final BigInt bounces;

  /// Number of unwanted emails that were rejected by recipients.
  final BigInt complaints;

  /// Number of emails rejected by Amazon SES.
  final BigInt rejects;

  SendDataPoint({
    this.timestamp,
    this.deliveryAttempts,
    this.bounces,
    this.complaints,
    this.rejects,
  });
  static SendDataPoint fromJson(Map<String, dynamic> json) => SendDataPoint();
}

class SendEmailResponse {
  /// The unique message identifier returned from the `SendEmail` action.
  final String messageId;

  SendEmailResponse({
    @required this.messageId,
  });
  static SendEmailResponse fromJson(Map<String, dynamic> json) =>
      SendEmailResponse();
}

class SendRawEmailResponse {
  /// The unique message identifier returned from the `SendRawEmail` action.
  final String messageId;

  SendRawEmailResponse({
    @required this.messageId,
  });
  static SendRawEmailResponse fromJson(Map<String, dynamic> json) =>
      SendRawEmailResponse();
}

class SendTemplatedEmailResponse {
  /// The unique message identifier returned from the `SendTemplatedEmail`
  /// action.
  final String messageId;

  SendTemplatedEmailResponse({
    @required this.messageId,
  });
  static SendTemplatedEmailResponse fromJson(Map<String, dynamic> json) =>
      SendTemplatedEmailResponse();
}

class SetActiveReceiptRuleSetResponse {
  SetActiveReceiptRuleSetResponse();
  static SetActiveReceiptRuleSetResponse fromJson(Map<String, dynamic> json) =>
      SetActiveReceiptRuleSetResponse();
}

class SetIdentityDkimEnabledResponse {
  SetIdentityDkimEnabledResponse();
  static SetIdentityDkimEnabledResponse fromJson(Map<String, dynamic> json) =>
      SetIdentityDkimEnabledResponse();
}

class SetIdentityFeedbackForwardingEnabledResponse {
  SetIdentityFeedbackForwardingEnabledResponse();
  static SetIdentityFeedbackForwardingEnabledResponse fromJson(
          Map<String, dynamic> json) =>
      SetIdentityFeedbackForwardingEnabledResponse();
}

class SetIdentityHeadersInNotificationsEnabledResponse {
  SetIdentityHeadersInNotificationsEnabledResponse();
  static SetIdentityHeadersInNotificationsEnabledResponse fromJson(
          Map<String, dynamic> json) =>
      SetIdentityHeadersInNotificationsEnabledResponse();
}

class SetIdentityMailFromDomainResponse {
  SetIdentityMailFromDomainResponse();
  static SetIdentityMailFromDomainResponse fromJson(
          Map<String, dynamic> json) =>
      SetIdentityMailFromDomainResponse();
}

class SetIdentityNotificationTopicResponse {
  SetIdentityNotificationTopicResponse();
  static SetIdentityNotificationTopicResponse fromJson(
          Map<String, dynamic> json) =>
      SetIdentityNotificationTopicResponse();
}

class SetReceiptRulePositionResponse {
  SetReceiptRulePositionResponse();
  static SetReceiptRulePositionResponse fromJson(Map<String, dynamic> json) =>
      SetReceiptRulePositionResponse();
}

class StopAction {
  /// The scope of the StopAction. The only acceptable value is `RuleSet`.
  final String scope;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// stop action is taken. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  StopAction({
    @required this.scope,
    this.topicArn,
  });
  static StopAction fromJson(Map<String, dynamic> json) => StopAction();
}

class Template {
  /// The name of the template. You will refer to this name when you send email
  /// using the `SendTemplatedEmail` or `SendBulkTemplatedEmail` operations.
  final String templateName;

  /// The subject line of the email.
  final String subjectPart;

  /// The email body that will be visible to recipients whose email clients do
  /// not display HTML.
  final String textPart;

  /// The HTML body of the email.
  final String htmlPart;

  Template({
    @required this.templateName,
    this.subjectPart,
    this.textPart,
    this.htmlPart,
  });
  static Template fromJson(Map<String, dynamic> json) => Template();
}

class TemplateMetadata {
  /// The name of the template.
  final String name;

  /// The time and date the template was created.
  final DateTime createdTimestamp;

  TemplateMetadata({
    this.name,
    this.createdTimestamp,
  });
  static TemplateMetadata fromJson(Map<String, dynamic> json) =>
      TemplateMetadata();
}

class TestRenderTemplateResponse {
  /// The complete MIME message rendered by applying the data in the
  /// TemplateData parameter to the template specified in the TemplateName
  /// parameter.
  final String renderedTemplate;

  TestRenderTemplateResponse({
    this.renderedTemplate,
  });
  static TestRenderTemplateResponse fromJson(Map<String, dynamic> json) =>
      TestRenderTemplateResponse();
}

class TrackingOptions {
  /// The custom subdomain that will be used to redirect email recipients to the
  /// Amazon SES event tracking domain.
  final String customRedirectDomain;

  TrackingOptions({
    this.customRedirectDomain,
  });
  static TrackingOptions fromJson(Map<String, dynamic> json) =>
      TrackingOptions();
}

class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  static UpdateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateConfigurationSetEventDestinationResponse();
}

class UpdateConfigurationSetTrackingOptionsResponse {
  UpdateConfigurationSetTrackingOptionsResponse();
  static UpdateConfigurationSetTrackingOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateConfigurationSetTrackingOptionsResponse();
}

class UpdateReceiptRuleResponse {
  UpdateReceiptRuleResponse();
  static UpdateReceiptRuleResponse fromJson(Map<String, dynamic> json) =>
      UpdateReceiptRuleResponse();
}

class UpdateTemplateResponse {
  UpdateTemplateResponse();
  static UpdateTemplateResponse fromJson(Map<String, dynamic> json) =>
      UpdateTemplateResponse();
}

class VerifyDomainDkimResponse {
  /// A set of character strings that represent the domain's identity. If the
  /// identity is an email address, the tokens represent the domain of that
  /// address.
  ///
  /// Using these tokens, you need to create DNS CNAME records that point to
  /// DKIM public keys that are hosted by Amazon SES. Amazon Web Services
  /// eventually detects that you've updated your DNS records. This detection
  /// process might take up to 72 hours. After successful detection, Amazon SES
  /// is able to DKIM-sign email originating from that domain. (This only
  /// applies to domain identities, not email address identities.)
  ///
  /// For more information about creating DNS records using DKIM tokens, see the
  /// [Amazon SES Developer
  /// Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html).
  final List<String> dkimTokens;

  VerifyDomainDkimResponse({
    @required this.dkimTokens,
  });
  static VerifyDomainDkimResponse fromJson(Map<String, dynamic> json) =>
      VerifyDomainDkimResponse();
}

class VerifyDomainIdentityResponse {
  /// A TXT record that you must place in the DNS settings of the domain to
  /// complete domain verification with Amazon SES.
  ///
  /// As Amazon SES searches for the TXT record, the domain's verification
  /// status is "Pending". When Amazon SES detects the record, the domain's
  /// verification status changes to "Success". If Amazon SES is unable to
  /// detect the record within 72 hours, the domain's verification status
  /// changes to "Failed." In that case, if you still want to verify the domain,
  /// you must restart the verification process from the beginning.
  final String verificationToken;

  VerifyDomainIdentityResponse({
    @required this.verificationToken,
  });
  static VerifyDomainIdentityResponse fromJson(Map<String, dynamic> json) =>
      VerifyDomainIdentityResponse();
}

class VerifyEmailIdentityResponse {
  VerifyEmailIdentityResponse();
  static VerifyEmailIdentityResponse fromJson(Map<String, dynamic> json) =>
      VerifyEmailIdentityResponse();
}

class WorkmailAction {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the
  /// WorkMail action is called. An example of an Amazon SNS topic ARN is
  /// `arn:aws:sns:us-west-2:123456789012:MyTopic`. For more information about
  /// Amazon SNS topics, see the [Amazon SNS Developer
  /// Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  /// The ARN of the Amazon WorkMail organization. An example of an Amazon
  /// WorkMail organization ARN is
  /// `arn:aws:workmail:us-west-2:123456789012:organization/m-68755160c4cb4e29a2b2f8fb58f359d7`.
  /// For information about Amazon WorkMail organizations, see the [Amazon
  /// WorkMail Administrator
  /// Guide](https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html).
  final String organizationArn;

  WorkmailAction({
    this.topicArn,
    @required this.organizationArn,
  });
  static WorkmailAction fromJson(Map<String, dynamic> json) => WorkmailAction();
}
