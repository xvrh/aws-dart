import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Pinpoint Email Service
///
/// This document contains reference information for the
/// [Amazon Pinpoint](https://aws.amazon.com/pinpoint) Email API, version 1.0.
/// This document is best used in conjunction with the
/// [Amazon Pinpoint Developer Guide](https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html).
///
/// The Amazon Pinpoint Email API is available in several AWS Regions and it
/// provides an endpoint for each of these Regions. For a list of all the
/// Regions and endpoints where the API is currently available, see
/// [AWS Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#pinpoint_region)
/// in the _Amazon Web Services General Reference_.
///
/// In each Region, AWS maintains multiple Availability Zones. These
/// Availability Zones are physically isolated from each other, but are united
/// by private, low-latency, high-throughput, and highly redundant network
/// connections. These Availability Zones enable us to provide very high levels
/// of availability and redundancy, while also minimizing latency. To learn more
/// about the number of Availability Zones that are available in each Region,
/// see
/// [AWS Global Infrastructure](http://aws.amazon.com/about-aws/global-infrastructure/).
class PinpointEmailApi {
  /// Create a configuration set. _Configuration sets_ are groups of rules that
  /// you can apply to the emails you send using Amazon Pinpoint. You apply a
  /// configuration set to an email by including a reference to the
  /// configuration set in the headers of the email. When you apply a
  /// configuration set to an email, all of the rules in that configuration set
  /// are applied to the email.
  ///
  /// [configurationSetName]: The name of the configuration set.
  ///
  /// [trackingOptions]: An object that defines the open and click tracking
  /// options for emails that you send using the configuration set.
  ///
  /// [deliveryOptions]: An object that defines the dedicated IP pool that is
  /// used to send emails that you send using the configuration set.
  ///
  /// [reputationOptions]: An object that defines whether or not Amazon Pinpoint
  /// collects reputation metrics for the emails that you send that use the
  /// configuration set.
  ///
  /// [sendingOptions]: An object that defines whether or not Amazon Pinpoint
  /// can send email that you send using the configuration set.
  ///
  /// [tags]: An array of objects that define the tags (keys and values) that
  /// you want to associate with the configuration set.
  Future<CreateConfigurationSetResponse> createConfigurationSet(
      String configurationSetName,
      {TrackingOptions trackingOptions,
      DeliveryOptions deliveryOptions,
      ReputationOptions reputationOptions,
      SendingOptions sendingOptions,
      List<Tag> tags}) async {
    return CreateConfigurationSetResponse.fromJson({});
  }

