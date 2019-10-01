import 'package:meta/meta.dart';

/// Amazon Simple Notification Service
///
/// Amazon Simple Notification Service (Amazon SNS) is a web service that
/// enables you to build distributed web-enabled applications. Applications can
/// use Amazon SNS to easily push real-time notification messages to interested
/// subscribers over multiple delivery protocols. For more information about
/// this product see [https://aws.amazon.com/sns](http://aws.amazon.com/sns/).
/// For detailed information about Amazon SNS features and their associated API
/// calls, see the [Amazon SNS Developer
/// Guide](https://docs.aws.amazon.com/sns/latest/dg/).
///
/// We also provide SDKs that enable you to access Amazon SNS from your
/// preferred programming language. The SDKs contain functionality that
/// automatically takes care of tasks such as: cryptographically signing your
/// service requests, retrying requests, and handling error responses. For a
/// list of available SDKs, go to [Tools for Amazon Web
/// Services](http://aws.amazon.com/tools/).
class SnsApi {
  /// Adds a statement to a topic's access control policy, granting access for
  /// the specified AWS accounts to the specified actions.
  Future<void> addPermission(
      {@required String topicArn,
      @required String label,
      @required List<String> awsAccountId,
      @required List<String> actionName}) async {}

  /// Accepts a phone number and indicates whether the phone holder has opted
  /// out of receiving SMS messages from your account. You cannot send SMS
  /// messages to a number that is opted out.
  ///
  /// To resume sending messages, you can opt in the number by using the
  /// `OptInPhoneNumber` action.
  Future<void> checkIfPhoneNumberIsOptedOut(String phoneNumber) async {}

  /// Verifies an endpoint owner's intent to receive messages by validating the
  /// token sent to the endpoint by an earlier `Subscribe` action. If the token
  /// is valid, the action creates a new subscription and returns its Amazon
  /// Resource Name (ARN). This call requires an AWS signature only when the
  /// `AuthenticateOnUnsubscribe` flag is set to "true".
  Future<void> confirmSubscription(
      {@required String topicArn,
      @required String token,
      String authenticateOnUnsubscribe}) async {}

  /// Creates a platform application object for one of the supported push
  /// notification services, such as APNS and FCM, to which devices and mobile
  /// apps may register. You must specify PlatformPrincipal and
  /// PlatformCredential attributes when using the `CreatePlatformApplication`
  /// action. The PlatformPrincipal is received from the notification service.
  /// For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate". For GCM,
  /// PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is "client
  /// id". The PlatformCredential is also received from the notification
  /// service. For WNS, PlatformPrincipal is "Package Security Identifier". For
  /// MPNS, PlatformPrincipal is "TLS certificate". For Baidu, PlatformPrincipal
  /// is "API key".
  ///
  /// For APNS/APNS_SANDBOX, PlatformCredential is "private key". For GCM,
  /// PlatformCredential is "API key". For ADM, PlatformCredential is "client
  /// secret". For WNS, PlatformCredential is "secret key". For MPNS,
  /// PlatformCredential is "private key". For Baidu, PlatformCredential is
  /// "secret key". The PlatformApplicationArn that is returned when using
  /// `CreatePlatformApplication` is then used as an attribute for the
  /// `CreatePlatformEndpoint` action. For more information, see [Using Amazon
  /// SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  /// For more information about obtaining the PlatformPrincipal and
  /// PlatformCredential for each of the supported push notification services,
  /// see [Getting Started with Apple Push Notification
  /// Service](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-apns.html),
  /// [Getting Started with Amazon Device
  /// Messaging](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-adm.html),
  /// [Getting Started with Baidu Cloud
  /// Push](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-baidu.html),
  /// [Getting Started with Google Cloud Messaging for
  /// Android](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-gcm.html),
  /// [Getting Started with
  /// MPNS](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-mpns.html), or
  /// [Getting Started with
  /// WNS](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-wns.html).
  Future<void> createPlatformApplication(
      {@required String name,
      @required String platform,
      @required Map<String, String> attributes}) async {}

