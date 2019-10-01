import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Simple Notification Service
///
/// Amazon Simple Notification Service (Amazon SNS) is a web service that
/// enables you to build distributed web-enabled applications. Applications can
/// use Amazon SNS to easily push real-time notification messages to interested
/// subscribers over multiple delivery protocols. For more information about
/// this product see [https://aws.amazon.com/sns](http://aws.amazon.com/sns/).
/// For detailed information about Amazon SNS features and their associated API
/// calls, see the
/// [Amazon SNS Developer Guide](https://docs.aws.amazon.com/sns/latest/dg/).
///
/// We also provide SDKs that enable you to access Amazon SNS from your
/// preferred programming language. The SDKs contain functionality that
/// automatically takes care of tasks such as: cryptographically signing your
/// service requests, retrying requests, and handling error responses. For a
/// list of available SDKs, go to
/// [Tools for Amazon Web Services](http://aws.amazon.com/tools/).
class SnsApi {
  final _client;
  SnsApi(client) : _client = client.configured('SNS', serializer: 'query');

  /// Adds a statement to a topic's access control policy, granting access for
  /// the specified AWS accounts to the specified actions.
  ///
  /// [topicArn]: The ARN of the topic whose access control policy you wish to
  /// modify.
  ///
  /// [label]: A unique identifier for the new policy statement.
  ///
  /// [awsAccountId]: The AWS account IDs of the users (principals) who will be
  /// given access to the specified actions. The users must have AWS accounts,
  /// but do not need to be signed up for this service.
  ///
  /// [actionName]: The action you want to allow for the specified principal(s).
  ///
  /// Valid values: any Amazon SNS action name.
  Future<void> addPermission(
      {@required String topicArn,
      @required String label,
      @required List<String> awsAccountId,
      @required List<String> actionName}) async {
    await _client.send('AddPermission', {
      'TopicArn': topicArn,
      'Label': label,
      'AWSAccountId': awsAccountId,
      'ActionName': actionName,
    });
  }

  /// Accepts a phone number and indicates whether the phone holder has opted
  /// out of receiving SMS messages from your account. You cannot send SMS
  /// messages to a number that is opted out.
  ///
  /// To resume sending messages, you can opt in the number by using the
  /// `OptInPhoneNumber` action.
  ///
  /// [phoneNumber]: The phone number for which you want to check the opt out
  /// status.
  Future<CheckIfPhoneNumberIsOptedOutResponse> checkIfPhoneNumberIsOptedOut(
      String phoneNumber) async {
    var response_ = await _client.send('CheckIfPhoneNumberIsOptedOut', {
      'phoneNumber': phoneNumber,
    });
    return CheckIfPhoneNumberIsOptedOutResponse.fromJson(response_);
  }

  /// Verifies an endpoint owner's intent to receive messages by validating the
  /// token sent to the endpoint by an earlier `Subscribe` action. If the token
  /// is valid, the action creates a new subscription and returns its Amazon
  /// Resource Name (ARN). This call requires an AWS signature only when the
  /// `AuthenticateOnUnsubscribe` flag is set to "true".
  ///
  /// [topicArn]: The ARN of the topic for which you wish to confirm a
  /// subscription.
  ///
  /// [token]: Short-lived token sent to an endpoint during the `Subscribe`
  /// action.
  ///
  /// [authenticateOnUnsubscribe]: Disallows unauthenticated unsubscribes of the
  /// subscription. If the value of this parameter is `true` and the request has
  /// an AWS signature, then only the topic owner and the subscription owner can
  /// unsubscribe the endpoint. The unsubscribe action requires AWS
  /// authentication.
  Future<ConfirmSubscriptionResponse> confirmSubscription(
      {@required String topicArn,
      @required String token,
      String authenticateOnUnsubscribe}) async {
    var response_ = await _client.send('ConfirmSubscription', {
      'TopicArn': topicArn,
      'Token': token,
      if (authenticateOnUnsubscribe != null)
        'AuthenticateOnUnsubscribe': authenticateOnUnsubscribe,
    });
    return ConfirmSubscriptionResponse.fromJson(response_);
  }

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
  /// `CreatePlatformEndpoint` action. For more information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  /// For more information about obtaining the PlatformPrincipal and
  /// PlatformCredential for each of the supported push notification services,
  /// see
  /// [Getting Started with Apple Push Notification Service](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-apns.html),
  /// [Getting Started with Amazon Device Messaging](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-adm.html),
  /// [Getting Started with Baidu Cloud Push](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-baidu.html),
  /// [Getting Started with Google Cloud Messaging for Android](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-gcm.html),
  /// [Getting Started with MPNS](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-mpns.html),
  /// or
  /// [Getting Started with WNS](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-wns.html).
  ///
  /// [name]: Application names must be made up of only uppercase and lowercase
  /// ASCII letters, numbers, underscores, hyphens, and periods, and must be
  /// between 1 and 256 characters long.
  ///
  /// [platform]: The following platforms are supported: ADM (Amazon Device
  /// Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and GCM
  /// (Google Cloud Messaging).
  ///
  /// [attributes]: For a list of attributes, see
  /// [SetPlatformApplicationAttributes](https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html)
  Future<CreatePlatformApplicationResponse> createPlatformApplication(
      {@required String name,
      @required String platform,
      @required Map<String, String> attributes}) async {
    var response_ = await _client.send('CreatePlatformApplication', {
      'Name': name,
      'Platform': platform,
      'Attributes': attributes,
    });
    return CreatePlatformApplicationResponse.fromJson(response_);
  }

  /// Creates an endpoint for a device and mobile app on one of the supported
  /// push notification services, such as GCM and APNS. `CreatePlatformEndpoint`
  /// requires the PlatformApplicationArn that is returned from
  /// `CreatePlatformApplication`. The EndpointArn that is returned when using
  /// `CreatePlatformEndpoint` can then be used by the `Publish` action to send
  /// a message to a mobile app or by the `Subscribe` action for subscription to
  /// a topic. The `CreatePlatformEndpoint` action is idempotent, so if the
  /// requester already owns an endpoint with the same device token and
  /// attributes, that endpoint's ARN is returned without creating a new
  /// endpoint. For more information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// When using `CreatePlatformEndpoint` with Baidu, two attributes must be
  /// provided: ChannelId and UserId. The token field must also contain the
  /// ChannelId. For more information, see
  /// [Creating an Amazon SNS Endpoint for Baidu](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html).
  ///
  /// [platformApplicationArn]: PlatformApplicationArn returned from
  /// CreatePlatformApplication is used to create a an endpoint.
  ///
  /// [token]: Unique identifier created by the notification service for an app
  /// on a device. The specific name for Token will vary, depending on which
  /// notification service is being used. For example, when using APNS as the
  /// notification service, you need the device token. Alternatively, when using
  /// GCM or ADM, the device token equivalent is called the registration ID.
  ///
  /// [customUserData]: Arbitrary user data to associate with the endpoint.
  /// Amazon SNS does not use this data. The data must be in UTF-8 format and
  /// less than 2KB.
  ///
  /// [attributes]: For a list of attributes, see
  /// [SetEndpointAttributes](https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html).
  Future<CreateEndpointResponse> createPlatformEndpoint(
      {@required String platformApplicationArn,
      @required String token,
      String customUserData,
      Map<String, String> attributes}) async {
    var response_ = await _client.send('CreatePlatformEndpoint', {
      'PlatformApplicationArn': platformApplicationArn,
      'Token': token,
      if (customUserData != null) 'CustomUserData': customUserData,
      if (attributes != null) 'Attributes': attributes,
    });
    return CreateEndpointResponse.fromJson(response_);
  }