  /// Create an event destination. In Amazon Pinpoint, _events_ include message
  /// sends, deliveries, opens, clicks, bounces, and complaints. _Event
  /// destinations_ are places that you can send information about these events
  /// to. For example, you can send event data to Amazon SNS to receive
  /// notifications when you receive bounces or complaints, or you can use
  /// Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term
  /// storage.
  ///
  /// A single configuration set can include more than one event destination.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// add an event destination to.
  ///
  /// [eventDestinationName]: A name that identifies the event destination
  /// within the configuration set.
  ///
  /// [eventDestination]: An object that defines the event destination.
  Future<CreateConfigurationSetEventDestinationResponse>
      createConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required String eventDestinationName,
          @required EventDestinationDefinition eventDestination}) async {
    return CreateConfigurationSetEventDestinationResponse.fromJson({});
  }

  /// Create a new pool of dedicated IP addresses. A pool can include one or
  /// more dedicated IP addresses that are associated with your Amazon Pinpoint
  /// account. You can associate a pool with a configuration set. When you send
  /// an email that uses that configuration set, Amazon Pinpoint sends it using
  /// only the IP addresses in the associated pool.
  ///
  /// [poolName]: The name of the dedicated IP pool.
  ///
  /// [tags]: An object that defines the tags (keys and values) that you want to
  /// associate with the pool.
  Future<CreateDedicatedIpPoolResponse> createDedicatedIpPool(String poolName,
      {List<Tag> tags}) async {
    return CreateDedicatedIpPoolResponse.fromJson({});
  }

  /// Create a new predictive inbox placement test. Predictive inbox placement
  /// tests can help you predict how your messages will be handled by various
  /// email providers around the world. When you perform a predictive inbox
  /// placement test, you provide a sample message that contains the content
  /// that you plan to send to your customers. Amazon Pinpoint then sends that
  /// message to special email addresses spread across several major email
  /// providers. After about 24 hours, the test is complete, and you can use the
  /// `GetDeliverabilityTestReport` operation to view the results of the test.
  ///
  /// [reportName]: A unique name that helps you to identify the predictive
  /// inbox placement test when you retrieve the results.
  ///
  /// [fromEmailAddress]: The email address that the predictive inbox placement
  /// test email was sent from.
  ///
  /// [content]: The HTML body of the message that you sent when you performed
  /// the predictive inbox placement test.
  ///
  /// [tags]: An array of objects that define the tags (keys and values) that
  /// you want to associate with the predictive inbox placement test.
  Future<CreateDeliverabilityTestReportResponse> createDeliverabilityTestReport(
      {String reportName,
      @required String fromEmailAddress,
      @required EmailContent content,
      List<Tag> tags}) async {
    return CreateDeliverabilityTestReportResponse.fromJson({});
  }

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
  ///
  /// [emailIdentity]: The email address or domain that you want to verify.
  ///
  /// [tags]: An array of objects that define the tags (keys and values) that
  /// you want to associate with the email identity.
  Future<CreateEmailIdentityResponse> createEmailIdentity(String emailIdentity,
      {List<Tag> tags}) async {
    return CreateEmailIdentityResponse.fromJson({});
  }

  /// Delete an existing configuration set.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// delete.
  Future<DeleteConfigurationSetResponse> deleteConfigurationSet(
      String configurationSetName) async {
    return DeleteConfigurationSetResponse.fromJson({});
  }

  /// Delete an event destination.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  ///
  /// [configurationSetName]: The name of the configuration set that contains
  /// the event destination that you want to delete.
  ///
  /// [eventDestinationName]: The name of the event destination that you want to
  /// delete.
  Future<DeleteConfigurationSetEventDestinationResponse>
      deleteConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required String eventDestinationName}) async {
    return DeleteConfigurationSetEventDestinationResponse.fromJson({});
  }

  /// Delete a dedicated IP pool.
  ///
  /// [poolName]: The name of the dedicated IP pool that you want to delete.
  Future<DeleteDedicatedIpPoolResponse> deleteDedicatedIpPool(
      String poolName) async {
    return DeleteDedicatedIpPoolResponse.fromJson({});
  }

  /// Deletes an email identity that you previously verified for use with Amazon
  /// Pinpoint. An identity can be either an email address or a domain name.
  ///
  /// [emailIdentity]: The identity (that is, the email address or domain) that
  /// you want to delete from your Amazon Pinpoint account.
  Future<DeleteEmailIdentityResponse> deleteEmailIdentity(
      String emailIdentity) async {
    return DeleteEmailIdentityResponse.fromJson({});
  }

  /// Obtain information about the email-sending status and capabilities of your
  /// Amazon Pinpoint account in the current AWS Region.
  Future<GetAccountResponse> getAccount() async {
    return GetAccountResponse.fromJson({});
  }

  /// Retrieve a list of the blacklists that your dedicated IP addresses appear
  /// on.
  ///
  /// [blacklistItemNames]: A list of IP addresses that you want to retrieve
  /// blacklist information about. You can only specify the dedicated IP
  /// addresses that you use to send email using Amazon Pinpoint or Amazon SES.
  Future<GetBlacklistReportsResponse> getBlacklistReports(
      List<String> blacklistItemNames) async {
    return GetBlacklistReportsResponse.fromJson({});
  }

  /// Get information about an existing configuration set, including the
  /// dedicated IP pool that it's associated with, whether or not it's enabled
  /// for sending email, and more.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// obtain more information about.
  Future<GetConfigurationSetResponse> getConfigurationSet(
      String configurationSetName) async {
    return GetConfigurationSetResponse.fromJson({});
  }

  /// Retrieve a list of event destinations that are associated with a
  /// configuration set.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  ///
  /// [configurationSetName]: The name of the configuration set that contains
  /// the event destination.
  Future<GetConfigurationSetEventDestinationsResponse>
      getConfigurationSetEventDestinations(String configurationSetName) async {
    return GetConfigurationSetEventDestinationsResponse.fromJson({});
  }

  /// Get information about a dedicated IP address, including the name of the
  /// dedicated IP pool that it's associated with, as well information about the
  /// automatic warm-up process for the address.
  ///
  /// [ip]: The IP address that you want to obtain more information about. The
  /// value you specify has to be a dedicated IP address that's assocaited with
  /// your Amazon Pinpoint account.
  Future<GetDedicatedIpResponse> getDedicatedIp(String ip) async {
    return GetDedicatedIpResponse.fromJson({});
  }

  /// List the dedicated IP addresses that are associated with your Amazon
  /// Pinpoint account.
  ///
  /// [poolName]: The name of the IP pool that the dedicated IP address is
  /// associated with.
  ///
  /// [nextToken]: A token returned from a previous call to `GetDedicatedIps` to
  /// indicate the position of the dedicated IP pool in the list of IP pools.
  ///
  /// [pageSize]: The number of results to show in a single call to
  /// `GetDedicatedIpsRequest`. If the number of results is larger than the
  /// number you specified in this parameter, then the response includes a
  /// `NextToken` element, which you can use to obtain additional results.
  Future<GetDedicatedIpsResponse> getDedicatedIps(
      {String poolName, String nextToken, int pageSize}) async {
    return GetDedicatedIpsResponse.fromJson({});
  }

  /// Retrieve information about the status of the Deliverability dashboard for
  /// your Amazon Pinpoint account. When the Deliverability dashboard is
  /// enabled, you gain access to reputation, deliverability, and other metrics
  /// for the domains that you use to send email using Amazon Pinpoint. You also
  /// gain the ability to perform predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon
  /// Pinpoint. For more information about the features and cost of a
  /// Deliverability dashboard subscription, see
  /// [Amazon Pinpoint Pricing](http://aws.amazon.com/pinpoint/pricing/).
  Future<GetDeliverabilityDashboardOptionsResponse>
      getDeliverabilityDashboardOptions() async {
    return GetDeliverabilityDashboardOptionsResponse.fromJson({});
  }

  /// Retrieve the results of a predictive inbox placement test.
  ///
  /// [reportId]: A unique string that identifies the predictive inbox placement
  /// test.
  Future<GetDeliverabilityTestReportResponse> getDeliverabilityTestReport(
      String reportId) async {
    return GetDeliverabilityTestReportResponse.fromJson({});
  }

  /// Retrieve all the deliverability data for a specific campaign. This data is
  /// available for a campaign only if the campaign sent email by using a domain
  /// that the Deliverability dashboard is enabled for
  /// (`PutDeliverabilityDashboardOption` operation).
  ///
  /// [campaignId]: The unique identifier for the campaign. Amazon Pinpoint
  /// automatically generates and assigns this identifier to a campaign. This
  /// value is not the same as the campaign identifier that Amazon Pinpoint
  /// assigns to campaigns that you create and manage by using the Amazon
  /// Pinpoint API or the Amazon Pinpoint console.
  Future<GetDomainDeliverabilityCampaignResponse>
      getDomainDeliverabilityCampaign(String campaignId) async {
    return GetDomainDeliverabilityCampaignResponse.fromJson({});
  }

  /// Retrieve inbox placement and engagement rates for the domains that you use
  /// to send email.
  ///
  /// [domain]: The domain that you want to obtain deliverability metrics for.
  ///
  /// [startDate]: The first day (in Unix time) that you want to obtain domain
  /// deliverability metrics for.
  ///
  /// [endDate]: The last day (in Unix time) that you want to obtain domain
  /// deliverability metrics for. The `EndDate` that you specify has to be less
  /// than or equal to 30 days after the `StartDate`.
  Future<GetDomainStatisticsReportResponse> getDomainStatisticsReport(
      {@required String domain,
      @required DateTime startDate,
      @required DateTime endDate}) async {
    return GetDomainStatisticsReportResponse.fromJson({});
  }

  /// Provides information about a specific identity associated with your Amazon
  /// Pinpoint account, including the identity's verification status, its DKIM
  /// authentication status, and its custom Mail-From settings.
  ///
  /// [emailIdentity]: The email identity that you want to retrieve details for.
  Future<GetEmailIdentityResponse> getEmailIdentity(
      String emailIdentity) async {
    return GetEmailIdentityResponse.fromJson({});
  }

  /// List all of the configuration sets associated with your Amazon Pinpoint
  /// account in the current region.
  ///
  /// In Amazon Pinpoint, _configuration sets_ are groups of rules that you can
  /// apply to the emails you send. You apply a configuration set to an email by
  /// including a reference to the configuration set in the headers of the
  /// email. When you apply a configuration set to an email, all of the rules in
  /// that configuration set are applied to the email.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListConfigurationSets` to indicate the position in the list of
  /// configuration sets.
  ///
  /// [pageSize]: The number of results to show in a single call to
  /// `ListConfigurationSets`. If the number of results is larger than the
  /// number you specified in this parameter, then the response includes a
  /// `NextToken` element, which you can use to obtain additional results.
  Future<ListConfigurationSetsResponse> listConfigurationSets(
      {String nextToken, int pageSize}) async {
    return ListConfigurationSetsResponse.fromJson({});
  }

  /// List all of the dedicated IP pools that exist in your Amazon Pinpoint
  /// account in the current AWS Region.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListDedicatedIpPools` to indicate the position in the list of dedicated
  /// IP pools.
  ///
  /// [pageSize]: The number of results to show in a single call to
  /// `ListDedicatedIpPools`. If the number of results is larger than the number
  /// you specified in this parameter, then the response includes a `NextToken`
  /// element, which you can use to obtain additional results.
  Future<ListDedicatedIpPoolsResponse> listDedicatedIpPools(
      {String nextToken, int pageSize}) async {
    return ListDedicatedIpPoolsResponse.fromJson({});
  }

  /// Show a list of the predictive inbox placement tests that you've performed,
  /// regardless of their statuses. For predictive inbox placement tests that
  /// are complete, you can use the `GetDeliverabilityTestReport` operation to
  /// view the results.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListDeliverabilityTestReports` to indicate the position in the list of
  /// predictive inbox placement tests.
  ///
  /// [pageSize]: The number of results to show in a single call to
  /// `ListDeliverabilityTestReports`. If the number of results is larger than
  /// the number you specified in this parameter, then the response includes a
  /// `NextToken` element, which you can use to obtain additional results.
  ///
  /// The value you specify has to be at least 0, and can be no more than 1000.
  Future<ListDeliverabilityTestReportsResponse> listDeliverabilityTestReports(
      {String nextToken, int pageSize}) async {
    return ListDeliverabilityTestReportsResponse.fromJson({});
  }

  /// Retrieve deliverability data for all the campaigns that used a specific
  /// domain to send email during a specified time range. This data is available
  /// for a domain only if you enabled the Deliverability dashboard
  /// (`PutDeliverabilityDashboardOption` operation) for the domain.
  ///
  /// [startDate]: The first day, in Unix time format, that you want to obtain
  /// deliverability data for.
  ///
  /// [endDate]: The last day, in Unix time format, that you want to obtain
  /// deliverability data for. This value has to be less than or equal to 30
  /// days after the value of the `StartDate` parameter.
  ///
  /// [subscribedDomain]: The domain to obtain deliverability data for.
  ///
  /// [nextToken]: A token that’s returned from a previous call to the
  /// `ListDomainDeliverabilityCampaigns` operation. This token indicates the
  /// position of a campaign in the list of campaigns.
  ///
  /// [pageSize]: The maximum number of results to include in response to a
  /// single call to the `ListDomainDeliverabilityCampaigns` operation. If the
  /// number of results is larger than the number that you specify in this
  /// parameter, the response includes a `NextToken` element, which you can use
  /// to obtain additional results.
  Future<ListDomainDeliverabilityCampaignsResponse>
      listDomainDeliverabilityCampaigns(
          {@required DateTime startDate,
          @required DateTime endDate,
          @required String subscribedDomain,
          String nextToken,
          int pageSize}) async {
    return ListDomainDeliverabilityCampaignsResponse.fromJson({});
  }

  /// Returns a list of all of the email identities that are associated with
  /// your Amazon Pinpoint account. An identity can be either an email address
  /// or a domain. This operation returns identities that are verified as well
  /// as those that aren't.
  ///
  /// [nextToken]: A token returned from a previous call to
  /// `ListEmailIdentities` to indicate the position in the list of identities.
  ///
  /// [pageSize]: The number of results to show in a single call to
  /// `ListEmailIdentities`. If the number of results is larger than the number
  /// you specified in this parameter, then the response includes a `NextToken`
  /// element, which you can use to obtain additional results.
  ///
  /// The value you specify has to be at least 0, and can be no more than 1000.
  Future<ListEmailIdentitiesResponse> listEmailIdentities(
      {String nextToken, int pageSize}) async {
    return ListEmailIdentitiesResponse.fromJson({});
  }

  /// Retrieve a list of the tags (keys and values) that are associated with a
  /// specified resource. A _tag_ is a label that you optionally define and
  /// associate with a resource in Amazon Pinpoint. Each tag consists of a
  /// required _tag key_ and an optional associated _tag value_. A tag key is a
  /// general label that acts as a category for more specific tag values. A tag
  /// value acts as a descriptor within a tag key.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to retrieve tag information for.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Enable or disable the automatic warm-up feature for dedicated IP
  /// addresses.
  ///
  /// [autoWarmupEnabled]: Enables or disables the automatic warm-up feature for
  /// dedicated IP addresses that are associated with your Amazon Pinpoint
  /// account in the current AWS Region. Set to `true` to enable the automatic
  /// warm-up feature, or set to `false` to disable it.
  Future<PutAccountDedicatedIpWarmupAttributesResponse>
      putAccountDedicatedIpWarmupAttributes({bool autoWarmupEnabled}) async {
    return PutAccountDedicatedIpWarmupAttributesResponse.fromJson({});
  }

  /// Enable or disable the ability of your account to send email.
  ///
  /// [sendingEnabled]: Enables or disables your account's ability to send
  /// email. Set to `true` to enable email sending, or set to `false` to disable
  /// email sending.
  ///
  ///
  ///
  /// If AWS paused your account's ability to send email, you can't use this
  /// operation to resume your account's ability to send email.
  Future<PutAccountSendingAttributesResponse> putAccountSendingAttributes(
      {bool sendingEnabled}) async {
    return PutAccountSendingAttributesResponse.fromJson({});
  }

  /// Associate a configuration set with a dedicated IP pool. You can use
  /// dedicated IP pools to create groups of dedicated IP addresses for sending
  /// specific types of email.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// associate with a dedicated IP pool.
  ///
  /// [tlsPolicy]: Whether Amazon Pinpoint should require that incoming email is
  /// delivered over a connection encrypted with Transport Layer Security (TLS).
  ///
  /// [sendingPoolName]: The name of the dedicated IP pool that you want to
  /// associate with the configuration set.
  Future<PutConfigurationSetDeliveryOptionsResponse>
      putConfigurationSetDeliveryOptions(String configurationSetName,
          {String tlsPolicy, String sendingPoolName}) async {
    return PutConfigurationSetDeliveryOptionsResponse.fromJson({});
  }

  /// Enable or disable collection of reputation metrics for emails that you
  /// send using a particular configuration set in a specific AWS Region.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// enable or disable reputation metric tracking for.
  ///
  /// [reputationMetricsEnabled]: If `true`, tracking of reputation metrics is
  /// enabled for the configuration set. If `false`, tracking of reputation
  /// metrics is disabled for the configuration set.
  Future<PutConfigurationSetReputationOptionsResponse>
      putConfigurationSetReputationOptions(String configurationSetName,
          {bool reputationMetricsEnabled}) async {
    return PutConfigurationSetReputationOptionsResponse.fromJson({});
  }

  /// Enable or disable email sending for messages that use a particular
  /// configuration set in a specific AWS Region.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// enable or disable email sending for.
  ///
  /// [sendingEnabled]: If `true`, email sending is enabled for the
  /// configuration set. If `false`, email sending is disabled for the
  /// configuration set.
  Future<PutConfigurationSetSendingOptionsResponse>
      putConfigurationSetSendingOptions(String configurationSetName,
          {bool sendingEnabled}) async {
    return PutConfigurationSetSendingOptionsResponse.fromJson({});
  }

  /// Specify a custom domain to use for open and click tracking elements in
  /// email that you send using Amazon Pinpoint.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// add a custom tracking domain to.
  ///
  /// [customRedirectDomain]: The domain that you want to use to track open and
  /// click events.
  Future<PutConfigurationSetTrackingOptionsResponse>
      putConfigurationSetTrackingOptions(String configurationSetName,
          {String customRedirectDomain}) async {
    return PutConfigurationSetTrackingOptionsResponse.fromJson({});
  }

  /// Move a dedicated IP address to an existing dedicated IP pool.
  ///
  ///
  ///
  /// The dedicated IP address that you specify must already exist, and must be
  /// associated with your Amazon Pinpoint account.
  ///
  /// The dedicated IP pool you specify must already exist. You can create a new
  /// pool by using the `CreateDedicatedIpPool` operation.
  ///
  /// [ip]: The IP address that you want to move to the dedicated IP pool. The
  /// value you specify has to be a dedicated IP address that's associated with
  /// your Amazon Pinpoint account.
  ///
  /// [destinationPoolName]: The name of the IP pool that you want to add the
  /// dedicated IP address to. You have to specify an IP pool that already
  /// exists.
  Future<PutDedicatedIpInPoolResponse> putDedicatedIpInPool(
      {@required String ip, @required String destinationPoolName}) async {
    return PutDedicatedIpInPoolResponse.fromJson({});
  }

  ///
  /// [ip]: The dedicated IP address that you want to update the warm-up
  /// attributes for.
  ///
  /// [warmupPercentage]: The warm-up percentage that you want to associate with
  /// the dedicated IP address.
  Future<PutDedicatedIpWarmupAttributesResponse> putDedicatedIpWarmupAttributes(
      {@required String ip, @required int warmupPercentage}) async {
    return PutDedicatedIpWarmupAttributesResponse.fromJson({});
  }

  /// Enable or disable the Deliverability dashboard for your Amazon Pinpoint
  /// account. When you enable the Deliverability dashboard, you gain access to
  /// reputation, deliverability, and other metrics for the domains that you use
  /// to send email using Amazon Pinpoint. You also gain the ability to perform
  /// predictive inbox placement tests.
  ///
  /// When you use the Deliverability dashboard, you pay a monthly subscription
  /// charge, in addition to any other fees that you accrue by using Amazon
  /// Pinpoint. For more information about the features and cost of a
  /// Deliverability dashboard subscription, see
  /// [Amazon Pinpoint Pricing](http://aws.amazon.com/pinpoint/pricing/).
  ///
  /// [dashboardEnabled]: Specifies whether to enable the Deliverability
  /// dashboard for your Amazon Pinpoint account. To enable the dashboard, set
  /// this value to `true`.
  ///
  /// [subscribedDomains]: An array of objects, one for each verified domain
  /// that you use to send email and enabled the Deliverability dashboard for.
  Future<PutDeliverabilityDashboardOptionResponse>
      putDeliverabilityDashboardOption(bool dashboardEnabled,
          {List<DomainDeliverabilityTrackingOption> subscribedDomains}) async {
    return PutDeliverabilityDashboardOptionResponse.fromJson({});
  }

  /// Used to enable or disable DKIM authentication for an email identity.
  ///
  /// [emailIdentity]: The email identity that you want to change the DKIM
  /// settings for.
  ///
  /// [signingEnabled]: Sets the DKIM signing configuration for the identity.
  ///
  /// When you set this value `true`, then the messages that Amazon Pinpoint
  /// sends from the identity are DKIM-signed. When you set this value to
  /// `false`, then the messages that Amazon Pinpoint sends from the identity
  /// aren't DKIM-signed.
  Future<PutEmailIdentityDkimAttributesResponse> putEmailIdentityDkimAttributes(
      String emailIdentity,
      {bool signingEnabled}) async {
    return PutEmailIdentityDkimAttributesResponse.fromJson({});
  }

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
  ///
  /// [emailIdentity]: The email identity that you want to configure bounce and
  /// complaint feedback forwarding for.
  ///
  /// [emailForwardingEnabled]: Sets the feedback forwarding configuration for
  /// the identity.
  ///
  /// If the value is `true`, Amazon Pinpoint sends you email notifications when
  /// bounce or complaint events occur. Amazon Pinpoint sends this notification
  /// to the address that you specified in the Return-Path header of the
  /// original email.
  ///
  /// When you set this value to `false`, Amazon Pinpoint sends notifications
  /// through other mechanisms, such as by notifying an Amazon SNS topic or
  /// another event destination. You're required to have a method of tracking
  /// bounces and complaints. If you haven't set up another mechanism for
  /// receiving bounce or complaint notifications, Amazon Pinpoint sends an
  /// email notification when these events occur (even if this setting is
  /// disabled).
  Future<PutEmailIdentityFeedbackAttributesResponse>
      putEmailIdentityFeedbackAttributes(String emailIdentity,
          {bool emailForwardingEnabled}) async {
    return PutEmailIdentityFeedbackAttributesResponse.fromJson({});
  }

  /// Used to enable or disable the custom Mail-From domain configuration for an
  /// email identity.
  ///
  /// [emailIdentity]: The verified email identity that you want to set up the
  /// custom MAIL FROM domain for.
  ///
  /// [mailFromDomain]:  The custom MAIL FROM domain that you want the verified
  /// identity to use. The MAIL FROM domain must meet the following criteria:
  ///
  /// *   It has to be a subdomain of the verified identity.
  ///
  /// *   It can't be used to receive email.
  ///
  /// *   It can't be used in a "From" address if the MAIL FROM domain is a
  /// destination for feedback forwarding emails.
  ///
  /// [behaviorOnMxFailure]: The action that you want Amazon Pinpoint to take if
  /// it can't read the required MX record when you send an email. When you set
  /// this value to `UseDefaultValue`, Amazon Pinpoint uses _amazonses.com_ as
  /// the MAIL FROM domain. When you set this value to `RejectMessage`, Amazon
  /// Pinpoint returns a `MailFromDomainNotVerified` error, and doesn't attempt
  /// to deliver the email.
  ///
  /// These behaviors are taken when the custom MAIL FROM domain configuration
  /// is in the `Pending`, `Failed`, and `TemporaryFailure` states.
  Future<PutEmailIdentityMailFromAttributesResponse>
      putEmailIdentityMailFromAttributes(String emailIdentity,
          {String mailFromDomain, String behaviorOnMxFailure}) async {
    return PutEmailIdentityMailFromAttributesResponse.fromJson({});
  }

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
  ///
  /// [fromEmailAddress]: The email address that you want to use as the "From"
  /// address for the email. The address that you specify has to be verified.
  ///
  /// [destination]: An object that contains the recipients of the email
  /// message.
  ///
  /// [replyToAddresses]: The "Reply-to" email addresses for the message. When
  /// the recipient replies to the message, each Reply-to address receives the
  /// reply.
  ///
  /// [feedbackForwardingEmailAddress]: The address that Amazon Pinpoint should
  /// send bounce and complaint notifications to.
  ///
  /// [content]: An object that contains the body of the message. You can send
  /// either a Simple message or a Raw message.
  ///
  /// [emailTags]: A list of tags, in the form of name/value pairs, to apply to
  /// an email that you send using the `SendEmail` operation. Tags correspond to
  /// characteristics of the email that you define, so that you can publish
  /// email sending events.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// use when sending the email.
  Future<SendEmailResponse> sendEmail(
      {String fromEmailAddress,
      @required Destination destination,
      List<String> replyToAddresses,
      String feedbackForwardingEmailAddress,
      @required EmailContent content,
      List<MessageTag> emailTags,
      String configurationSetName}) async {
    return SendEmailResponse.fromJson({});
  }

  /// Add one or more tags (keys and values) to a specified resource. A _tag_ is
  /// a label that you optionally define and associate with a resource in Amazon
  /// Pinpoint. Tags can help you categorize and manage resources in different
  /// ways, such as by purpose, owner, environment, or other criteria. A
  /// resource can have as many as 50 tags.
  ///
  /// Each tag consists of a required _tag key_ and an associated _tag value_,
  /// both of which you define. A tag key is a general label that acts as a
  /// category for more specific tag values. A tag value acts as a descriptor
  /// within a tag key.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to add one or more tags to.
  ///
  /// [tags]: A list of the tags that you want to add to the resource. A tag
  /// consists of a required tag key (`Key`) and an associated tag value
  /// (`Value`). The maximum length of a tag key is 128 characters. The maximum
  /// length of a tag value is 256 characters.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Remove one or more tags (keys and values) from a specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to remove one or more tags from.
  ///
  /// [tagKeys]: The tags (tag keys) that you want to remove from the resource.
  /// When you specify a tag key, the action removes both that key and its
  /// associated tag value.
  ///
  /// To remove more than one tag from the resource, append the `TagKeys`
  /// parameter and argument for each additional tag to remove, separated by an
  /// ampersand. For example:
  /// `/v1/email/tags?ResourceArn=ResourceArn&TagKeys=Key1&TagKeys=Key2`
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Update the configuration of an event destination for a configuration set.
  ///
  /// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
  /// clicks, bounces, and complaints. _Event destinations_ are places that you
  /// can send information about these events to. For example, you can send
  /// event data to Amazon SNS to receive notifications when you receive bounces
  /// or complaints, or you can use Amazon Kinesis Data Firehose to stream data
  /// to Amazon S3 for long-term storage.
  ///
  /// [configurationSetName]: The name of the configuration set that contains
  /// the event destination that you want to modify.
  ///
  /// [eventDestinationName]: The name of the event destination that you want to
  /// modify.
  ///
  /// [eventDestination]: An object that defines the event destination.
  Future<UpdateConfigurationSetEventDestinationResponse>
      updateConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required String eventDestinationName,
          @required EventDestinationDefinition eventDestination}) async {
    return UpdateConfigurationSetEventDestinationResponse.fromJson({});
  }
}