  /// Creates an endpoint for a device and mobile app on one of the supported
  /// push notification services, such as GCM and APNS. `CreatePlatformEndpoint`
  /// requires the PlatformApplicationArn that is returned from
  /// `CreatePlatformApplication`. The EndpointArn that is returned when using
  /// `CreatePlatformEndpoint` can then be used by the `Publish` action to send
  /// a message to a mobile app or by the `Subscribe` action for subscription to
  /// a topic. The `CreatePlatformEndpoint` action is idempotent, so if the
  /// requester already owns an endpoint with the same device token and
  /// attributes, that endpoint's ARN is returned without creating a new
  /// endpoint. For more information, see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// When using `CreatePlatformEndpoint` with Baidu, two attributes must be
  /// provided: ChannelId and UserId. The token field must also contain the
  /// ChannelId. For more information, see [Creating an Amazon SNS Endpoint for
  /// Baidu](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html).
  Future<void> createPlatformEndpoint(
      {@required String platformApplicationArn,
      @required String token,
      String customUserData,
      Map<String, String> attributes}) async {}

  /// Creates a topic to which notifications can be published. Users can create
  /// at most 100,000 topics. For more information, see
  /// [https://aws.amazon.com/sns](http://aws.amazon.com/sns/). This action is
  /// idempotent, so if the requester already owns a topic with the specified
  /// name, that topic's ARN is returned without creating a new topic.
  Future<void> createTopic(String name,
      {Map<String, String> attributes, List<Tag> tags}) async {}

  /// Deletes the endpoint for a device and mobile app from Amazon SNS. This
  /// action is idempotent. For more information, see [Using Amazon SNS Mobile
  /// Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// When you delete an endpoint that is also subscribed to a topic, then you
  /// must also unsubscribe the endpoint from the topic.
  Future<void> deleteEndpoint(String endpointArn) async {}

  /// Deletes a platform application object for one of the supported push
  /// notification services, such as APNS and GCM. For more information, see
  /// [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  Future<void> deletePlatformApplication(String platformApplicationArn) async {}

  /// Deletes a topic and all its subscriptions. Deleting a topic might prevent
  /// some messages previously sent to the topic from being delivered to
  /// subscribers. This action is idempotent, so deleting a topic that does not
  /// exist does not result in an error.
  Future<void> deleteTopic(String topicArn) async {}

  /// Retrieves the endpoint attributes for a device on one of the supported
  /// push notification services, such as GCM and APNS. For more information,
  /// see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  Future<void> getEndpointAttributes(String endpointArn) async {}

