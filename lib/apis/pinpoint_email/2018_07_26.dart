import 'package:meta/meta.dart';

/// Amazon Pinpoint Email Service
///
/// This document contains reference information for the [Amazon
/// Pinpoint](https://aws.amazon.com/pinpoint) Email API, version 1.0. This
/// document is best used in conjunction with the [Amazon Pinpoint Developer
/// Guide](https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html).
///
/// The Amazon Pinpoint Email API is available in several AWS Regions and it
/// provides an endpoint for each of these Regions. For a list of all the
/// Regions and endpoints where the API is currently available, see [AWS Regions
/// and
/// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#pinpoint_region)
/// in the _Amazon Web Services General Reference_.
///
/// In each Region, AWS maintains multiple Availability Zones. These
/// Availability Zones are physically isolated from each other, but are united
/// by private, low-latency, high-throughput, and highly redundant network
/// connections. These Availability Zones enable us to provide very high levels
/// of availability and redundancy, while also minimizing latency. To learn more
/// about the number of Availability Zones that are available in each Region,
/// see [AWS Global
/// Infrastructure](http://aws.amazon.com/about-aws/global-infrastructure/).
class PinpointEmailApi {
  /// Create a configuration set. _Configuration sets_ are groups of rules that
  /// you can apply to the emails you send using Amazon Pinpoint. You apply a
  /// configuration set to an email by including a reference to the
  /// configuration set in the headers of the email. When you apply a
  /// configuration set to an email, all of the rules in that configuration set
  /// are applied to the email.
  Future<void> createConfigurationSet(String configurationSetName,
      {TrackingOptions trackingOptions,
      DeliveryOptions deliveryOptions,
      ReputationOptions reputationOptions,
      SendingOptions sendingOptions,
      List<Tag> tags}) async {}

  /// Create an event destination. In Amazon Pinpoint, _events_ include message
  /// sends, deliveries, opens, clicks, bounces, and complaints. _Event
  /// destinations_ are places that you can send information about these events
  /// to. For example, you can send event data to Amazon SNS to receive
  /// notifications when you receive bounces or complaints, or you can use
  /// Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term
  /// storage.
  ///
  /// A single configuration set can include more than one event destination.
  Future<void> createConfigurationSetEventDestination(
      {@required String configurationSetName,
      @required String eventDestinationName,
      @required EventDestinationDefinition eventDestination}) async {}

  /// Create a new pool of dedicated IP addresses. A pool can include one or
  /// more dedicated IP addresses that are associated with your Amazon Pinpoint
  /// account. You can associate a pool with a configuration set. When you send
  /// an email that uses that configuration set, Amazon Pinpoint sends it using
  /// only the IP addresses in the associated pool.
  Future<void> createDedicatedIpPool(String poolName, {List<Tag> tags}) async {}

  /// Create a new predictive inbox placement test. Predictive inbox placement
  /// tests can help you predict how your messages will be handled by various
  /// email providers around the world. When you perform a predictive inbox
  /// placement test, you provide a sample message that contains the content
  /// that you plan to send to your customers. Amazon Pinpoint then sends that
  /// message to special email addresses spread across several major email
  /// providers. After about 24 hours, the test is complete, and you can use the
  /// `GetDeliverabilityTestReport` operation to view the results of the test.
  Future<void> createDeliverabilityTestReport(
      {String reportName,
      @required String fromEmailAddress,
      @required EmailContent content,
      List<Tag> tags}) async {}

  /// Verifies an email identity for use with Amazon Pinpoint. In Amazon
  /// Pinpoint, an identity is an email address or domain that you use when you
  /// send email. Before you can use an identity to send email with Amazon
  /// Pinpoint, you first have to verify it. By verifying an address, you
  /// demonstrate that you're the owner of the address, and that you've given
  /// Amazon Pinpoint permission to send email from the address.
  ///
  /// When you verify an email address, Amazon Pinpoint sends an email to the
  /// address. Your email address is verified as soon as you follow the link in
  /// the verification email.
  ///
  /// When you verify a domain, this operation provides a set of DKIM tokens,
  /// which you can convert into CNAME tokens. You add these CNAME tokens to the
  /// DNS configuration for your domain. Your domain is verified when Amazon
  /// Pinpoint detects these records in the DNS configuration for your domain.
  /// It usually takes around 72 hours to complete the domain verification
  /// process.
  Future<void> createEmailIdentity(String emailIdentity,
      {List<Tag> tags}) async {}

  /// Delete an existing configuration set.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  Future<void> deleteConfigurationSet(String configurationSetName) async {}