/// An object that contains information about a blacklisting event that impacts
/// one of the dedicated IP addresses that is associated with your account.
class BlacklistEntry {
  /// The name of the blacklist that the IP address appears on.
  final String rblName;

  /// The time when the blacklisting event occurred, shown in Unix time format.
  final DateTime listingTime;

  /// Additional information about the blacklisting event, as provided by the
  /// blacklist maintainer.
  final String description;

  BlacklistEntry({
    this.rblName,
    this.listingTime,
    this.description,
  });
  static BlacklistEntry fromJson(Map<String, dynamic> json) => BlacklistEntry();
}

/// Represents the body of the email message.
class Body {
  /// An object that represents the version of the message that is displayed in
  /// email clients that don't support HTML, or clients where the recipient has
  /// disabled HTML rendering.
  final Content text;

  /// An object that represents the version of the message that is displayed in
  /// email clients that support HTML. HTML messages can include formatted text,
  /// hyperlinks, images, and more.
  final Content html;

  Body({
    this.text,
    this.html,
  });
}

/// An object that defines an Amazon CloudWatch destination for email events.
/// You can use Amazon CloudWatch to monitor and gain insights on your email
/// sending metrics.
class CloudWatchDestination {
  /// An array of objects that define the dimensions to use when you send email
  /// events to Amazon CloudWatch.
  final List<CloudWatchDimensionConfiguration> dimensionConfigurations;