  /// Creates a topic to which notifications can be published. Users can create
  /// at most 100,000 topics. For more information, see
  /// [https://aws.amazon.com/sns](http://aws.amazon.com/sns/). This action is
  /// idempotent, so if the requester already owns a topic with the specified
  /// name, that topic's ARN is returned without creating a new topic.
  ///
  /// [name]: The name of the topic you want to create.
  ///
  /// Constraints: Topic names must be made up of only uppercase and lowercase
  /// ASCII letters, numbers, underscores, and hyphens, and must be between 1
  /// and 256 characters long.
  ///
  /// [attributes]: A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `CreateTopic` action uses:
  ///
  /// *    `DeliveryPolicy` – The policy that defines how Amazon SNS retries
  /// failed deliveries to HTTP/S endpoints.
  ///
  /// *    `DisplayName` – The display name to use for a topic with SMS
  /// subscriptions.
  ///
  /// *    `Policy` – The policy that defines who can access your topic. By
  /// default, only the topic owner can publish or subscribe to the topic.
  ///
  ///
  /// The following attribute applies only to
  /// [server-side-encryption](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html):
  ///
  /// *    `KmsMasterKeyId` - The ID of an AWS-managed customer master key (CMK)
  /// for Amazon SNS or a custom CMK. For more information, see
  /// [Key Terms](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms).
  /// For more examples, see
  /// [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
  /// in the _AWS Key Management Service API Reference_.
  ///
  /// [tags]: The list of tags to add to a new topic.
  Future<CreateTopicResponse> createTopic(String name,
      {Map<String, String> attributes, List<Tag> tags}) async {
    var response_ = await _client.send('CreateTopic', {
      'Name': name,
      if (attributes != null) 'Attributes': attributes,
      if (tags != null) 'Tags': tags,
    });
    return CreateTopicResponse.fromJson(response_);
  }

  /// Deletes the endpoint for a device and mobile app from Amazon SNS. This
  /// action is idempotent. For more information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// When you delete an endpoint that is also subscribed to a topic, then you
  /// must also unsubscribe the endpoint from the topic.
  ///
  /// [endpointArn]: EndpointArn of endpoint to delete.
  Future<void> deleteEndpoint(String endpointArn) async {
    await _client.send('DeleteEndpoint', {
      'EndpointArn': endpointArn,
    });
  }

  /// Deletes a platform application object for one of the supported push
  /// notification services, such as APNS and GCM. For more information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// [platformApplicationArn]: PlatformApplicationArn of platform application
  /// object to delete.
  Future<void> deletePlatformApplication(String platformApplicationArn) async {
    await _client.send('DeletePlatformApplication', {
      'PlatformApplicationArn': platformApplicationArn,
    });
  }

  /// Deletes a topic and all its subscriptions. Deleting a topic might prevent
  /// some messages previously sent to the topic from being delivered to
  /// subscribers. This action is idempotent, so deleting a topic that does not
  /// exist does not result in an error.
  ///
  /// [topicArn]: The ARN of the topic you want to delete.
  Future<void> deleteTopic(String topicArn) async {
    await _client.send('DeleteTopic', {
      'TopicArn': topicArn,
    });
  }

  /// Retrieves the endpoint attributes for a device on one of the supported
  /// push notification services, such as GCM and APNS. For more information,
  /// see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// [endpointArn]: EndpointArn for GetEndpointAttributes input.
  Future<GetEndpointAttributesResponse> getEndpointAttributes(
      String endpointArn) async {
    var response_ = await _client.send('GetEndpointAttributes', {
      'EndpointArn': endpointArn,
    });
    return GetEndpointAttributesResponse.fromJson(response_);
  }

  /// Retrieves the attributes of the platform application object for the
  /// supported push notification services, such as APNS and GCM. For more
  /// information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// [platformApplicationArn]: PlatformApplicationArn for
  /// GetPlatformApplicationAttributesInput.
  Future<GetPlatformApplicationAttributesResponse>
      getPlatformApplicationAttributes(String platformApplicationArn) async {
    var response_ = await _client.send('GetPlatformApplicationAttributes', {
      'PlatformApplicationArn': platformApplicationArn,
    });
    return GetPlatformApplicationAttributesResponse.fromJson(response_);
  }

  /// Returns the settings for sending SMS messages from your account.
  ///
  /// These settings are set with the `SetSMSAttributes` action.
  ///
  /// [attributes]: A list of the individual attribute names, such as
  /// `MonthlySpendLimit`, for which you want values.
  ///
  /// For all attribute names, see
  /// [SetSMSAttributes](https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html).
  ///
  /// If you don't use this parameter, Amazon SNS returns all SMS attributes.
  Future<GetSmsAttributesResponse> getSmsAttributes(
      {List<String> attributes}) async {
    var response_ = await _client.send('GetSMSAttributes', {
      if (attributes != null) 'attributes': attributes,
    });
    return GetSmsAttributesResponse.fromJson(response_);
  }

  /// Returns all of the properties of a subscription.
  ///
  /// [subscriptionArn]: The ARN of the subscription whose properties you want
  /// to get.
  Future<GetSubscriptionAttributesResponse> getSubscriptionAttributes(
      String subscriptionArn) async {
    var response_ = await _client.send('GetSubscriptionAttributes', {
      'SubscriptionArn': subscriptionArn,
    });
    return GetSubscriptionAttributesResponse.fromJson(response_);
  }

  /// Returns all of the properties of a topic. Topic properties returned might
  /// differ based on the authorization of the user.
  ///
  /// [topicArn]: The ARN of the topic whose properties you want to get.
  Future<GetTopicAttributesResponse> getTopicAttributes(String topicArn) async {
    var response_ = await _client.send('GetTopicAttributes', {
      'TopicArn': topicArn,
    });
    return GetTopicAttributesResponse.fromJson(response_);
  }