  /// Delete an event destination.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  Future<void> deleteConfigurationSetEventDestination(
      {@required String configurationSetName,
      @required String eventDestinationName}) async {}

  /// Delete a dedicated IP pool.
  Future<void> deleteDedicatedIpPool(String poolName) async {}

  /// Deletes an email identity that you previously verified for use with Amazon
  /// Pinpoint. An identity can be either an email address or a domain name.
  Future<void> deleteEmailIdentity(String emailIdentity) async {}

  /// Obtain information about the email-sending status and capabilities of your
  /// Amazon Pinpoint account in the current AWS Region.
  Future<void> getAccount() async {}

  /// Retrieve a list of the blacklists that your dedicated IP addresses appear
  /// on.
  Future<void> getBlacklistReports(List<String> blacklistItemNames) async {}

  /// Get information about an existing configuration set, including the
  /// dedicated IP pool that it's associated with, whether or not it's enabled
  /// for sending email, and more.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  Future<void> getConfigurationSet(String configurationSetName) async {}

  /// Retrieve a list of event destinations that are associated with a
  /// configuration set.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  Future<void> getConfigurationSetEventDestinations(
      String configurationSetName) async {}

  /// Get information about a dedicated IP address, including the name of the
  /// dedicated IP pool that it's associated with, as well information about the
  /// automatic warm-up process for the address.
  Future<void> getDedicatedIp(String ip) async {}

  /// List the dedicated IP addresses that are associated with your Amazon
  /// Pinpoint account.
  Future<void> getDedicatedIps(
      {String poolName, String nextToken, int pageSize}) async {}

  /// Retrieve information about the status of the Deliverability dashboard for
  /// your Amazon Pinpoint account. When the Deliverability dashboard is
  /// enabled, you gain access to reputation, deliverability, and other metrics
  /// for the domains that you use to send email using Amazon Pinpoint. You also
  /// gain the ability to perform predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon
  /// Pinpoint. For more information about the features and cost of a
  /// Deliverability dashboard subscription, see [Amazon Pinpoint
  /// Pricing](http://aws.amazon.com/pinpoint/pricing/).
  Future<void> getDeliverabilityDashboardOptions() async {}

  /// Retrieve the results of a predictive inbox placement test.
  Future<void> getDeliverabilityTestReport(String reportId) async {}

  /// Retrieve all the deliverability data for a specific campaign. This data is
  /// available for a campaign only if the campaign sent email by using a domain
  /// that the Deliverability dashboard is enabled for
  /// (`PutDeliverabilityDashboardOption` operation).
  Future<void> getDomainDeliverabilityCampaign(String campaignId) async {}

  /// Retrieve inbox placement and engagement rates for the domains that you use
  /// to send email.
  Future<void> getDomainStatisticsReport(
      {@required String domain,
      @required DateTime startDate,
      @required DateTime endDate}) async {}

  /// Provides information about a specific identity associated with your Amazon
  /// Pinpoint account, including the identity's verification status, its DKIM
  /// authentication status, and its custom Mail-From settings.
  Future<void> getEmailIdentity(String emailIdentity) async {}

  /// List all of the configuration sets associated with your Amazon Pinpoint
  /// account in the current region.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  Future<void> listConfigurationSets({String nextToken, int pageSize}) async {}

  /// List all of the dedicated IP pools that exist in your Amazon Pinpoint
  /// account in the current AWS Region.
  Future<void> listDedicatedIpPools({String nextToken, int pageSize}) async {}

  /// Show a list of the predictive inbox placement tests that you've performed,
  /// regardless of their statuses. For predictive inbox placement tests that
  /// are complete, you can use the `GetDeliverabilityTestReport` operation to
  /// view the results.
  Future<void> listDeliverabilityTestReports(
      {String nextToken, int pageSize}) async {}

  /// Retrieve deliverability data for all the campaigns that used a specific
  /// domain to send email during a specified time range. This data is available
  /// for a domain only if you enabled the Deliverability dashboard
  /// (`PutDeliverabilityDashboardOption` operation) for the domain.
  Future<void> listDomainDeliverabilityCampaigns(
      {@required DateTime startDate,
      @required DateTime endDate,
      @required String subscribedDomain,
      String nextToken,
      int pageSize}) async {}

  /// Returns a list of all of the email identities that are associated with
  /// your Amazon Pinpoint account. An identity can be either an email address
  /// or a domain. This operation returns identities that are verified as well
  /// as those that aren't.
  Future<void> listEmailIdentities({String nextToken, int pageSize}) async {}

  /// Retrieve a list of the tags (keys and values) that are associated with a
  /// specified resource. A _tag_ is a label that you optionally define and
  /// associate with a resource in Amazon Pinpoint. Each tag consists of a
  /// required _tag key_ and an optional associated _tag value_. A tag key is a
  /// general label that acts as a category for more specific tag values. A tag
  /// value acts as a descriptor within a tag key.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Enable or disable the automatic warm-up feature for dedicated IP
  /// addresses.
  Future<void> putAccountDedicatedIpWarmupAttributes(
      {bool autoWarmupEnabled}) async {}

  /// Enable or disable the ability of your account to send email.
  Future<void> putAccountSendingAttributes({bool sendingEnabled}) async {}

  /// Associate a configuration set with a dedicated IP pool. You can use
  /// dedicated IP pools to create groups of dedicated IP addresses for sending
  /// specific types of email.
  Future<void> putConfigurationSetDeliveryOptions(String configurationSetName,
      {String tlsPolicy, String sendingPoolName}) async {}

  /// Enable or disable collection of reputation metrics for emails that you
  /// send using a particular configuration set in a specific AWS Region.
  Future<void> putConfigurationSetReputationOptions(String configurationSetName,
      {bool reputationMetricsEnabled}) async {}

  /// Enable or disable email sending for messages that use a particular
  /// configuration set in a specific AWS Region.
  Future<void> putConfigurationSetSendingOptions(String configurationSetName,
      {bool sendingEnabled}) async {}

  /// Specify a custom domain to use for open and click tracking elements in
  /// email that you send using Amazon Pinpoint.
  Future<void> putConfigurationSetTrackingOptions(String configurationSetName,
      {String customRedirectDomain}) async {}

  /// Move a dedicated IP address to an existing dedicated IP pool.
  ///
  ///
  ///
  /// The dedicated IP address that you specify must already exist, and must be
  /// associated with your Amazon Pinpoint account.
  ///
  /// The dedicated IP pool you specify must already exist. You can create a new
  /// pool by using the `CreateDedicatedIpPool` operation.
  Future<void> putDedicatedIpInPool(
      {@required String ip, @required String destinationPoolName}) async {}

  Future<void> putDedicatedIpWarmupAttributes(
      {@required String ip, @required int warmupPercentage}) async {}

  /// Enable or disable the Deliverability dashboard for your Amazon Pinpoint
  /// account. When you enable the Deliverability dashboard, you gain access to
  /// reputation, deliverability, and other metrics for the domains that you use
  /// to send email using Amazon Pinpoint. You also gain the ability to perform
  /// predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon
  /// Pinpoint. For more information about the features and cost of a
  /// Deliverability dashboard subscription, see [Amazon Pinpoint
  /// Pricing](http://aws.amazon.com/pinpoint/pricing/).
  Future<void> putDeliverabilityDashboardOption(bool dashboardEnabled,
      {List<DomainDeliverabilityTrackingOption> subscribedDomains}) async {}

  /// Used to enable or disable DKIM authentication for an email identity.
  Future<void> putEmailIdentityDkimAttributes(String emailIdentity,
      {bool signingEnabled}) async {}

  /// Used to enable or disable feedback forwarding for an identity. This
  /// setting determines what happens when an identity is used to send an email
  /// that results in a bounce or complaint event.
  ///
  /// When you enable feedback forwarding, Amazon Pinpoint sends you email
  /// notifications when bounce or complaint events occur. Amazon Pinpoint sends
  /// this notification to the address that you specified in the Return-Path
  /// header of the original email.
  ///
  /// When you disable feedback forwarding, Amazon Pinpoint sends notifications
  /// through other mechanisms, such as by notifying an Amazon SNS topic. You're
  /// required to have a method of tracking bounces and complaints. If you
  /// haven't set up another mechanism for receiving bounce or complaint
  /// notifications, Amazon Pinpoint sends an email notification when these
  /// events occur (even if this setting is disabled).
  Future<void> putEmailIdentityFeedbackAttributes(String emailIdentity,
      {bool emailForwardingEnabled}) async {}

  /// Used to enable or disable the custom Mail-From domain configuration for an
  /// email identity.
  Future<void> putEmailIdentityMailFromAttributes(String emailIdentity,
      {String mailFromDomain, String behaviorOnMxFailure}) async {}

  /// Sends an email message. You can use the Amazon Pinpoint Email API to send
  /// two types of messages:
  ///
  /// *    **Simple** – A standard email message. When you create this type of
  /// message, you specify the sender, the recipient, and the message body, and
  /// Amazon Pinpoint assembles the message for you.
  ///
  /// *    **Raw** – A raw, MIME-formatted email message. When you send this
  /// type of email, you have to specify all of the message headers, as well as
  /// the message body. You can use this message type to send messages that
  /// contain attachments. The message that you specify has to be a valid MIME
  /// message.
  Future<void> sendEmail(
      {String fromEmailAddress,
      @required Destination destination,
      List<String> replyToAddresses,
      String feedbackForwardingEmailAddress,
      @required EmailContent content,
      List<MessageTag> emailTags,
      String configurationSetName}) async {}

  /// Add one or more tags (keys and values) to a specified resource. A _tag_ is
  /// a label that you optionally define and associate with a resource in Amazon
  /// Pinpoint. Tags can help you categorize and manage resources in different
  /// ways, such as by purpose, owner, environment, or other criteria. A
  /// resource can have as many as 50 tags.
  ///
  /// Each tag consists of a required _tag key_ and an associated _tag value_,
  /// both of which you define. A tag key is a general label that acts as a
  /// category for more specific tag values. A tag value acts as a descriptor
  /// within a tag key.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Remove one or more tags (keys and values) from a specified resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Update the configuration of an event destination for a configuration set.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  Future<void> updateConfigurationSetEventDestination(
      {@required String configurationSetName,
      @required String eventDestinationName,
      @required EventDestinationDefinition eventDestination}) async {}
}