  CloudWatchDestination({
    @required this.dimensionConfigurations,
  });
  static CloudWatchDestination fromJson(Map<String, dynamic> json) =>
      CloudWatchDestination();
}

/// An object that defines the dimension configuration to use when you send
/// Amazon Pinpoint email events to Amazon CloudWatch.
class CloudWatchDimensionConfiguration {
  /// The name of an Amazon CloudWatch dimension associated with an email
  /// sending metric. The name has to meet the following criteria:
  ///
  /// *   It can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   It can contain no more than 256 characters.
  final String dimensionName;

  /// The location where Amazon Pinpoint finds the value of a dimension to
  /// publish to Amazon CloudWatch. If you want Amazon Pinpoint to use the
  /// message tags that you specify using an X-SES-MESSAGE-TAGS header or a
  /// parameter to the SendEmail/SendRawEmail API, choose `messageTag`. If you
  /// want Amazon Pinpoint to use your own email headers, choose `emailHeader`.
  /// If you want Amazon Pinpoint to use link tags, choose `linkTags`.
  final String dimensionValueSource;

  /// The default value of the dimension that is published to Amazon CloudWatch
  /// if you don't provide the value of the dimension when you send an email.
  /// This value has to meet the following criteria:
  ///
  /// *   It can only contain ASCII letters (a-z, A-Z), numbers (0-9),
  /// underscores (_), or dashes (-).
  ///
  /// *   It can contain no more than 256 characters.
  final String defaultDimensionValue;

  CloudWatchDimensionConfiguration({
    @required this.dimensionName,
    @required this.dimensionValueSource,
    @required this.defaultDimensionValue,
  });
  static CloudWatchDimensionConfiguration fromJson(Map<String, dynamic> json) =>
      CloudWatchDimensionConfiguration();
}

/// An object that represents the content of the email, and optionally a
/// character set specification.
class Content {
  /// The content of the message itself.
  final String data;

  /// The character set for the content. Because of the constraints of the SMTP
  /// protocol, Amazon Pinpoint uses 7-bit ASCII by default. If the text
  /// includes characters outside of the ASCII range, you have to specify a
  /// character set. For example, you could specify `UTF-8`, `ISO-8859-1`, or
  /// `Shift_JIS`.
  final String charset;

  Content({
    @required this.data,
    this.charset,
  });
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  static CreateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConfigurationSetEventDestinationResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  static CreateConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      CreateConfigurationSetResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class CreateDedicatedIpPoolResponse {
  CreateDedicatedIpPoolResponse();
  static CreateDedicatedIpPoolResponse fromJson(Map<String, dynamic> json) =>
      CreateDedicatedIpPoolResponse();
}

/// Information about the predictive inbox placement test that you created.
class CreateDeliverabilityTestReportResponse {
  /// A unique string that identifies the predictive inbox placement test.
  final String reportId;

  /// The status of the predictive inbox placement test. If the status is
  /// `IN_PROGRESS`, then the predictive inbox placement test is currently
  /// running. Predictive inbox placement tests are usually complete within 24
  /// hours of creating the test. If the status is `COMPLETE`, then the test is
  /// finished, and you can use the `GetDeliverabilityTestReport` to view the
  /// results of the test.
  final String deliverabilityTestStatus;

  CreateDeliverabilityTestReportResponse({
    @required this.reportId,
    @required this.deliverabilityTestStatus,
  });
  static CreateDeliverabilityTestReportResponse fromJson(
          Map<String, dynamic> json) =>
      CreateDeliverabilityTestReportResponse();
}

/// If the email identity is a domain, this object contains tokens that you can
/// use to create a set of CNAME records. To sucessfully verify your domain, you
/// have to add these records to the DNS configuration for your domain.
///
/// If the email identity is an email address, this object is empty.
class CreateEmailIdentityResponse {
  /// The email identity type.
  final String identityType;

  /// Specifies whether or not the identity is verified. In Amazon Pinpoint, you
  /// can only send email from verified email addresses or domains. For more
  /// information about verifying identities, see the
  /// [Amazon Pinpoint User Guide](https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html).
  final bool verifiedForSendingStatus;

  /// An object that contains information about the DKIM attributes for the
  /// identity. This object includes the tokens that you use to create the CNAME
  /// records that are required to complete the DKIM verification process.
  final DkimAttributes dkimAttributes;

  CreateEmailIdentityResponse({
    this.identityType,
    this.verifiedForSendingStatus,
    this.dkimAttributes,
  });
  static CreateEmailIdentityResponse fromJson(Map<String, dynamic> json) =>
      CreateEmailIdentityResponse();
}

/// An object that contains information about the volume of email sent on each
/// day of the analysis period.
class DailyVolume {
  /// The date that the DailyVolume metrics apply to, in Unix time.
  final DateTime startDate;

  /// An object that contains inbox placement metrics for a specific day in the
  /// analysis period.
  final VolumeStatistics volumeStatistics;

  /// An object that contains inbox placement metrics for a specified day in the
  /// analysis period, broken out by the recipient's email provider.
  final List<DomainIspPlacement> domainIspPlacements;

  DailyVolume({
    this.startDate,
    this.volumeStatistics,
    this.domainIspPlacements,
  });
  static DailyVolume fromJson(Map<String, dynamic> json) => DailyVolume();
}

/// Contains information about a dedicated IP address that is associated with
/// your Amazon Pinpoint account.
class DedicatedIp {
  /// An IP address that is reserved for use by your Amazon Pinpoint account.
  final String ip;

  /// The warm-up status of a dedicated IP address. The status can have one of
  /// the following values:
  ///
  /// *    `IN_PROGRESS` – The IP address isn't ready to use because the
  /// dedicated IP warm-up process is ongoing.
  ///
  /// *    `DONE` – The dedicated IP warm-up process is complete, and the IP
  /// address is ready to use.
  final String warmupStatus;

  /// Indicates how complete the dedicated IP warm-up process is. When this
  /// value equals 1, the address has completed the warm-up process and is ready
  /// for use.
  final int warmupPercentage;

  /// The name of the dedicated IP pool that the IP address is associated with.
  final String poolName;