  /// Lists the endpoints and endpoint attributes for devices in a supported
  /// push notification service, such as GCM and APNS. The results for
  /// `ListEndpointsByPlatformApplication` are paginated and return a limited
  /// list of endpoints, up to 100. If additional records are available after
  /// the first page results, then a NextToken string will be returned. To
  /// receive the next page, you call `ListEndpointsByPlatformApplication` again
  /// using the NextToken string received from the previous call. When there are
  /// no more records to return, NextToken will be null. For more information,
  /// see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// [platformApplicationArn]: PlatformApplicationArn for
  /// ListEndpointsByPlatformApplicationInput action.
  ///
  /// [nextToken]: NextToken string is used when calling
  /// ListEndpointsByPlatformApplication action to retrieve additional records
  /// that are available after the first page results.
  Future<ListEndpointsByPlatformApplicationResponse>
      listEndpointsByPlatformApplication(String platformApplicationArn,
          {String nextToken}) async {
    var response_ = await _client.send('ListEndpointsByPlatformApplication', {
      'PlatformApplicationArn': platformApplicationArn,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListEndpointsByPlatformApplicationResponse.fromJson(response_);
  }

  /// Returns a list of phone numbers that are opted out, meaning you cannot
  /// send SMS messages to them.
  ///
  /// The results for `ListPhoneNumbersOptedOut` are paginated, and each page
  /// returns up to 100 phone numbers. If additional phone numbers are available
  /// after the first page of results, then a `NextToken` string will be
  /// returned. To receive the next page, you call `ListPhoneNumbersOptedOut`
  /// again using the `NextToken` string received from the previous call. When
  /// there are no more records to return, `NextToken` will be null.
  ///
  /// [nextToken]: A `NextToken` string is used when you call the
  /// `ListPhoneNumbersOptedOut` action to retrieve additional records that are
  /// available after the first page of results.
  Future<ListPhoneNumbersOptedOutResponse> listPhoneNumbersOptedOut(
      {String nextToken}) async {
    var response_ = await _client.send('ListPhoneNumbersOptedOut', {
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListPhoneNumbersOptedOutResponse.fromJson(response_);
  }

  /// Lists the platform application objects for the supported push notification
  /// services, such as APNS and GCM. The results for `ListPlatformApplications`
  /// are paginated and return a limited list of applications, up to 100. If
  /// additional records are available after the first page results, then a
  /// NextToken string will be returned. To receive the next page, you call
  /// `ListPlatformApplications` using the NextToken string received from the
  /// previous call. When there are no more records to return, NextToken will be
  /// null. For more information, see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// This action is throttled at 15 transactions per second (TPS).
  ///
  /// [nextToken]: NextToken string is used when calling
  /// ListPlatformApplications action to retrieve additional records that are
  /// available after the first page results.
  Future<ListPlatformApplicationsResponse> listPlatformApplications(
      {String nextToken}) async {
    var response_ = await _client.send('ListPlatformApplications', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListPlatformApplicationsResponse.fromJson(response_);
  }

  /// Returns a list of the requester's subscriptions. Each call returns a
  /// limited list of subscriptions, up to 100. If there are more subscriptions,
  /// a `NextToken` is also returned. Use the `NextToken` parameter in a new
  /// `ListSubscriptions` call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// [nextToken]: Token returned by the previous `ListSubscriptions` request.
  Future<ListSubscriptionsResponse> listSubscriptions(
      {String nextToken}) async {
    var response_ = await _client.send('ListSubscriptions', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListSubscriptionsResponse.fromJson(response_);
  }

  /// Returns a list of the subscriptions to a specific topic. Each call returns
  /// a limited list of subscriptions, up to 100. If there are more
  /// subscriptions, a `NextToken` is also returned. Use the `NextToken`
  /// parameter in a new `ListSubscriptionsByTopic` call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// [topicArn]: The ARN of the topic for which you wish to find subscriptions.
  ///
  /// [nextToken]: Token returned by the previous `ListSubscriptionsByTopic`
  /// request.
  Future<ListSubscriptionsByTopicResponse> listSubscriptionsByTopic(
      String topicArn,
      {String nextToken}) async {
    var response_ = await _client.send('ListSubscriptionsByTopic', {
      'TopicArn': topicArn,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListSubscriptionsByTopicResponse.fromJson(response_);
  }

  /// List all tags added to the specified Amazon SNS topic. For an overview,
  /// see
  /// [Amazon SNS Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html)
  /// in the _Amazon Simple Notification Service Developer Guide_.
  ///
  /// [resourceArn]: The ARN of the topic for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Returns a list of the requester's topics. Each call returns a limited list
  /// of topics, up to 100. If there are more topics, a `NextToken` is also
  /// returned. Use the `NextToken` parameter in a new `ListTopics` call to get
  /// further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// [nextToken]: Token returned by the previous `ListTopics` request.
  Future<ListTopicsResponse> listTopics({String nextToken}) async {
    var response_ = await _client.send('ListTopics', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTopicsResponse.fromJson(response_);
  }

  /// Use this request to opt in a phone number that is opted out, which enables
  /// you to resume sending SMS messages to the number.
  ///
  /// You can opt in a phone number only once every 30 days.
  ///
  /// [phoneNumber]: The phone number to opt in.
  Future<OptInPhoneNumberResponse> optInPhoneNumber(String phoneNumber) async {
    var response_ = await _client.send('OptInPhoneNumber', {
      'phoneNumber': phoneNumber,
    });
    return OptInPhoneNumberResponse.fromJson(response_);
  }

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
  /// For more information about formatting messages, see
  /// [Send Custom Platform-Specific Payloads in Messages to Mobile Devices](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html).
  ///
  /// [topicArn]: The topic you want to publish to.
  ///
  /// If you don't specify a value for the `TopicArn` parameter, you must
  /// specify a value for the `PhoneNumber` or `TargetArn` parameters.
  ///
  /// [targetArn]: If you don't specify a value for the `TargetArn` parameter,
  /// you must specify a value for the `PhoneNumber` or `TopicArn` parameters.
  ///
  /// [phoneNumber]: The phone number to which you want to deliver an SMS
  /// message. Use E.164 format.
  ///
  /// If you don't specify a value for the `PhoneNumber` parameter, you must
  /// specify a value for the `TargetArn` or `TopicArn` parameters.
  ///
  /// [message]: The message you want to send.
  ///
  ///  The `Message` parameter is always a string. If you set `MessageStructure`
  /// to `json`, you must string-encode the `Message` parameter.
  ///
  /// If you are publishing to a topic and you want to send the same message to
  /// all transport protocols, include the text of the message as a String
  /// value. If you want to send different messages for each transport protocol,
  /// set the value of the `MessageStructure` parameter to `json` and use a JSON
  /// object for the `Message` parameter.
  ///
  /// Constraints:
  ///
  /// *   With the exception of SMS, messages must be UTF-8 encoded strings and
  /// at most 256 KB in size (262,144 bytes, not 262,144 characters).
  ///
  /// *   For SMS, each message can contain up to 140 characters. This character
  /// limit depends on the encoding schema. For example, an SMS message can
  /// contain 160 GSM characters, 140 ASCII characters, or 70 UCS-2 characters.
  ///
  ///     If you publish a message that exceeds this size limit, Amazon SNS
  /// sends the message as multiple messages, each fitting within the size
  /// limit. Messages aren't truncated mid-word but are cut off at whole-word
  /// boundaries.
  ///
  ///     The total size limit for a single SMS `Publish` action is 1,600
  /// characters.
  ///
  ///
  /// JSON-specific constraints:
  ///
  /// *   Keys in the JSON object that correspond to supported transport
  /// protocols must have simple JSON string values.
  ///
  /// *   The values will be parsed (unescaped) before they are used in outgoing
  /// messages.
  ///
  /// *   Outbound notifications are JSON encoded (meaning that the characters
  /// will be reescaped for sending).
  ///
  /// *   Values have a minimum length of 0 (the empty string, "", is allowed).
  ///
  /// *   Values have a maximum length bounded by the overall message size (so,
  /// including multiple protocols may limit message sizes).
  ///
  /// *   Non-string values will cause the key to be ignored.
  ///
  /// *   Keys that do not correspond to supported transport protocols are
  /// ignored.
  ///
  /// *   Duplicate keys are not allowed.
  ///
  /// *   Failure to parse or validate any key or value in the message will
  /// cause the `Publish` call to return an error (no partial delivery).
  ///
  /// [subject]: Optional parameter to be used as the "Subject" line when the
  /// message is delivered to email endpoints. This field will also be included,
  /// if present, in the standard JSON messages delivered to other endpoints.
  ///
  /// Constraints: Subjects must be ASCII text that begins with a letter,
  /// number, or punctuation mark; must not include line breaks or control
  /// characters; and must be less than 100 characters long.
  ///
  /// [messageStructure]: Set `MessageStructure` to `json` if you want to send a
  /// different message for each protocol. For example, using one publish
  /// action, you can send a short message to your SMS subscribers and a longer
  /// message to your email subscribers. If you set `MessageStructure` to
  /// `json`, the value of the `Message` parameter must:
  ///
  /// *   be a syntactically valid JSON object; and
  ///
  /// *   contain at least a top-level JSON key of "default" with a value that
  /// is a string.
  ///
  ///
  /// You can define other top-level keys that define the message you want to
  /// send to a specific transport protocol (e.g., "http").
  ///
  /// For information about sending different messages for each protocol using
  /// the AWS Management Console, go to
  /// [Create Different Messages for Each Protocol](https://docs.aws.amazon.com/sns/latest/gsg/Publish.html#sns-message-formatting-by-protocol)
  /// in the _Amazon Simple Notification Service Getting Started Guide_.
  ///
  /// Valid value: `json`
  ///
  /// [messageAttributes]: Message attributes for Publish action.
  Future<PublishResponse> publish(String message,
      {String topicArn,
      String targetArn,
      String phoneNumber,
      String subject,
      String messageStructure,
      Map<String, MessageAttributeValue> messageAttributes}) async {
    var response_ = await _client.send('Publish', {
      if (topicArn != null) 'TopicArn': topicArn,
      if (targetArn != null) 'TargetArn': targetArn,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      'Message': message,
      if (subject != null) 'Subject': subject,
      if (messageStructure != null) 'MessageStructure': messageStructure,
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
    });
    return PublishResponse.fromJson(response_);
  }

  /// Removes a statement from a topic's access control policy.
  ///
  /// [topicArn]: The ARN of the topic whose access control policy you wish to
  /// modify.
  ///
  /// [label]: The unique label of the statement you want to remove.
  Future<void> removePermission(
      {@required String topicArn, @required String label}) async {
    await _client.send('RemovePermission', {
      'TopicArn': topicArn,
      'Label': label,
    });
  }

  /// Sets the attributes for an endpoint for a device on one of the supported
  /// push notification services, such as GCM and APNS. For more information,
  /// see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  ///
  /// [endpointArn]: EndpointArn used for SetEndpointAttributes action.
  ///
  /// [attributes]: A map of the endpoint attributes. Attributes in this map
  /// include the following:
  ///
  /// *    `CustomUserData` – arbitrary user data to associate with the
  /// endpoint. Amazon SNS does not use this data. The data must be in UTF-8
  /// format and less than 2KB.
  ///
  /// *    `Enabled` – flag that enables/disables delivery to the endpoint.
  /// Amazon SNS will set this to false when a notification service indicates to
  /// Amazon SNS that the endpoint is invalid. Users can set it back to true,
  /// typically after updating Token.
  ///
  /// *    `Token` – device token, also referred to as a registration id, for an
  /// app and mobile device. This is returned from the notification service when
  /// an app and mobile device are registered with the notification service.
  Future<void> setEndpointAttributes(
      {@required String endpointArn,
      @required Map<String, String> attributes}) async {
    await _client.send('SetEndpointAttributes', {
      'EndpointArn': endpointArn,
      'Attributes': attributes,
    });
  }

  /// Sets the attributes of the platform application object for the supported
  /// push notification services, such as APNS and GCM. For more information,
  /// see
  /// [Using Amazon SNS Mobile Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
  /// For information on configuring attributes for message delivery status, see
  /// [Using Amazon SNS Application Attributes for Message Delivery Status](https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html).
  ///
  /// [platformApplicationArn]: PlatformApplicationArn for
  /// SetPlatformApplicationAttributes action.
  ///
  /// [attributes]: A map of the platform application attributes. Attributes in
  /// this map include the following:
  ///
  /// *    `PlatformCredential` – The credential received from the notification
  /// service. For APNS/APNS_SANDBOX, PlatformCredential is private key. For
  /// GCM, PlatformCredential is "API key". For ADM, PlatformCredential is
  /// "client secret".
  ///
  /// *    `PlatformPrincipal` – The principal received from the notification
  /// service. For APNS/APNS_SANDBOX, PlatformPrincipal is SSL certificate. For
  /// GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is
  /// "client id".
  ///
  /// *    `EventEndpointCreated` – Topic ARN to which EndpointCreated event
  /// notifications should be sent.
  ///
  /// *    `EventEndpointDeleted` – Topic ARN to which EndpointDeleted event
  /// notifications should be sent.
  ///
  /// *    `EventEndpointUpdated` – Topic ARN to which EndpointUpdate event
  /// notifications should be sent.
  ///
  /// *    `EventDeliveryFailure` – Topic ARN to which DeliveryFailure event
  /// notifications should be sent upon Direct Publish delivery failure
  /// (permanent) to one of the application's endpoints.
  ///
  /// *    `SuccessFeedbackRoleArn` – IAM role ARN used to give Amazon SNS write
  /// access to use CloudWatch Logs on your behalf.
  ///
  /// *    `FailureFeedbackRoleArn` – IAM role ARN used to give Amazon SNS write
  /// access to use CloudWatch Logs on your behalf.
  ///
  /// *    `SuccessFeedbackSampleRate` – Sample rate percentage (0-100) of
  /// successfully delivered messages.
  Future<void> setPlatformApplicationAttributes(
      {@required String platformApplicationArn,
      @required Map<String, String> attributes}) async {
    await _client.send('SetPlatformApplicationAttributes', {
      'PlatformApplicationArn': platformApplicationArn,
      'Attributes': attributes,
    });
  }

  /// Use this request to set the default settings for sending SMS messages and
  /// receiving daily SMS usage reports.
  ///
  /// You can override some of these settings for a single message when you use
  /// the `Publish` action with the `MessageAttributes.entry.N` parameter. For
  /// more information, see
  /// [Sending an SMS Message](https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html)
  /// in the _Amazon SNS Developer Guide_.
  ///
  /// [attributes]: The default settings for sending SMS messages from your
  /// account. You can set values for the following attribute names:
  ///
  ///  `MonthlySpendLimit` – The maximum amount in USD that you are willing to
  /// spend each month to send SMS messages. When Amazon SNS determines that
  /// sending an SMS message would incur a cost that exceeds this limit, it
  /// stops sending SMS messages within minutes.
  ///
  ///  Amazon SNS stops sending SMS messages within minutes of the limit being
  /// crossed. During that interval, if you continue to send SMS messages, you
  /// will incur costs that exceed your limit.
  ///
  /// By default, the spend limit is set to the maximum allowed by Amazon SNS.
  /// If you want to raise the limit, submit an
  /// [SNS Limit Increase case](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sns).
  /// For **New limit value**, enter your desired monthly spend limit. In the
  /// **Use Case Description** field, explain that you are requesting an SMS
  /// monthly spend limit increase.
  ///
  ///  `DeliveryStatusIAMRole` – The ARN of the IAM role that allows Amazon SNS
  /// to write logs about SMS deliveries in CloudWatch Logs. For each SMS
  /// message that you send, Amazon SNS writes a log that includes the message
  /// price, the success or failure status, the reason for failure (if the
  /// message failed), the message dwell time, and other information.
  ///
  ///  `DeliveryStatusSuccessSamplingRate` – The percentage of successful SMS
  /// deliveries for which Amazon SNS will write logs in CloudWatch Logs. The
  /// value can be an integer from 0 - 100. For example, to write logs only for
  /// failed deliveries, set this value to `0`. To write logs for 10% of your
  /// successful deliveries, set it to `10`.
  ///
  ///  `DefaultSenderID` – A string, such as your business brand, that is
  /// displayed as the sender on the receiving device. Support for sender IDs
  /// varies by country. The sender ID can be 1 - 11 alphanumeric characters,
  /// and it must contain at least one letter.
  ///
  ///  `DefaultSMSType` – The type of SMS message that you will send by default.
  /// You can assign the following values:
  ///
  /// *    `Promotional` – (Default) Noncritical messages, such as marketing
  /// messages. Amazon SNS optimizes the message delivery to incur the lowest
  /// cost.
  ///
  /// *    `Transactional` – Critical messages that support customer
  /// transactions, such as one-time passcodes for multi-factor authentication.
  /// Amazon SNS optimizes the message delivery to achieve the highest
  /// reliability.
  ///
  ///
  ///  `UsageReportS3Bucket` – The name of the Amazon S3 bucket to receive daily
  /// SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a
  /// usage report as a CSV file to the bucket. The report includes the
  /// following information for each SMS message that was successfully delivered
  /// by your account:
  ///
  /// *   Time that the message was published (in UTC)
  ///
  /// *   Message ID
  ///
  /// *   Destination phone number
  ///
  /// *   Message type
  ///
  /// *   Delivery status
  ///
  /// *   Message price (in USD)
  ///
  /// *   Part number (a message is split into multiple parts if it is too long
  /// for a single message)
  ///
  /// *   Total number of parts
  ///
  ///
  /// To receive the report, the bucket must have a policy that allows the
  /// Amazon SNS service principle to perform the `s3:PutObject` and
  /// `s3:GetBucketLocation` actions.
  ///
  /// For an example bucket policy and usage report, see
  /// [Monitoring SMS Activity](https://docs.aws.amazon.com/sns/latest/dg/sms_stats.html)
  /// in the _Amazon SNS Developer Guide_.
  Future<SetSmsAttributesResponse> setSmsAttributes(
      Map<String, String> attributes) async {
    var response_ = await _client.send('SetSMSAttributes', {
      'attributes': attributes,
    });
    return SetSmsAttributesResponse.fromJson(response_);
  }

  /// Allows a subscription owner to set an attribute of the subscription to a
  /// new value.
  ///
  /// [subscriptionArn]: The ARN of the subscription to modify.
  ///
  /// [attributeName]: A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `SetTopicAttributes` action uses:
  ///
  /// *    `DeliveryPolicy` – The policy that defines how Amazon SNS retries
  /// failed deliveries to HTTP/S endpoints.
  ///
  /// *    `FilterPolicy` – The simple JSON object that lets your subscriber
  /// receive only a subset of messages, rather than receiving every message
  /// published to the topic.
  ///
  /// *    `RawMessageDelivery` – When set to `true`, enables raw message
  /// delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for
  /// the endpoints to process JSON formatting, which is otherwise created for
  /// Amazon SNS metadata.
  ///
  /// [attributeValue]: The new value for the attribute in JSON format.
  Future<void> setSubscriptionAttributes(
      {@required String subscriptionArn,
      @required String attributeName,
      String attributeValue}) async {
    await _client.send('SetSubscriptionAttributes', {
      'SubscriptionArn': subscriptionArn,
      'AttributeName': attributeName,
      if (attributeValue != null) 'AttributeValue': attributeValue,
    });
  }

  /// Allows a topic owner to set an attribute of the topic to a new value.
  ///
  /// [topicArn]: The ARN of the topic to modify.
  ///
  /// [attributeName]: A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `SetTopicAttributes` action uses:
  ///
  /// *    `DeliveryPolicy` – The policy that defines how Amazon SNS retries
  /// failed deliveries to HTTP/S endpoints.
  ///
  /// *    `DisplayName` – The display name to use for a topic with SMS
  /// subscriptions.
  ///
  /// *    `Policy` – The policy that defines who can access your topic. By
  /// default, only the topic owner can publish or subscribe to the topic.
  ///
  ///
  /// The following attribute applies only to
  /// [server-side-encryption](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html):
  ///
  /// *    `KmsMasterKeyId` - The ID of an AWS-managed customer master key (CMK)
  /// for Amazon SNS or a custom CMK. For more information, see
  /// [Key Terms](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms).
  /// For more examples, see
  /// [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
  /// in the _AWS Key Management Service API Reference_.
  ///
  /// [attributeValue]: The new value for the attribute.
  Future<void> setTopicAttributes(
      {@required String topicArn,
      @required String attributeName,
      String attributeValue}) async {
    await _client.send('SetTopicAttributes', {
      'TopicArn': topicArn,
      'AttributeName': attributeName,
      if (attributeValue != null) 'AttributeValue': attributeValue,
    });
  }

  /// Prepares to subscribe an endpoint by sending the endpoint a confirmation
  /// message. To actually create a subscription, the endpoint owner must call
  /// the `ConfirmSubscription` action with the token from the confirmation
  /// message. Confirmation tokens are valid for three days.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  ///
  /// [topicArn]: The ARN of the topic you want to subscribe to.
  ///
  /// [protocol]: The protocol you want to use. Supported protocols include:
  ///
  /// *    `http` – delivery of JSON-encoded message via HTTP POST
  ///
  /// *    `https` – delivery of JSON-encoded message via HTTPS POST
  ///
  /// *    `email` – delivery of message via SMTP
  ///
  /// *    `email-json` – delivery of JSON-encoded message via SMTP
  ///
  /// *    `sms` – delivery of message via SMS
  ///
  /// *    `sqs` – delivery of JSON-encoded message to an Amazon SQS queue
  ///
  /// *    `application` – delivery of JSON-encoded message to an EndpointArn
  /// for a mobile app and device.
  ///
  /// *    `lambda` – delivery of JSON-encoded message to an AWS Lambda
  /// function.
  ///
  /// [endpoint]: The endpoint that you want to receive notifications. Endpoints
  /// vary by protocol:
  ///
  /// *   For the `http` protocol, the endpoint is an URL beginning with
  /// "https://"
  ///
  /// *   For the `https` protocol, the endpoint is a URL beginning with
  /// "https://"
  ///
  /// *   For the `email` protocol, the endpoint is an email address
  ///
  /// *   For the `email-json` protocol, the endpoint is an email address
  ///
  /// *   For the `sms` protocol, the endpoint is a phone number of an
  /// SMS-enabled device
  ///
  /// *   For the `sqs` protocol, the endpoint is the ARN of an Amazon SQS queue
  ///
  /// *   For the `application` protocol, the endpoint is the EndpointArn of a
  /// mobile app and device.
  ///
  /// *   For the `lambda` protocol, the endpoint is the ARN of an AWS Lambda
  /// function.
  ///
  /// [attributes]: A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `SetTopicAttributes` action uses:
  ///
  /// *    `DeliveryPolicy` – The policy that defines how Amazon SNS retries
  /// failed deliveries to HTTP/S endpoints.
  ///
  /// *    `FilterPolicy` – The simple JSON object that lets your subscriber
  /// receive only a subset of messages, rather than receiving every message
  /// published to the topic.
  ///
  /// *    `RawMessageDelivery` – When set to `true`, enables raw message
  /// delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for
  /// the endpoints to process JSON formatting, which is otherwise created for
  /// Amazon SNS metadata.
  ///
  /// [returnSubscriptionArn]: Sets whether the response from the `Subscribe`
  /// request includes the subscription ARN, even if the subscription is not yet
  /// confirmed.
  ///
  /// If you set this parameter to `false`, the response includes the ARN for
  /// confirmed subscriptions, but it includes an ARN value of "pending
  /// subscription" for subscriptions that are not yet confirmed. A subscription
  /// becomes confirmed when the subscriber calls the `ConfirmSubscription`
  /// action with a confirmation token.
  ///
  /// If you set this parameter to `true`, the response includes the ARN in all
  /// cases, even if the subscription is not yet confirmed.
  ///
  /// The default value is `false`.
  Future<SubscribeResponse> subscribe(
      {@required String topicArn,
      @required String protocol,
      String endpoint,
      Map<String, String> attributes,
      bool returnSubscriptionArn}) async {
    var response_ = await _client.send('Subscribe', {
      'TopicArn': topicArn,
      'Protocol': protocol,
      if (endpoint != null) 'Endpoint': endpoint,
      if (attributes != null) 'Attributes': attributes,
      if (returnSubscriptionArn != null)
        'ReturnSubscriptionArn': returnSubscriptionArn,
    });
    return SubscribeResponse.fromJson(response_);
  }

  /// Add tags to the specified Amazon SNS topic. For an overview, see
  /// [Amazon SNS Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html)
  /// in the _Amazon SNS Developer Guide_.
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
  /// application requires a higher throughput, file a
  /// [technical support request](https://console.aws.amazon.com/support/home#/case/create?issueType=technical).
  ///
  ///
  /// For a full list of tag restrictions, see
  /// [Limits Related to Topics](https://docs.aws.amazon.com/sns/latest/dg/sns-limits.html#limits-topics)
  /// in the _Amazon SNS Developer Guide_.
  ///
  /// [resourceArn]: The ARN of the topic to which to add tags.
  ///
  /// [tags]: The tags to be added to the specified topic. A tag consists of a
  /// required key and an optional value.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Deletes a subscription. If the subscription requires authentication for
  /// deletion, only the owner of the subscription or the topic's owner can
  /// unsubscribe, and an AWS signature is required. If the `Unsubscribe` call
  /// does not require authentication and the requester is not the subscription
  /// owner, a final cancellation message is delivered to the endpoint, so that
  /// the endpoint owner can easily resubscribe to the topic if the
  /// `Unsubscribe` request was unintended.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  ///
  /// [subscriptionArn]: The ARN of the subscription to be deleted.
  Future<void> unsubscribe(String subscriptionArn) async {
    await _client.send('Unsubscribe', {
      'SubscriptionArn': subscriptionArn,
    });
  }

  /// Remove tags from the specified Amazon SNS topic. For an overview, see
  /// [Amazon SNS Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html)
  /// in the _Amazon SNS Developer Guide_.
  ///
  /// [resourceArn]: The ARN of the topic from which to remove tags.
  ///
  /// [tagKeys]: The list of tag keys to remove from the specified topic.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }
}

/// The response from the `CheckIfPhoneNumberIsOptedOut` action.
class CheckIfPhoneNumberIsOptedOutResponse {
  /// Indicates whether the phone number is opted out:
  ///
  /// *    `true` – The phone number is opted out, meaning you cannot publish
  /// SMS messages to it.
  ///
  /// *    `false` – The phone number is opted in, meaning you can publish SMS
  /// messages to it.
  final bool isOptedOut;

  CheckIfPhoneNumberIsOptedOutResponse({
    this.isOptedOut,
  });
  static CheckIfPhoneNumberIsOptedOutResponse fromJson(
          Map<String, dynamic> json) =>
      CheckIfPhoneNumberIsOptedOutResponse(
        isOptedOut:
            json.containsKey('isOptedOut') ? json['isOptedOut'] as bool : null,
      );
}

/// Response for ConfirmSubscriptions action.
class ConfirmSubscriptionResponse {
  /// The ARN of the created subscription.
  final String subscriptionArn;

  ConfirmSubscriptionResponse({
    this.subscriptionArn,
  });
  static ConfirmSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      ConfirmSubscriptionResponse(
        subscriptionArn: json.containsKey('SubscriptionArn')
            ? json['SubscriptionArn'] as String
            : null,
      );
}

/// Response from CreateEndpoint action.
class CreateEndpointResponse {
  /// EndpointArn returned from CreateEndpoint action.
  final String endpointArn;

  CreateEndpointResponse({
    this.endpointArn,
  });
  static CreateEndpointResponse fromJson(Map<String, dynamic> json) =>
      CreateEndpointResponse(
        endpointArn: json.containsKey('EndpointArn')
            ? json['EndpointArn'] as String
            : null,
      );
}

/// Response from CreatePlatformApplication action.
class CreatePlatformApplicationResponse {
  /// PlatformApplicationArn is returned.
  final String platformApplicationArn;

  CreatePlatformApplicationResponse({
    this.platformApplicationArn,
  });
  static CreatePlatformApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      CreatePlatformApplicationResponse(
        platformApplicationArn: json.containsKey('PlatformApplicationArn')
            ? json['PlatformApplicationArn'] as String
            : null,
      );
}

/// Response from CreateTopic action.
class CreateTopicResponse {
  /// The Amazon Resource Name (ARN) assigned to the created topic.
  final String topicArn;

  CreateTopicResponse({
    this.topicArn,
  });
  static CreateTopicResponse fromJson(Map<String, dynamic> json) =>
      CreateTopicResponse(
        topicArn:
            json.containsKey('TopicArn') ? json['TopicArn'] as String : null,
      );
}

/// Endpoint for mobile app and device.
class Endpoint {
  /// EndpointArn for mobile app and device.
  final String endpointArn;

  /// Attributes for endpoint.
  final Map<String, String> attributes;

  Endpoint({
    this.endpointArn,
    this.attributes,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        endpointArn: json.containsKey('EndpointArn')
            ? json['EndpointArn'] as String
            : null,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response from GetEndpointAttributes of the EndpointArn.
class GetEndpointAttributesResponse {
  /// Attributes include the following:
  ///
  /// *    `CustomUserData` – arbitrary user data to associate with the
  /// endpoint. Amazon SNS does not use this data. The data must be in UTF-8
  /// format and less than 2KB.
  ///
  /// *    `Enabled` – flag that enables/disables delivery to the endpoint.
  /// Amazon SNS will set this to false when a notification service indicates to
  /// Amazon SNS that the endpoint is invalid. Users can set it back to true,
  /// typically after updating Token.
  ///
  /// *    `Token` – device token, also referred to as a registration id, for an
  /// app and mobile device. This is returned from the notification service when
  /// an app and mobile device are registered with the notification service.
  final Map<String, String> attributes;

  GetEndpointAttributesResponse({
    this.attributes,
  });
  static GetEndpointAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetEndpointAttributesResponse(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response for GetPlatformApplicationAttributes action.
class GetPlatformApplicationAttributesResponse {
  /// Attributes include the following:
  ///
  /// *    `EventEndpointCreated` – Topic ARN to which EndpointCreated event
  /// notifications should be sent.
  ///
  /// *    `EventEndpointDeleted` – Topic ARN to which EndpointDeleted event
  /// notifications should be sent.
  ///
  /// *    `EventEndpointUpdated` – Topic ARN to which EndpointUpdate event
  /// notifications should be sent.
  ///
  /// *    `EventDeliveryFailure` – Topic ARN to which DeliveryFailure event
  /// notifications should be sent upon Direct Publish delivery failure
  /// (permanent) to one of the application's endpoints.
  final Map<String, String> attributes;

  GetPlatformApplicationAttributesResponse({
    this.attributes,
  });
  static GetPlatformApplicationAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetPlatformApplicationAttributesResponse(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The response from the `GetSMSAttributes` request.
class GetSmsAttributesResponse {
  /// The SMS attribute names and their values.
  final Map<String, String> attributes;

  GetSmsAttributesResponse({
    this.attributes,
  });
  static GetSmsAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetSmsAttributesResponse(
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response for GetSubscriptionAttributes action.
class GetSubscriptionAttributesResponse {
  /// A map of the subscription's attributes. Attributes in this map include the
  /// following:
  ///
  /// *    `ConfirmationWasAuthenticated` – `true` if the subscription
  /// confirmation request was authenticated.
  ///
  /// *    `DeliveryPolicy` – The JSON serialization of the subscription's
  /// delivery policy.
  ///
  /// *    `EffectiveDeliveryPolicy` – The JSON serialization of the effective
  /// delivery policy that takes into account the topic delivery policy and
  /// account system defaults.
  ///
  /// *    `FilterPolicy` – The filter policy JSON that is assigned to the
  /// subscription.
  ///
  /// *    `Owner` – The AWS account ID of the subscription's owner.
  ///
  /// *    `PendingConfirmation` – `true` if the subscription hasn't been
  /// confirmed. To confirm a pending subscription, call the
  /// `ConfirmSubscription` action with a confirmation token.
  ///
  /// *    `RawMessageDelivery` – `true` if raw message delivery is enabled for
  /// the subscription. Raw messages are free of JSON formatting and can be sent
  /// to HTTP/S and Amazon SQS endpoints.
  ///
  /// *    `SubscriptionArn` – The subscription's ARN.
  ///
  /// *    `TopicArn` – The topic ARN that the subscription is associated with.
  final Map<String, String> attributes;

  GetSubscriptionAttributesResponse({
    this.attributes,
  });
  static GetSubscriptionAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      GetSubscriptionAttributesResponse(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response for GetTopicAttributes action.
class GetTopicAttributesResponse {
  /// A map of the topic's attributes. Attributes in this map include the
  /// following:
  ///
  /// *    `TopicArn` – the topic's ARN
  ///
  /// *    `Owner` – the AWS account ID of the topic's owner
  ///
  /// *    `Policy` – the JSON serialization of the topic's access control
  /// policy
  ///
  /// *    `DisplayName` – the human-readable name used in the "From" field for
  /// notifications to email and email-json endpoints
  ///
  /// *    `SubscriptionsPending` – the number of subscriptions pending
  /// confirmation on this topic
  ///
  /// *    `SubscriptionsConfirmed` – the number of confirmed subscriptions on
  /// this topic
  ///
  /// *    `SubscriptionsDeleted` – the number of deleted subscriptions on this
  /// topic
  ///
  /// *    `DeliveryPolicy` – the JSON serialization of the topic's delivery
  /// policy
  ///
  /// *    `EffectiveDeliveryPolicy` – the JSON serialization of the effective
  /// delivery policy that takes into account system defaults
  final Map<String, String> attributes;

  GetTopicAttributesResponse({
    this.attributes,
  });
  static GetTopicAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetTopicAttributesResponse(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response for ListEndpointsByPlatformApplication action.
class ListEndpointsByPlatformApplicationResponse {
  /// Endpoints returned for ListEndpointsByPlatformApplication action.
  final List<Endpoint> endpoints;

  /// NextToken string is returned when calling
  /// ListEndpointsByPlatformApplication action if additional records are
  /// available after the first page results.
  final String nextToken;

  ListEndpointsByPlatformApplicationResponse({
    this.endpoints,
    this.nextToken,
  });
  static ListEndpointsByPlatformApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      ListEndpointsByPlatformApplicationResponse(
        endpoints: json.containsKey('Endpoints')
            ? (json['Endpoints'] as List)
                .map((e) => Endpoint.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The response from the `ListPhoneNumbersOptedOut` action.
class ListPhoneNumbersOptedOutResponse {
  /// A list of phone numbers that are opted out of receiving SMS messages. The
  /// list is paginated, and each page can contain up to 100 phone numbers.
  final List<String> phoneNumbers;

  /// A `NextToken` string is returned when you call the
  /// `ListPhoneNumbersOptedOut` action if additional records are available
  /// after the first page of results.
  final String nextToken;

  ListPhoneNumbersOptedOutResponse({
    this.phoneNumbers,
    this.nextToken,
  });
  static ListPhoneNumbersOptedOutResponse fromJson(Map<String, dynamic> json) =>
      ListPhoneNumbersOptedOutResponse(
        phoneNumbers: json.containsKey('phoneNumbers')
            ? (json['phoneNumbers'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Response for ListPlatformApplications action.
class ListPlatformApplicationsResponse {
  /// Platform applications returned when calling ListPlatformApplications
  /// action.
  final List<PlatformApplication> platformApplications;

  /// NextToken string is returned when calling ListPlatformApplications action
  /// if additional records are available after the first page results.
  final String nextToken;

  ListPlatformApplicationsResponse({
    this.platformApplications,
    this.nextToken,
  });
  static ListPlatformApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListPlatformApplicationsResponse(
        platformApplications: json.containsKey('PlatformApplications')
            ? (json['PlatformApplications'] as List)
                .map((e) => PlatformApplication.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Response for ListSubscriptionsByTopic action.
class ListSubscriptionsByTopicResponse {
  /// A list of subscriptions.
  final List<Subscription> subscriptions;

  /// Token to pass along to the next `ListSubscriptionsByTopic` request. This
  /// element is returned if there are more subscriptions to retrieve.
  final String nextToken;

  ListSubscriptionsByTopicResponse({
    this.subscriptions,
    this.nextToken,
  });
  static ListSubscriptionsByTopicResponse fromJson(Map<String, dynamic> json) =>
      ListSubscriptionsByTopicResponse(
        subscriptions: json.containsKey('Subscriptions')
            ? (json['Subscriptions'] as List)
                .map((e) => Subscription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Response for ListSubscriptions action
class ListSubscriptionsResponse {
  /// A list of subscriptions.
  final List<Subscription> subscriptions;

  /// Token to pass along to the next `ListSubscriptions` request. This element
  /// is returned if there are more subscriptions to retrieve.
  final String nextToken;

  ListSubscriptionsResponse({
    this.subscriptions,
    this.nextToken,
  });
  static ListSubscriptionsResponse fromJson(Map<String, dynamic> json) =>
      ListSubscriptionsResponse(
        subscriptions: json.containsKey('Subscriptions')
            ? (json['Subscriptions'] as List)
                .map((e) => Subscription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags associated with the specified topic.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Response for ListTopics action.
class ListTopicsResponse {
  /// A list of topic ARNs.
  final List<Topic> topics;

  /// Token to pass along to the next `ListTopics` request. This element is
  /// returned if there are additional topics to retrieve.
  final String nextToken;

  ListTopicsResponse({
    this.topics,
    this.nextToken,
  });
  static ListTopicsResponse fromJson(Map<String, dynamic> json) =>
      ListTopicsResponse(
        topics: json.containsKey('Topics')
            ? (json['Topics'] as List).map((e) => Topic.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The user-specified message attribute value. For string data types, the value
/// attribute has the same restrictions on the content as the message body. For
/// more information, see
/// [Publish](https://docs.aws.amazon.com/sns/latest/api/API_Publish.html).
///
/// Name, type, and value must not be empty or null. In addition, the message
/// body should not be empty or null. All parts of the message attribute,
/// including name, type, and value, are included in the message size
/// restriction, which is currently 256 KB (262,144 bytes). For more
/// information, see
/// [Using Amazon SNS Message Attributes](https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html).
class MessageAttributeValue {
  /// Amazon SNS supports the following logical data types: String,
  /// String.Array, Number, and Binary. For more information, see
  /// [Message Attribute Data Types](https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes).
  final String dataType;

  /// Strings are Unicode with UTF8 binary encoding. For a list of code values,
  /// see
  /// [ASCII Printable Characters](https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
  final String stringValue;

  /// Binary type attributes can store any binary data, for example, compressed
  /// data, encrypted data, or images.
  final Uint8List binaryValue;

  MessageAttributeValue({
    @required this.dataType,
    this.stringValue,
    this.binaryValue,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response for the OptInPhoneNumber action.
class OptInPhoneNumberResponse {
  OptInPhoneNumberResponse();
  static OptInPhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      OptInPhoneNumberResponse();
}

/// Platform application object.
class PlatformApplication {
  /// PlatformApplicationArn for platform application object.
  final String platformApplicationArn;

  /// Attributes for platform application object.
  final Map<String, String> attributes;

  PlatformApplication({
    this.platformApplicationArn,
    this.attributes,
  });
  static PlatformApplication fromJson(Map<String, dynamic> json) =>
      PlatformApplication(
        platformApplicationArn: json.containsKey('PlatformApplicationArn')
            ? json['PlatformApplicationArn'] as String
            : null,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Response for Publish action.
class PublishResponse {
  /// Unique identifier assigned to the published message.
  ///
  /// Length Constraint: Maximum 100 characters
  final String messageId;

  PublishResponse({
    this.messageId,
  });
  static PublishResponse fromJson(Map<String, dynamic> json) => PublishResponse(
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
      );
}

/// The response for the SetSMSAttributes action.
class SetSmsAttributesResponse {
  SetSmsAttributesResponse();
  static SetSmsAttributesResponse fromJson(Map<String, dynamic> json) =>
      SetSmsAttributesResponse();
}

/// Response for Subscribe action.
class SubscribeResponse {
  /// The ARN of the subscription if it is confirmed, or the string "pending
  /// confirmation" if the subscription requires confirmation. However, if the
  /// API request parameter `ReturnSubscriptionArn` is true, then the value is
  /// always the subscription ARN, even if the subscription requires
  /// confirmation.
  final String subscriptionArn;

  SubscribeResponse({
    this.subscriptionArn,
  });
  static SubscribeResponse fromJson(Map<String, dynamic> json) =>
      SubscribeResponse(
        subscriptionArn: json.containsKey('SubscriptionArn')
            ? json['SubscriptionArn'] as String
            : null,
      );
}

/// A wrapper type for the attributes of an Amazon SNS subscription.
class Subscription {
  /// The subscription's ARN.
  final String subscriptionArn;

  /// The subscription's owner.
  final String owner;

  /// The subscription's protocol.
  final String protocol;

  /// The subscription's endpoint (format depends on the protocol).
  final String endpoint;

  /// The ARN of the subscription's topic.
  final String topicArn;

  Subscription({
    this.subscriptionArn,
    this.owner,
    this.protocol,
    this.endpoint,
    this.topicArn,
  });
  static Subscription fromJson(Map<String, dynamic> json) => Subscription(
        subscriptionArn: json.containsKey('SubscriptionArn')
            ? json['SubscriptionArn'] as String
            : null,
        owner: json.containsKey('Owner') ? json['Owner'] as String : null,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        endpoint:
            json.containsKey('Endpoint') ? json['Endpoint'] as String : null,
        topicArn:
            json.containsKey('TopicArn') ? json['TopicArn'] as String : null,
      );
}

/// The list of tags to be added to the specified topic.
class Tag {
  /// The required key portion of the tag.
  final String key;

  /// The optional value portion of the tag.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a
/// topic's attributes, use `GetTopicAttributes`.
class Topic {
  /// The topic's ARN.
  final String topicArn;

  Topic({
    this.topicArn,
  });
  static Topic fromJson(Map<String, dynamic> json) => Topic(
        topicArn:
            json.containsKey('TopicArn') ? json['TopicArn'] as String : null,
      );
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}