class BlacklistEntry {}

class Body {}

class CloudWatchDestination {}

class CloudWatchDimensionConfiguration {}

class Content {}

class CreateConfigurationSetEventDestinationResponse {}

class CreateConfigurationSetResponse {}

class CreateDedicatedIpPoolResponse {}

class CreateDeliverabilityTestReportResponse {}

class CreateEmailIdentityResponse {}

class DailyVolume {}

class DedicatedIp {}

class DeleteConfigurationSetEventDestinationResponse {}

class DeleteConfigurationSetResponse {}

class DeleteDedicatedIpPoolResponse {}

class DeleteEmailIdentityResponse {}

class DeliverabilityTestReport {}

class DeliveryOptions {}

class Destination {}

class DkimAttributes {}

class DomainDeliverabilityCampaign {}

class DomainDeliverabilityTrackingOption {}

class DomainIspPlacement {}

class EmailContent {}

class EventDestination {}

class EventDestinationDefinition {}

class GetAccountResponse {}

class GetBlacklistReportsResponse {}

class GetConfigurationSetEventDestinationsResponse {}

class GetConfigurationSetResponse {}

class GetDedicatedIpResponse {}

class GetDedicatedIpsResponse {}

class GetDeliverabilityDashboardOptionsResponse {}

class GetDeliverabilityTestReportResponse {}