  DedicatedIp({
    @required this.ip,
    @required this.warmupStatus,
    @required this.warmupPercentage,
    this.poolName,
  });
  static DedicatedIp fromJson(Map<String, dynamic> json) => DedicatedIp();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  static DeleteConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteConfigurationSetEventDestinationResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  static DeleteConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteConfigurationSetResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteDedicatedIpPoolResponse {
  DeleteDedicatedIpPoolResponse();
  static DeleteDedicatedIpPoolResponse fromJson(Map<String, dynamic> json) =>
      DeleteDedicatedIpPoolResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class DeleteEmailIdentityResponse {
  DeleteEmailIdentityResponse();
  static DeleteEmailIdentityResponse fromJson(Map<String, dynamic> json) =>
      DeleteEmailIdentityResponse();
}

/// An object that contains metadata related to a predictive inbox placement
/// test.
class DeliverabilityTestReport {
  /// A unique string that identifies the predictive inbox placement test.
  final String reportId;

  /// A name that helps you identify a predictive inbox placement test report.
  final String reportName;

  /// The subject line for an email that you submitted in a predictive inbox
  /// placement test.
  final String subject;

  /// The sender address that you specified for the predictive inbox placement
  /// test.
  final String fromEmailAddress;

  /// The date and time when the predictive inbox placement test was created, in
  /// Unix time format.
  final DateTime createDate;

  /// The status of the predictive inbox placement test. If the status is
  /// `IN_PROGRESS`, then the predictive inbox placement test is currently
  /// running. Predictive inbox placement tests are usually complete within 24
  /// hours of creating the test. If the status is `COMPLETE`, then the test is
  /// finished, and you can use the `GetDeliverabilityTestReport` to view the
  /// results of the test.
  final String deliverabilityTestStatus;

  DeliverabilityTestReport({
    this.reportId,
    this.reportName,
    this.subject,
    this.fromEmailAddress,
    this.createDate,
    this.deliverabilityTestStatus,
  });
  static DeliverabilityTestReport fromJson(Map<String, dynamic> json) =>
      DeliverabilityTestReport();
}

/// Used to associate a configuration set with a dedicated IP pool.
class DeliveryOptions {
  /// Specifies whether Amazon Pinpoint should require that incoming email is
  /// delivered over a connection that’s encrypted by using Transport Layer
  /// Security (TLS). If this value is set to `Require`, Amazon Pinpoint will
  /// bounce email messages that cannot be delivered over TLS. The default value
  /// is `Optional`.
  final String tlsPolicy;

  /// The name of the dedicated IP pool that you want to associate with the
  /// configuration set.
  final String sendingPoolName;

  DeliveryOptions({
    this.tlsPolicy,
    this.sendingPoolName,
  });
  static DeliveryOptions fromJson(Map<String, dynamic> json) =>
      DeliveryOptions();
}

/// An object that describes the recipients for an email.
class Destination {
  /// An array that contains the email addresses of the "To" recipients for the
  /// email.
  final List<String> toAddresses;

  /// An array that contains the email addresses of the "CC" (carbon copy)
  /// recipients for the email.
  final List<String> ccAddresses;

  /// An array that contains the email addresses of the "BCC" (blind carbon
  /// copy) recipients for the email.
  final List<String> bccAddresses;

  Destination({
    this.toAddresses,
    this.ccAddresses,
    this.bccAddresses,
  });
}

/// An object that contains information about the DKIM configuration for an
/// email identity.
class DkimAttributes {
  /// If the value is `true`, then the messages that Amazon Pinpoint sends from
  /// the identity are DKIM-signed. If the value is `false`, then the messages
  /// that Amazon Pinpoint sends from the identity aren't DKIM-signed.
  final bool signingEnabled;

  /// Describes whether or not Amazon Pinpoint has successfully located the DKIM
  /// records in the DNS records for the domain. The status can be one of the
  /// following:
  ///
  /// *    `PENDING` – Amazon Pinpoint hasn't yet located the DKIM records in
  /// the DNS configuration for the domain, but will continue to attempt to
  /// locate them.
  ///
  /// *    `SUCCESS` – Amazon Pinpoint located the DKIM records in the DNS
  /// configuration for the domain and determined that they're correct. Amazon
  /// Pinpoint can now send DKIM-signed email from the identity.
  ///
  /// *    `FAILED` – Amazon Pinpoint was unable to locate the DKIM records in
  /// the DNS settings for the domain, and won't continue to search for them.
  ///
  /// *    `TEMPORARY_FAILURE` – A temporary issue occurred, which prevented
  /// Amazon Pinpoint from determining the DKIM status for the domain.
  ///
  /// *    `NOT_STARTED` – Amazon Pinpoint hasn't yet started searching for the
  /// DKIM records in the DKIM records for the domain.
  final String status;

  /// A set of unique strings that you use to create a set of CNAME records that
  /// you add to the DNS configuration for your domain. When Amazon Pinpoint
  /// detects these records in the DNS configuration for your domain, the DKIM
  /// authentication process is complete. Amazon Pinpoint usually detects these
  /// records within about 72 hours of adding them to the DNS configuration for
  /// your domain.
  final List<String> tokens;

  DkimAttributes({
    this.signingEnabled,
    this.status,
    this.tokens,
  });
  static DkimAttributes fromJson(Map<String, dynamic> json) => DkimAttributes();
}

/// An object that contains the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for
/// (`PutDeliverabilityDashboardOption` operation).
class DomainDeliverabilityCampaign {
  /// The unique identifier for the campaign. Amazon Pinpoint automatically
  /// generates and assigns this identifier to a campaign. This value is not the
  /// same as the campaign identifier that Amazon Pinpoint assigns to campaigns
  /// that you create and manage by using the Amazon Pinpoint API or the Amazon
  /// Pinpoint console.
  final String campaignId;

  /// The URL of an image that contains a snapshot of the email message that was
  /// sent.
  final String imageUrl;

  /// The subject line, or title, of the email message.
  final String subject;

  /// The verified email address that the email message was sent from.
  final String fromAddress;

  /// The IP addresses that were used to send the email message.
  final List<String> sendingIps;

  /// The first time, in Unix time format, when the email message was delivered
  /// to any recipient's inbox. This value can help you determine how long it
  /// took for a campaign to deliver an email message.
  final DateTime firstSeenDateTime;

  /// The last time, in Unix time format, when the email message was delivered
  /// to any recipient's inbox. This value can help you determine how long it
  /// took for a campaign to deliver an email message.
  final DateTime lastSeenDateTime;

  /// The number of email messages that were delivered to recipients’ inboxes.
  final BigInt inboxCount;

  /// The number of email messages that were delivered to recipients' spam or
  /// junk mail folders.
  final BigInt spamCount;

  /// The percentage of email messages that were opened by recipients. Due to
  /// technical limitations, this value only includes recipients who opened the
  /// message by using an email client that supports images.
  final double readRate;

  /// The percentage of email messages that were deleted by recipients, without
  /// being opened first. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  final double deleteRate;

  /// The percentage of email messages that were opened and then deleted by
  /// recipients. Due to technical limitations, this value only includes
  /// recipients who opened the message by using an email client that supports
  /// images.
  final double readDeleteRate;

  /// The projected number of recipients that the email message was sent to.
  final BigInt projectedVolume;

  /// The major email providers who handled the email message.
  final List<String> esps;

  DomainDeliverabilityCampaign({
    this.campaignId,
    this.imageUrl,
    this.subject,
    this.fromAddress,
    this.sendingIps,
    this.firstSeenDateTime,
    this.lastSeenDateTime,
    this.inboxCount,
    this.spamCount,
    this.readRate,
    this.deleteRate,
    this.readDeleteRate,
    this.projectedVolume,
    this.esps,
  });
  static DomainDeliverabilityCampaign fromJson(Map<String, dynamic> json) =>
      DomainDeliverabilityCampaign();
}

/// An object that contains information about the Deliverability dashboard
/// subscription for a verified domain that you use to send email and currently
/// has an active Deliverability dashboard subscription. If a Deliverability
/// dashboard subscription is active for a domain, you gain access to
/// reputation, inbox placement, and other metrics for the domain.
class DomainDeliverabilityTrackingOption {
  /// A verified domain that’s associated with your AWS account and currently
  /// has an active Deliverability dashboard subscription.
  final String domain;

  /// The date, in Unix time format, when you enabled the Deliverability
  /// dashboard for the domain.
  final DateTime subscriptionStartDate;

  /// An object that contains information about the inbox placement data
  /// settings for the domain.
  final InboxPlacementTrackingOption inboxPlacementTrackingOption;

  DomainDeliverabilityTrackingOption({
    this.domain,
    this.subscriptionStartDate,
    this.inboxPlacementTrackingOption,
  });
  static DomainDeliverabilityTrackingOption fromJson(
          Map<String, dynamic> json) =>
      DomainDeliverabilityTrackingOption();
}

/// An object that contains inbox placement data for email sent from one of your
/// email domains to a specific email provider.
class DomainIspPlacement {
  /// The name of the email provider that the inbox placement data applies to.
  final String ispName;

  /// The total number of messages that were sent from the selected domain to
  /// the specified email provider that arrived in recipients' inboxes.
  final BigInt inboxRawCount;

  /// The total number of messages that were sent from the selected domain to
  /// the specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  final BigInt spamRawCount;

  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' inboxes.
  final double inboxPercentage;

  /// The percentage of messages that were sent from the selected domain to the
  /// specified email provider that arrived in recipients' spam or junk mail
  /// folders.
  final double spamPercentage;

  DomainIspPlacement({
    this.ispName,
    this.inboxRawCount,
    this.spamRawCount,
    this.inboxPercentage,
    this.spamPercentage,
  });
  static DomainIspPlacement fromJson(Map<String, dynamic> json) =>
      DomainIspPlacement();
}

/// An object that defines the entire content of the email, including the
/// message headers and the body content. You can create a simple email message,
/// in which you specify the subject and the text and HTML versions of the
/// message body. You can also create raw messages, in which you specify a
/// complete MIME-formatted message. Raw messages can include attachments and
/// custom headers.
class EmailContent {
  /// The simple email message. The message consists of a subject and a message
  /// body.
  final Message simple;

  /// The raw email message. The message has to meet the following criteria:
  ///
  /// *   The message has to contain a header and a body, separated by one blank
  /// line.
  ///
  /// *   All of the required header fields must be present in the message.
  ///
  /// *   Each part of a multipart MIME message must be formatted properly.
  ///
  /// *   If you include attachments, they must be in a file format that Amazon
  /// Pinpoint supports.
  ///
  /// *   The entire message must be Base64 encoded.
  ///
  /// *   If any of the MIME parts in your message contain content that is
  /// outside of the 7-bit ASCII character range, you should encode that content
  /// to ensure that recipients' email clients render the message properly.
  ///
  /// *   The length of any single line of text in the message can't exceed
  /// 1,000 characters. This restriction is defined in
  /// [RFC 5321](https://tools.ietf.org/html/rfc5321).
  final RawMessage raw;

  EmailContent({
    this.simple,
    this.raw,
  });
}

/// In Amazon Pinpoint, _events_ include message sends, deliveries, opens,
/// clicks, bounces, and complaints. _Event destinations_ are places that you
/// can send information about these events to. For example, you can send event
/// data to Amazon SNS to receive notifications when you receive bounces or
/// complaints, or you can use Amazon Kinesis Data Firehose to stream data to
/// Amazon S3 for long-term storage.
class EventDestination {
  /// A name that identifies the event destination.
  final String name;

  /// If `true`, the event destination is enabled. When the event destination is
  /// enabled, the specified event types are sent to the destinations in this
  /// `EventDestinationDefinition`.
  ///
  /// If `false`, the event destination is disabled. When the event destination
  /// is disabled, events aren't sent to the specified destinations.
  final bool enabled;

  /// The types of events that Amazon Pinpoint sends to the specified event
  /// destinations.
  final List<String> matchingEventTypes;

  /// An object that defines an Amazon Kinesis Data Firehose destination for
  /// email events. You can use Amazon Kinesis Data Firehose to stream data to
  /// other services, such as Amazon S3 and Amazon Redshift.
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  final CloudWatchDestination cloudWatchDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  final SnsDestination snsDestination;

  /// An object that defines a Amazon Pinpoint destination for email events. You
  /// can use Amazon Pinpoint events to create attributes in Amazon Pinpoint
  /// projects. You can use these attributes to create segments for your
  /// campaigns.
  final PinpointDestination pinpointDestination;

  EventDestination({
    @required this.name,
    this.enabled,
    @required this.matchingEventTypes,
    this.kinesisFirehoseDestination,
    this.cloudWatchDestination,
    this.snsDestination,
    this.pinpointDestination,
  });
  static EventDestination fromJson(Map<String, dynamic> json) =>
      EventDestination();
}

/// An object that defines the event destination. Specifically, it defines which
/// services receive events from emails sent using the configuration set that
/// the event destination is associated with. Also defines the types of events
/// that are sent to the event destination.
class EventDestinationDefinition {
  /// If `true`, the event destination is enabled. When the event destination is
  /// enabled, the specified event types are sent to the destinations in this
  /// `EventDestinationDefinition`.
  ///
  /// If `false`, the event destination is disabled. When the event destination
  /// is disabled, events aren't sent to the specified destinations.
  final bool enabled;

  /// An array that specifies which events Amazon Pinpoint should send to the
  /// destinations in this `EventDestinationDefinition`.
  final List<String> matchingEventTypes;

  /// An object that defines an Amazon Kinesis Data Firehose destination for
  /// email events. You can use Amazon Kinesis Data Firehose to stream data to
  /// other services, such as Amazon S3 and Amazon Redshift.
  final KinesisFirehoseDestination kinesisFirehoseDestination;

  /// An object that defines an Amazon CloudWatch destination for email events.
  /// You can use Amazon CloudWatch to monitor and gain insights on your email
  /// sending metrics.
  final CloudWatchDestination cloudWatchDestination;

  /// An object that defines an Amazon SNS destination for email events. You can
  /// use Amazon SNS to send notification when certain email events occur.
  final SnsDestination snsDestination;

  /// An object that defines a Amazon Pinpoint destination for email events. You
  /// can use Amazon Pinpoint events to create attributes in Amazon Pinpoint
  /// projects. You can use these attributes to create segments for your
  /// campaigns.
  final PinpointDestination pinpointDestination;

  EventDestinationDefinition({
    this.enabled,
    this.matchingEventTypes,
    this.kinesisFirehoseDestination,
    this.cloudWatchDestination,
    this.snsDestination,
    this.pinpointDestination,
  });
}

/// A list of details about the email-sending capabilities of your Amazon
/// Pinpoint account in the current AWS Region.
class GetAccountResponse {
  /// An object that contains information about the per-day and per-second
  /// sending limits for your Amazon Pinpoint account in the current AWS Region.
  final SendQuota sendQuota;

  /// Indicates whether or not email sending is enabled for your Amazon Pinpoint
  /// account in the current AWS Region.
  final bool sendingEnabled;

  /// Indicates whether or not the automatic warm-up feature is enabled for
  /// dedicated IP addresses that are associated with your account.
  final bool dedicatedIpAutoWarmupEnabled;

  /// The reputation status of your Amazon Pinpoint account. The status can be
  /// one of the following:
  ///
  /// *    `HEALTHY` – There are no reputation-related issues that currently
  /// impact your account.
  ///
  /// *    `PROBATION` – We've identified some issues with your Amazon Pinpoint
  /// account. We're placing your account under review while you work on
  /// correcting these issues.
  ///
  /// *    `SHUTDOWN` – Your account's ability to send email is currently paused
  /// because of an issue with the email sent from your account. When you
  /// correct the issue, you can contact us and request that your account's
  /// ability to send email is resumed.
  final String enforcementStatus;

  /// Indicates whether or not your account has production access in the current
  /// AWS Region.
  ///
  /// If the value is `false`, then your account is in the _sandbox_. When your
  /// account is in the sandbox, you can only send email to verified identities.
  /// Additionally, the maximum number of emails you can send in a 24-hour
  /// period (your sending quota) is 200, and the maximum number of emails you
  /// can send per second (your maximum sending rate) is 1.
  ///
  /// If the value is `true`, then your account has production access. When your
  /// account has production access, you can send email to any address. The
  /// sending quota and maximum sending rate for your account vary based on your
  /// specific use case.
  final bool productionAccessEnabled;

  GetAccountResponse({
    this.sendQuota,
    this.sendingEnabled,
    this.dedicatedIpAutoWarmupEnabled,
    this.enforcementStatus,
    this.productionAccessEnabled,
  });
  static GetAccountResponse fromJson(Map<String, dynamic> json) =>
      GetAccountResponse();
}

/// An object that contains information about blacklist events.
class GetBlacklistReportsResponse {
  /// An object that contains information about a blacklist that one of your
  /// dedicated IP addresses appears on.
  final Map<String, List<BlacklistEntry>> blacklistReport;

  GetBlacklistReportsResponse({
    @required this.blacklistReport,
  });
  static GetBlacklistReportsResponse fromJson(Map<String, dynamic> json) =>
      GetBlacklistReportsResponse();
}

/// Information about an event destination for a configuration set.
class GetConfigurationSetEventDestinationsResponse {
  /// An array that includes all of the events destinations that have been
  /// configured for the configuration set.
  final List<EventDestination> eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });
  static GetConfigurationSetEventDestinationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetConfigurationSetEventDestinationsResponse();
}

/// Information about a configuration set.
class GetConfigurationSetResponse {
  /// The name of the configuration set.
  final String configurationSetName;