  /// Retrieves the attributes of the platform application object for the
  /// supported push notification services, such as APNS and GCM. For more
  /// information, see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  Future<void> getPlatformApplicationAttributes(
      String platformApplicationArn) async {}

  /// Returns the settings for sending SMS messages from your account.
  ///
  /// These settings are set with the `SetSMSAttributes` action.
  Future<void> getSmsAttributes({List<String> attributes}) async {}

  /// Returns all of the properties of a subscription.
  Future<void> getSubscriptionAttributes(String subscriptionArn) async {}

  /// Returns all of the properties of a topic. Topic properties returned might
  /// differ based on the authorization of the user.
  Future<void> getTopicAttributes(String topicArn) async {}

  /// Lists the endpoints and endpoint attributes for devices in a supported
  /// push notification service, such as GCM and APNS. The results for
  /// `ListEndpointsByPlatformApplication` are paginated and return a limited
  /// list of endpoints, up to 100. If additional records are available after
  /// the first page results, then a NextToken string will be returned. To
  /// receive the next page, you call `ListEndpointsByPlatformApplication` again
  /// using the NextToken string received from the previous call. When there are
  /// no more records to return, NextToken will be null. For more information,
  /// see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  Future<void> listEndpointsByPlatformApplication(String platformApplicationArn,
      {String nextToken}) async {}

  /// Returns a list of phone numbers that are opted out, meaning you cannot
  /// send SMS messages to them.
  ///
  /// The results for `ListPhoneNumbersOptedOut` are paginated, and each page
  /// returns up to 100 phone numbers. If additional phone numbers are available
  /// after the first page of results, then a `NextToken` string will be
  /// returned. To receive the next page, you call `ListPhoneNumbersOptedOut`
  /// again using the `NextToken` string received from the previous call. When
  /// there are no more records to return, `NextToken` will be null.
  Future<void> listPhoneNumbersOptedOut({String nextToken}) async {}

  /// Lists the platform application objects for the supported push notification
  /// services, such as APNS and GCM. The results for `ListPlatformApplications`
  /// are paginated and return a limited list of applications, up to 100. If
  /// additional records are available after the first page results, then a
  /// NextToken string will be returned. To receive the next page, you call
  /// `ListPlatformApplications` using the NextToken string received from the
  /// previous call. When there are no more records to return, NextToken will be
  /// null. For more information, see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// This action is throttled at 15 transactions per second (TPS).
  Future<void> listPlatformApplications({String nextToken}) async {}

  /// Returns a list of the requester's subscriptions. Each call returns a
  /// limited list of subscriptions, up to 100. If there are more subscriptions,
  /// a `NextToken` is also returned. Use the `NextToken` parameter in a new
  /// `ListSubscriptions` call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  Future<void> listSubscriptions({String nextToken}) async {}

  /// Returns a list of the subscriptions to a specific topic. Each call returns
  /// a limited list of subscriptions, up to 100. If there are more
  /// subscriptions, a `NextToken` is also returned. Use the `NextToken`
  /// parameter in a new `ListSubscriptionsByTopic` call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  Future<void> listSubscriptionsByTopic(String topicArn,
      {String nextToken}) async {}

  /// List all tags added to the specified Amazon SNS topic. For an overview,
  /// see [Amazon SNS
  /// Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html) in the
  /// _Amazon Simple Notification Service Developer Guide_.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Returns a list of the requester's topics. Each call returns a limited list
  /// of topics, up to 100. If there are more topics, a `NextToken` is also
  /// returned. Use the `NextToken` parameter in a new `ListTopics` call to get
  /// further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  Future<void> listTopics({String nextToken}) async {}

  /// Use this request to opt in a phone number that is opted out, which enables
  /// you to resume sending SMS messages to the number.
  ///
  /// You can opt in a phone number only once every 30 days.
  Future<void> optInPhoneNumber(String phoneNumber) async {}

  /// Sends a message to an Amazon SNS topic or sends a text message (SMS
  /// message) directly to a phone number.
  ///
  /// If you send a message to a topic, Amazon SNS delivers the message to each
  /// endpoint that is subscribed to the topic. The format of the message
  /// depends on the notification protocol for each subscribed endpoint.
  ///
  /// When a `messageId` is returned, the message has been saved and Amazon SNS
  /// will attempt to deliver it shortly.
  ///
  /// To use the `Publish` action for sending a message to a mobile endpoint,
  /// such as an app on a Kindle device or mobile phone, you must specify the
  /// EndpointArn for the TargetArn parameter. The EndpointArn is returned when
  /// making a call with the `CreatePlatformEndpoint` action.
  ///
  /// For more information about formatting messages, see [Send Custom
  /// Platform-Specific Payloads in Messages to Mobile
  /// Devices](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html).
  Future<void> publish(String message,
      {String topicArn,
      String targetArn,
      String phoneNumber,
      String subject,
      String messageStructure,
      Map<String, MessageAttributeValue> messageAttributes}) async {}

  /// Removes a statement from a topic's access control policy.
  Future<void> removePermission(
      {@required String topicArn, @required String label}) async {}

  /// Sets the attributes for an endpoint for a device on one of the supported
  /// push notification services, such as GCM and APNS. For more information,
  /// see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  Future<void> setEndpointAttributes(
      {@required String endpointArn,
      @required Map<String, String> attributes}) async {}

  /// Sets the attributes of the platform application object for the supported
  /// push notification services, such as APNS and GCM. For more information,
  /// see [Using Amazon SNS Mobile Push
  /// Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  /// For information on configuring attributes for message delivery status, see
  /// [Using Amazon SNS Application Attributes for Message Delivery
  /// Status](https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html).
  Future<void> setPlatformApplicationAttributes(
      {@required String platformApplicationArn,
      @required Map<String, String> attributes}) async {}

  /// Use this request to set the default settings for sending SMS messages and
  /// receiving daily SMS usage reports.
  ///
  /// You can override some of these settings for a single message when you use
  /// the `Publish` action with the `MessageAttributes.entry.N` parameter. For
  /// more information, see [Sending an SMS
  /// Message](https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html)
  /// in the _Amazon SNS Developer Guide_.
  Future<void> setSmsAttributes(Map<String, String> attributes) async {}

  /// Allows a subscription owner to set an attribute of the subscription to a
  /// new value.
  Future<void> setSubscriptionAttributes(
      {@required String subscriptionArn,
      @required String attributeName,
      String attributeValue}) async {}

  /// Allows a topic owner to set an attribute of the topic to a new value.
  Future<void> setTopicAttributes(
      {@required String topicArn,
      @required String attributeName,
      String attributeValue}) async {}

  /// Prepares to subscribe an endpoint by sending the endpoint a confirmation
  /// message. To actually create a subscription, the endpoint owner must call
  /// the `ConfirmSubscription` action with the token from the confirmation
  /// message. Confirmation tokens are valid for three days.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  Future<void> subscribe(
      {@required String topicArn,
      @required String protocol,
      String endpoint,
      Map<String, String> attributes,
      bool returnSubscriptionArn}) async {}

  /// Add tags to the specified Amazon SNS topic. For an overview, see [Amazon
  /// SNS Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html) in the
  /// _Amazon SNS Developer Guide_.
  ///
  /// When you use topic tags, keep the following guidelines in mind:
  ///
  /// *   Adding more than 50 tags to a topic isn't recommended.
  ///
  /// *   Tags don't have any semantic meaning. Amazon SNS interprets tags as
  /// character strings.
  ///
  /// *   Tags are case-sensitive.
  ///
  /// *   A new tag with a key identical to that of an existing tag overwrites
  /// the existing tag.
  ///
  /// *   Tagging actions are limited to 10 TPS per AWS account. If your
  /// application requires a higher throughput, file a [technical support
  /// request](https://console.aws.amazon.com/support/home#/case/create?issueType=technical).
  ///
  ///
  /// For a full list of tag restrictions, see [Limits Related to
  /// Topics](https://docs.aws.amazon.com/sns/latest/dg/sns-limits.html#limits-topics)
  /// in the _Amazon SNS Developer Guide_.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Deletes a subscription. If the subscription requires authentication for
  /// deletion, only the owner of the subscription or the topic's owner can
  /// unsubscribe, and an AWS signature is required. If the `Unsubscribe` call
  /// does not require authentication and the requester is not the subscription
  /// owner, a final cancellation message is delivered to the endpoint, so that
  /// the endpoint owner can easily resubscribe to the topic if the
  /// `Unsubscribe` request was unintended.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  Future<void> unsubscribe(String subscriptionArn) async {}

  /// Remove tags from the specified Amazon SNS topic. For an overview, see
  /// [Amazon SNS Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html)
  /// in the _Amazon SNS Developer Guide_.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

class CheckIfPhoneNumberIsOptedOutResponse {}

class ConfirmSubscriptionResponse {}

class CreateEndpointResponse {}

class CreatePlatformApplicationResponse {}

class CreateTopicResponse {}

class Endpoint {}

class GetEndpointAttributesResponse {}

class GetPlatformApplicationAttributesResponse {}

class GetSmsAttributesResponse {}

class GetSubscriptionAttributesResponse {}

class GetTopicAttributesResponse {}

class ListEndpointsByPlatformApplicationResponse {}

class ListPhoneNumbersOptedOutResponse {}

class ListPlatformApplicationsResponse {}

class ListSubscriptionsByTopicResponse {}

class ListSubscriptionsResponse {}

class ListTagsForResourceResponse {}

class ListTopicsResponse {}

class MessageAttributeValue {}

class OptInPhoneNumberResponse {}

class PlatformApplication {}

class PublishResponse {}

class SetSmsAttributesResponse {}

class SubscribeResponse {}

class Subscription {}

class Tag {}

class TagResourceResponse {}

class Topic {}

class UntagResourceResponse {}