class GetDomainDeliverabilityCampaignResponse {}

class GetDomainStatisticsReportResponse {}

class GetEmailIdentityResponse {}

class IdentityInfo {}

class InboxPlacementTrackingOption {}

class IspPlacement {}

class KinesisFirehoseDestination {}

class ListConfigurationSetsResponse {}

class ListDedicatedIpPoolsResponse {}

class ListDeliverabilityTestReportsResponse {}

class ListDomainDeliverabilityCampaignsResponse {}

class ListEmailIdentitiesResponse {}

class ListTagsForResourceResponse {}

class MailFromAttributes {}

class Message {}

class MessageTag {}

class OverallVolume {}

class PinpointDestination {}

class PlacementStatistics {}

class PutAccountDedicatedIpWarmupAttributesResponse {}

class PutAccountSendingAttributesResponse {}

class PutConfigurationSetDeliveryOptionsResponse {}

class PutConfigurationSetReputationOptionsResponse {}

class PutConfigurationSetSendingOptionsResponse {}

class PutConfigurationSetTrackingOptionsResponse {}

class PutDedicatedIpInPoolResponse {}

class PutDedicatedIpWarmupAttributesResponse {}

class PutDeliverabilityDashboardOptionResponse {}

class PutEmailIdentityDkimAttributesResponse {}

class PutEmailIdentityFeedbackAttributesResponse {}

class PutEmailIdentityMailFromAttributesResponse {}

class RawMessage {}

class ReputationOptions {}

class SendEmailResponse {}

class SendQuota {}

class SendingOptions {}

class SnsDestination {}

class Tag {}

class TagResourceResponse {}

class TrackingOptions {}

class UntagResourceResponse {}

class UpdateConfigurationSetEventDestinationResponse {}

class VolumeStatistics {}