  /// An object that defines the open and click tracking options for emails that
  /// you send using the configuration set.
  final TrackingOptions trackingOptions;

  /// An object that defines the dedicated IP pool that is used to send emails
  /// that you send using the configuration set.
  final DeliveryOptions deliveryOptions;

  /// An object that defines whether or not Amazon Pinpoint collects reputation
  /// metrics for the emails that you send that use the configuration set.
  final ReputationOptions reputationOptions;

  /// An object that defines whether or not Amazon Pinpoint can send email that
  /// you send using the configuration set.
  final SendingOptions sendingOptions;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the configuration set.
  final List<Tag> tags;

  GetConfigurationSetResponse({
    this.configurationSetName,
    this.trackingOptions,
    this.deliveryOptions,
    this.reputationOptions,
    this.sendingOptions,
    this.tags,
  });
  static GetConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      GetConfigurationSetResponse();
}

/// Information about a dedicated IP address.
class GetDedicatedIpResponse {
  /// An object that contains information about a dedicated IP address.
  final DedicatedIp dedicatedIp;

  GetDedicatedIpResponse({
    this.dedicatedIp,
  });
  static GetDedicatedIpResponse fromJson(Map<String, dynamic> json) =>
      GetDedicatedIpResponse();
}

/// Information about the dedicated IP addresses that are associated with your
/// Amazon Pinpoint account.
class GetDedicatedIpsResponse {
  /// A list of dedicated IP addresses that are reserved for use by your Amazon
  /// Pinpoint account.
  final List<DedicatedIp> dedicatedIps;

  /// A token that indicates that there are additional dedicated IP addresses to
  /// list. To view additional addresses, issue another request to
  /// `GetDedicatedIps`, passing this token in the `NextToken` parameter.
  final String nextToken;

  GetDedicatedIpsResponse({
    this.dedicatedIps,
    this.nextToken,
  });
  static GetDedicatedIpsResponse fromJson(Map<String, dynamic> json) =>
      GetDedicatedIpsResponse();
}

/// An object that shows the status of the Deliverability dashboard for your
/// Amazon Pinpoint account.
class GetDeliverabilityDashboardOptionsResponse {
  /// Specifies whether the Deliverability dashboard is enabled for your Amazon
  /// Pinpoint account. If this value is `true`, the dashboard is enabled.
  final bool dashboardEnabled;

  /// The date, in Unix time format, when your current subscription to the
  /// Deliverability dashboard is scheduled to expire, if your subscription is
  /// scheduled to expire at the end of the current calendar month. This value
  /// is null if you have an active subscription that isn’t due to expire at the
  /// end of the month.
  final DateTime subscriptionExpiryDate;

  /// The current status of your Deliverability dashboard subscription. If this
  /// value is `PENDING_EXPIRATION`, your subscription is scheduled to expire at
  /// the end of the current calendar month.
  final String accountStatus;

  /// An array of objects, one for each verified domain that you use to send
  /// email and currently has an active Deliverability dashboard subscription
  /// that isn’t scheduled to expire at the end of the current calendar month.
  final List<DomainDeliverabilityTrackingOption> activeSubscribedDomains;

  /// An array of objects, one for each verified domain that you use to send
  /// email and currently has an active Deliverability dashboard subscription
  /// that's scheduled to expire at the end of the current calendar month.
  final List<DomainDeliverabilityTrackingOption>
      pendingExpirationSubscribedDomains;

  GetDeliverabilityDashboardOptionsResponse({
    @required this.dashboardEnabled,
    this.subscriptionExpiryDate,
    this.accountStatus,
    this.activeSubscribedDomains,
    this.pendingExpirationSubscribedDomains,
  });
  static GetDeliverabilityDashboardOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      GetDeliverabilityDashboardOptionsResponse();
}

/// The results of the predictive inbox placement test.
class GetDeliverabilityTestReportResponse {
  /// An object that contains the results of the predictive inbox placement
  /// test.
  final DeliverabilityTestReport deliverabilityTestReport;

  /// An object that specifies how many test messages that were sent during the
  /// predictive inbox placement test were delivered to recipients' inboxes, how
  /// many were sent to recipients' spam folders, and how many weren't
  /// delivered.
  final PlacementStatistics overallPlacement;

  /// An object that describes how the test email was handled by several email
  /// providers, including Gmail, Hotmail, Yahoo, AOL, and others.
  final List<IspPlacement> ispPlacements;

  /// An object that contains the message that you sent when you performed this
  /// predictive inbox placement test.
  final String message;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the predictive inbox placement test.
  final List<Tag> tags;

  GetDeliverabilityTestReportResponse({
    @required this.deliverabilityTestReport,
    @required this.overallPlacement,
    @required this.ispPlacements,
    this.message,
    this.tags,
  });
  static GetDeliverabilityTestReportResponse fromJson(
          Map<String, dynamic> json) =>
      GetDeliverabilityTestReportResponse();
}

/// An object that contains all the deliverability data for a specific campaign.
/// This data is available for a campaign only if the campaign sent email by
/// using a domain that the Deliverability dashboard is enabled for
/// (`PutDeliverabilityDashboardOption` operation).
class GetDomainDeliverabilityCampaignResponse {
  /// An object that contains the deliverability data for the campaign.
  final DomainDeliverabilityCampaign domainDeliverabilityCampaign;

  GetDomainDeliverabilityCampaignResponse({
    @required this.domainDeliverabilityCampaign,
  });
  static GetDomainDeliverabilityCampaignResponse fromJson(
          Map<String, dynamic> json) =>
      GetDomainDeliverabilityCampaignResponse();
}

/// An object that includes statistics that are related to the domain that you
/// specified.
class GetDomainStatisticsReportResponse {
  /// An object that contains deliverability metrics for the domain that you
  /// specified. The data in this object is a summary of all of the data that
  /// was collected from the `StartDate` to the `EndDate`.
  final OverallVolume overallVolume;

  /// An object that contains deliverability metrics for the domain that you
  /// specified. This object contains data for each day, starting on the
  /// `StartDate` and ending on the `EndDate`.
  final List<DailyVolume> dailyVolumes;

  GetDomainStatisticsReportResponse({
    @required this.overallVolume,
    @required this.dailyVolumes,
  });
  static GetDomainStatisticsReportResponse fromJson(
          Map<String, dynamic> json) =>
      GetDomainStatisticsReportResponse();
}

/// Details about an email identity.
class GetEmailIdentityResponse {
  /// The email identity type.
  final String identityType;

  /// The feedback forwarding configuration for the identity.
  ///
  /// If the value is `true`, Amazon Pinpoint sends you email notifications when
  /// bounce or complaint events occur. Amazon Pinpoint sends this notification
  /// to the address that you specified in the Return-Path header of the
  /// original email.
  ///
  /// When you set this value to `false`, Amazon Pinpoint sends notifications
  /// through other mechanisms, such as by notifying an Amazon SNS topic or
  /// another event destination. You're required to have a method of tracking
  /// bounces and complaints. If you haven't set up another mechanism for
  /// receiving bounce or complaint notifications, Amazon Pinpoint sends an
  /// email notification when these events occur (even if this setting is
  /// disabled).
  final bool feedbackForwardingStatus;

  /// Specifies whether or not the identity is verified. In Amazon Pinpoint, you
  /// can only send email from verified email addresses or domains. For more
  /// information about verifying identities, see the
  /// [Amazon Pinpoint User Guide](https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html).
  final bool verifiedForSendingStatus;

  /// An object that contains information about the DKIM attributes for the
  /// identity. This object includes the tokens that you use to create the CNAME
  /// records that are required to complete the DKIM verification process.
  final DkimAttributes dkimAttributes;

  /// An object that contains information about the Mail-From attributes for the
  /// email identity.
  final MailFromAttributes mailFromAttributes;

  /// An array of objects that define the tags (keys and values) that are
  /// associated with the email identity.
  final List<Tag> tags;

  GetEmailIdentityResponse({
    this.identityType,
    this.feedbackForwardingStatus,
    this.verifiedForSendingStatus,
    this.dkimAttributes,
    this.mailFromAttributes,
    this.tags,
  });
  static GetEmailIdentityResponse fromJson(Map<String, dynamic> json) =>
      GetEmailIdentityResponse();
}

/// Information about an email identity.
class IdentityInfo {
  /// The email identity type. The identity type can be one of the following:
  ///
  /// *    `EMAIL_ADDRESS` – The identity is an email address.
  ///
  /// *    `DOMAIN` – The identity is a domain.
  ///
  /// *    `MANAGED_DOMAIN` – The identity is a domain that is managed by AWS.
  final String identityType;

  /// The address or domain of the identity.
  final String identityName;

  /// Indicates whether or not you can send email from the identity.
  ///
  /// In Amazon Pinpoint, an identity is an email address or domain that you
  /// send email from. Before you can send email from an identity, you have to
  /// demostrate that you own the identity, and that you authorize Amazon
  /// Pinpoint to send email from that identity.
  final bool sendingEnabled;

  IdentityInfo({
    this.identityType,
    this.identityName,
    this.sendingEnabled,
  });
  static IdentityInfo fromJson(Map<String, dynamic> json) => IdentityInfo();
}

/// An object that contains information about the inbox placement data settings
/// for a verified domain that’s associated with your AWS account. This data is
/// available only if you enabled the Deliverability dashboard for the domain
/// (`PutDeliverabilityDashboardOption` operation).
class InboxPlacementTrackingOption {
  /// Specifies whether inbox placement data is being tracked for the domain.
  final bool global;

  /// An array of strings, one for each major email provider that the inbox
  /// placement data applies to.
  final List<String> trackedIsps;

  InboxPlacementTrackingOption({
    this.global,
    this.trackedIsps,
  });
  static InboxPlacementTrackingOption fromJson(Map<String, dynamic> json) =>
      InboxPlacementTrackingOption();
}

/// An object that describes how email sent during the predictive inbox
/// placement test was handled by a certain email provider.
class IspPlacement {
  /// The name of the email provider that the inbox placement data applies to.
  final String ispName;

  /// An object that contains inbox placement metrics for a specific email
  /// provider.
  final PlacementStatistics placementStatistics;

  IspPlacement({
    this.ispName,
    this.placementStatistics,
  });
  static IspPlacement fromJson(Map<String, dynamic> json) => IspPlacement();
}

/// An object that defines an Amazon Kinesis Data Firehose destination for email
/// events. You can use Amazon Kinesis Data Firehose to stream data to other
/// services, such as Amazon S3 and Amazon Redshift.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon Pinpoint uses
  /// when sending email events to the Amazon Kinesis Data Firehose stream.
  final String iamRoleArn;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream
  /// that Amazon Pinpoint sends email events to.
  final String deliveryStreamArn;

  KinesisFirehoseDestination({
    @required this.iamRoleArn,
    @required this.deliveryStreamArn,
  });
  static KinesisFirehoseDestination fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseDestination();
}

/// A list of configuration sets in your Amazon Pinpoint account in the current
/// AWS Region.
class ListConfigurationSetsResponse {
  /// An array that contains all of the configuration sets in your Amazon
  /// Pinpoint account in the current AWS Region.
  final List<String> configurationSets;

  /// A token that indicates that there are additional configuration sets to
  /// list. To view additional configuration sets, issue another request to
  /// `ListConfigurationSets`, and pass this token in the `NextToken` parameter.
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  static ListConfigurationSetsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationSetsResponse();
}

/// A list of dedicated IP pools.
class ListDedicatedIpPoolsResponse {
  /// A list of all of the dedicated IP pools that are associated with your
  /// Amazon Pinpoint account.
  final List<String> dedicatedIpPools;

  /// A token that indicates that there are additional IP pools to list. To view
  /// additional IP pools, issue another request to `ListDedicatedIpPools`,
  /// passing this token in the `NextToken` parameter.
  final String nextToken;

  ListDedicatedIpPoolsResponse({
    this.dedicatedIpPools,
    this.nextToken,
  });
  static ListDedicatedIpPoolsResponse fromJson(Map<String, dynamic> json) =>
      ListDedicatedIpPoolsResponse();
}

/// A list of the predictive inbox placement test reports that are available for
/// your account, regardless of whether or not those tests are complete.
class ListDeliverabilityTestReportsResponse {
  /// An object that contains a lists of predictive inbox placement tests that
  /// you've performed.
  final List<DeliverabilityTestReport> deliverabilityTestReports;

  /// A token that indicates that there are additional predictive inbox
  /// placement tests to list. To view additional predictive inbox placement
  /// tests, issue another request to `ListDeliverabilityTestReports`, and pass
  /// this token in the `NextToken` parameter.
  final String nextToken;

  ListDeliverabilityTestReportsResponse({
    @required this.deliverabilityTestReports,
    this.nextToken,
  });
  static ListDeliverabilityTestReportsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDeliverabilityTestReportsResponse();
}

/// An array of objects that provide deliverability data for all the campaigns
/// that used a specific domain to send email during a specified time range.
/// This data is available for a domain only if you enabled the Deliverability
/// dashboard (`PutDeliverabilityDashboardOption` operation) for the domain.
class ListDomainDeliverabilityCampaignsResponse {
  /// An array of responses, one for each campaign that used the domain to send
  /// email during the specified time range.
  final List<DomainDeliverabilityCampaign> domainDeliverabilityCampaigns;

  /// A token that’s returned from a previous call to the
  /// `ListDomainDeliverabilityCampaigns` operation. This token indicates the
  /// position of the campaign in the list of campaigns.
  final String nextToken;

  ListDomainDeliverabilityCampaignsResponse({
    @required this.domainDeliverabilityCampaigns,
    this.nextToken,
  });
  static ListDomainDeliverabilityCampaignsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDomainDeliverabilityCampaignsResponse();
}

/// A list of all of the identities that you've attempted to verify for use with
/// Amazon Pinpoint, regardless of whether or not those identities were
/// successfully verified.
class ListEmailIdentitiesResponse {
  /// An array that includes all of the identities associated with your Amazon
  /// Pinpoint account.
  final List<IdentityInfo> emailIdentities;

  /// A token that indicates that there are additional configuration sets to
  /// list. To view additional configuration sets, issue another request to
  /// `ListEmailIdentities`, and pass this token in the `NextToken` parameter.
  final String nextToken;

  ListEmailIdentitiesResponse({
    this.emailIdentities,
    this.nextToken,
  });
  static ListEmailIdentitiesResponse fromJson(Map<String, dynamic> json) =>
      ListEmailIdentitiesResponse();
}

class ListTagsForResourceResponse {
  /// An array that lists all the tags that are associated with the resource.
  /// Each tag consists of a required tag key (`Key`) and an associated tag
  /// value (`Value`)
  final List<Tag> tags;

  ListTagsForResourceResponse({
    @required this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// A list of attributes that are associated with a MAIL FROM domain.
class MailFromAttributes {
  /// The name of a domain that an email identity uses as a custom MAIL FROM
  /// domain.
  final String mailFromDomain;

  /// The status of the MAIL FROM domain. This status can have the following
  /// values:
  ///
  /// *    `PENDING` – Amazon Pinpoint hasn't started searching for the MX
  /// record yet.
  ///
  /// *    `SUCCESS` – Amazon Pinpoint detected the required MX record for the
  /// MAIL FROM domain.
  ///
  /// *    `FAILED` – Amazon Pinpoint can't find the required MX record, or the
  /// record no longer exists.
  ///
  /// *    `TEMPORARY_FAILURE` – A temporary issue occurred, which prevented
  /// Amazon Pinpoint from determining the status of the MAIL FROM domain.
  final String mailFromDomainStatus;

  /// The action that Amazon Pinpoint to takes if it can't read the required MX
  /// record for a custom MAIL FROM domain. When you set this value to
  /// `UseDefaultValue`, Amazon Pinpoint uses _amazonses.com_ as the MAIL FROM
  /// domain. When you set this value to `RejectMessage`, Amazon Pinpoint
  /// returns a `MailFromDomainNotVerified` error, and doesn't attempt to
  /// deliver the email.
  ///
  /// These behaviors are taken when the custom MAIL FROM domain configuration
  /// is in the `Pending`, `Failed`, and `TemporaryFailure` states.
  final String behaviorOnMxFailure;

  MailFromAttributes({
    @required this.mailFromDomain,
    @required this.mailFromDomainStatus,
    @required this.behaviorOnMxFailure,
  });
  static MailFromAttributes fromJson(Map<String, dynamic> json) =>
      MailFromAttributes();
}

/// Represents the email message that you're sending. The `Message` object
/// consists of a subject line and a message body.
class Message {
  /// The subject line of the email. The subject line can only contain 7-bit
  /// ASCII characters. However, you can specify non-ASCII characters in the
  /// subject line by using encoded-word syntax, as described in
  /// [RFC 2047](https://tools.ietf.org/html/rfc2047).
  final Content subject;

  /// The body of the message. You can specify an HTML version of the message, a
  /// text-only version of the message, or both.
  final Body body;

  Message({
    @required this.subject,
    @required this.body,
  });
}

/// Contains the name and value of a tag that you apply to an email. You can use
/// message tags when you publish email sending events.
class MessageTag {
  /// The name of the message tag. The message tag name has to meet the
  /// following criteria:
  ///
  /// *   It can only contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-).
  ///
  /// *   It can contain no more than 256 characters.
  final String name;

  /// The value of the message tag. The message tag value has to meet the
  /// following criteria:
  ///
  /// *   It can only contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-).
  ///
  /// *   It can contain no more than 256 characters.
  final String value;

  MessageTag({
    @required this.name,
    @required this.value,
  });
}

/// An object that contains information about email that was sent from the
/// selected domain.
class OverallVolume {
  /// An object that contains information about the numbers of messages that
  /// arrived in recipients' inboxes and junk mail folders.
  final VolumeStatistics volumeStatistics;

  /// The percentage of emails that were sent from the domain that were read by
  /// their recipients.
  final double readRatePercent;

  /// An object that contains inbox and junk mail placement metrics for
  /// individual email providers.
  final List<DomainIspPlacement> domainIspPlacements;

  OverallVolume({
    this.volumeStatistics,
    this.readRatePercent,
    this.domainIspPlacements,
  });
  static OverallVolume fromJson(Map<String, dynamic> json) => OverallVolume();
}

/// An object that defines a Amazon Pinpoint destination for email events. You
/// can use Amazon Pinpoint events to create attributes in Amazon Pinpoint
/// projects. You can use these attributes to create segments for your
/// campaigns.
class PinpointDestination {
  /// The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you
  /// want to send email events to.
  final String applicationArn;

  PinpointDestination({
    this.applicationArn,
  });
  static PinpointDestination fromJson(Map<String, dynamic> json) =>
      PinpointDestination();
}

/// An object that contains inbox placement data for an email provider.
class PlacementStatistics {
  /// The percentage of emails that arrived in recipients' inboxes during the
  /// predictive inbox placement test.
  final double inboxPercentage;

  /// The percentage of emails that arrived in recipients' spam or junk mail
  /// folders during the predictive inbox placement test.
  final double spamPercentage;

  /// The percentage of emails that didn't arrive in recipients' inboxes at all
  /// during the predictive inbox placement test.
  final double missingPercentage;

  /// The percentage of emails that were authenticated by using Sender Policy
  /// Framework (SPF) during the predictive inbox placement test.
  final double spfPercentage;

  /// The percentage of emails that were authenticated by using DomainKeys
  /// Identified Mail (DKIM) during the predictive inbox placement test.
  final double dkimPercentage;

  PlacementStatistics({
    this.inboxPercentage,
    this.spamPercentage,
    this.missingPercentage,
    this.spfPercentage,
    this.dkimPercentage,
  });
  static PlacementStatistics fromJson(Map<String, dynamic> json) =>
      PlacementStatistics();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountDedicatedIpWarmupAttributesResponse {
  PutAccountDedicatedIpWarmupAttributesResponse();
  static PutAccountDedicatedIpWarmupAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutAccountDedicatedIpWarmupAttributesResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutAccountSendingAttributesResponse {
  PutAccountSendingAttributesResponse();
  static PutAccountSendingAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutAccountSendingAttributesResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetDeliveryOptionsResponse {
  PutConfigurationSetDeliveryOptionsResponse();
  static PutConfigurationSetDeliveryOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationSetDeliveryOptionsResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetReputationOptionsResponse {
  PutConfigurationSetReputationOptionsResponse();
  static PutConfigurationSetReputationOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationSetReputationOptionsResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetSendingOptionsResponse {
  PutConfigurationSetSendingOptionsResponse();
  static PutConfigurationSetSendingOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationSetSendingOptionsResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutConfigurationSetTrackingOptionsResponse {
  PutConfigurationSetTrackingOptionsResponse();
  static PutConfigurationSetTrackingOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationSetTrackingOptionsResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutDedicatedIpInPoolResponse {
  PutDedicatedIpInPoolResponse();
  static PutDedicatedIpInPoolResponse fromJson(Map<String, dynamic> json) =>
      PutDedicatedIpInPoolResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutDedicatedIpWarmupAttributesResponse {
  PutDedicatedIpWarmupAttributesResponse();
  static PutDedicatedIpWarmupAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutDedicatedIpWarmupAttributesResponse();
}

/// A response that indicates whether the Deliverability dashboard is enabled
/// for your Amazon Pinpoint account.
class PutDeliverabilityDashboardOptionResponse {
  PutDeliverabilityDashboardOptionResponse();
  static PutDeliverabilityDashboardOptionResponse fromJson(
          Map<String, dynamic> json) =>
      PutDeliverabilityDashboardOptionResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityDkimAttributesResponse {
  PutEmailIdentityDkimAttributesResponse();
  static PutEmailIdentityDkimAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutEmailIdentityDkimAttributesResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityFeedbackAttributesResponse {
  PutEmailIdentityFeedbackAttributesResponse();
  static PutEmailIdentityFeedbackAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutEmailIdentityFeedbackAttributesResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class PutEmailIdentityMailFromAttributesResponse {
  PutEmailIdentityMailFromAttributesResponse();
  static PutEmailIdentityMailFromAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      PutEmailIdentityMailFromAttributesResponse();
}

/// The raw email message.
class RawMessage {
  /// The raw email message. The message has to meet the following criteria:
  ///
  /// *   The message has to contain a header and a body, separated by one blank
  /// line.
  ///
  /// *   All of the required header fields must be present in the message.
  ///
  /// *   Each part of a multipart MIME message must be formatted properly.
  ///
  /// *   Attachments must be in a file format that Amazon Pinpoint supports.
  ///
  /// *   The entire message must be Base64 encoded.
  ///
  /// *   If any of the MIME parts in your message contain content that is
  /// outside of the 7-bit ASCII character range, you should encode that content
  /// to ensure that recipients' email clients render the message properly.
  ///
  /// *   The length of any single line of text in the message can't exceed
  /// 1,000 characters. This restriction is defined in
  /// [RFC 5321](https://tools.ietf.org/html/rfc5321).
  final Uint8List data;

  RawMessage({
    @required this.data,
  });
}

/// Enable or disable collection of reputation metrics for emails that you send
/// using this configuration set in the current AWS Region.
class ReputationOptions {
  /// If `true`, tracking of reputation metrics is enabled for the configuration
  /// set. If `false`, tracking of reputation metrics is disabled for the
  /// configuration set.
  final bool reputationMetricsEnabled;

  /// The date and time (in Unix time) when the reputation metrics were last
  /// given a fresh start. When your account is given a fresh start, your
  /// reputation metrics are calculated starting from the date of the fresh
  /// start.
  final DateTime lastFreshStart;

  ReputationOptions({
    this.reputationMetricsEnabled,
    this.lastFreshStart,
  });
  static ReputationOptions fromJson(Map<String, dynamic> json) =>
      ReputationOptions();
}

/// A unique message ID that you receive when Amazon Pinpoint accepts an email
/// for sending.
class SendEmailResponse {
  /// A unique identifier for the message that is generated when Amazon Pinpoint
  /// accepts the message.
  ///
  ///
  ///
  /// It is possible for Amazon Pinpoint to accept a message without sending it.
  /// This can happen when the message you're trying to send has an attachment
  /// doesn't pass a virus check, or when you send a templated email that
  /// contains invalid personalization content, for example.
  final String messageId;

  SendEmailResponse({
    this.messageId,
  });
  static SendEmailResponse fromJson(Map<String, dynamic> json) =>
      SendEmailResponse();
}

/// An object that contains information about the per-day and per-second sending
/// limits for your Amazon Pinpoint account in the current AWS Region.
class SendQuota {
  /// The maximum number of emails that you can send in the current AWS Region
  /// over a 24-hour period. This value is also called your _sending quota_.
  final double max24HourSend;

  /// The maximum number of emails that you can send per second in the current
  /// AWS Region. This value is also called your _maximum sending rate_ or your
  /// _maximum TPS (transactions per second) rate_.
  final double maxSendRate;

  /// The number of emails sent from your Amazon Pinpoint account in the current
  /// AWS Region over the past 24 hours.
  final double sentLast24Hours;

  SendQuota({
    this.max24HourSend,
    this.maxSendRate,
    this.sentLast24Hours,
  });
  static SendQuota fromJson(Map<String, dynamic> json) => SendQuota();
}

/// Used to enable or disable email sending for messages that use this
/// configuration set in the current AWS Region.
class SendingOptions {
  /// If `true`, email sending is enabled for the configuration set. If `false`,
  /// email sending is disabled for the configuration set.
  final bool sendingEnabled;

  SendingOptions({
    this.sendingEnabled,
  });
  static SendingOptions fromJson(Map<String, dynamic> json) => SendingOptions();
}

/// An object that defines an Amazon SNS destination for email events. You can
/// use Amazon SNS to send notification when certain email events occur.
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish email events to. For more information about Amazon SNS topics, see
  /// the
  /// [Amazon SNS Developer Guide](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html).
  final String topicArn;

  SnsDestination({
    @required this.topicArn,
  });
  static SnsDestination fromJson(Map<String, dynamic> json) => SnsDestination();
}

/// An object that defines the tags that are associated with a resource.
/// A _tag_ is a label that you optionally define and associate with a resource
/// in Amazon Pinpoint. Tags can help you categorize and manage resources in
/// different ways, such as by purpose, owner, environment, or other criteria. A
/// resource can have as many as 50 tags.
///
/// Each tag consists of a required _tag key_ and an associated _tag value_,
/// both of which you define. A tag key is a general label that acts as a
/// category for a more specific tag value. A tag value acts as a descriptor
/// within a tag key. A tag key can contain as many as 128 characters. A tag
/// value can contain as many as 256 characters. The characters can be Unicode
/// letters, digits, white space, or one of the following symbols: _ . : / = +
/// -. The following additional restrictions apply to tags:
///
/// *   Tag keys and values are case sensitive.
///
/// *   For each associated resource, each tag key must be unique and it can
/// have only one value.
///
/// *   The `aws:` prefix is reserved for use by AWS; you can’t use it in any
/// tag keys or values that you define. In addition, you can't edit or remove
/// tag keys or values that use this prefix. Tags that use this prefix don’t
/// count against the limit of 50 tags per resource.
///
/// *   You can associate tags with public or shared resources, but the tags are
/// available only for your AWS account, not any other accounts that share the
/// resource. In addition, the tags are available only for resources that are
/// located in the specified AWS Region for your AWS account.
class Tag {
  /// One part of a key-value pair that defines a tag. The maximum length of a
  /// tag key is 128 characters. The minimum length is 1 character.
  final String key;

  /// The optional part of a key-value pair that defines a tag. The maximum
  /// length of a tag value is 256 characters. The minimum length is 0
  /// characters. If you don’t want a resource to have a specific tag value,
  /// don’t specify a value for this parameter. Amazon Pinpoint will set the
  /// value to an empty string.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// An object that defines the tracking options for a configuration set. When
/// you use Amazon Pinpoint to send an email, it contains an invisible image
/// that's used to track when recipients open your email. If your email contains
/// links, those links are changed slightly in order to track when recipients
/// click them.
///
/// These images and links include references to a domain operated by AWS. You
/// can optionally configure Amazon Pinpoint to use a domain that you operate
/// for these images and links.
class TrackingOptions {
  /// The domain that you want to use for tracking open and click events.
  final String customRedirectDomain;

  TrackingOptions({
    @required this.customRedirectDomain,
  });
  static TrackingOptions fromJson(Map<String, dynamic> json) =>
      TrackingOptions();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

/// An HTTP 200 response if the request succeeds, or an error message if the
/// request fails.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  static UpdateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateConfigurationSetEventDestinationResponse();
}

/// An object that contains information about the amount of email that was
/// delivered to recipients.
class VolumeStatistics {
  /// The total number of emails that arrived in recipients' inboxes.
  final BigInt inboxRawCount;

  /// The total number of emails that arrived in recipients' spam or junk mail
  /// folders.
  final BigInt spamRawCount;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' inboxes.
  final BigInt projectedInbox;

  /// An estimate of the percentage of emails sent from the current domain that
  /// will arrive in recipients' spam or junk mail folders.
  final BigInt projectedSpam;

  VolumeStatistics({
    this.inboxRawCount,
    this.spamRawCount,
    this.projectedInbox,
    this.projectedSpam,
  });
  static VolumeStatistics fromJson(Map<String, dynamic> json) =>
      VolumeStatistics();
}
