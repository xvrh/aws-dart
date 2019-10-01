import 'package:meta/meta.dart';

/// The Amazon Connect API Reference provides descriptions, syntax, and usage
/// examples for each of the Amazon Connect actions, data types, parameters, and
/// errors. Amazon Connect is a cloud-based contact center solution that makes
/// it easy to set up and manage a customer contact center and provide reliable
/// customer engagement at any scale.
///
/// Throttling limits for the Amazon Connect API operations:
///
/// For the `GetMetricData` and `GetCurrentMetricData` operations, a RateLimit
/// of 5 per second, and a BurstLimit of 8 per second.
///
/// For all other operations, a RateLimit of 2 per second, and a BurstLimit of 5
/// per second.
///
/// You can request an increase to the throttling limits by submitting a [Amazon
/// Connect service limits increase
/// form](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase).
/// You must be signed in to your AWS account to access the form.
class ConnectApi {
  /// Creates a new user account in your Amazon Connect instance.
  ///
  /// [username]: The user name in Amazon Connect for the account to create. If
  /// you are using SAML for identity management in your Amazon Connect, the
  /// value for `Username` can include up to 64 characters from
  /// \[a-zA-Z0-9_-.\\@\]+.
  ///
  /// [password]: The password for the user account to create. This is required
  /// if you are using Amazon Connect for identity management. If you are using
  /// SAML for identity management and include this parameter, an
  /// `InvalidRequestException` is returned.
  ///
  /// [identityInfo]: Information about the user, including email address, first
  /// name, and last name.
  ///
  /// [phoneConfig]: Specifies the phone settings for the user, including
  /// `AfterContactWorkTimeLimit`, `AutoAccept`, `DeskPhoneNumber`, and
  /// `PhoneType`.
  ///
  /// [directoryUserId]: The unique identifier for the user account in the
  /// directory service directory used for identity management. If Amazon
  /// Connect is unable to access the existing directory, you can use the
  /// `DirectoryUserId` to authenticate users. If you include the parameter, it
  /// is assumed that Amazon Connect cannot access the directory. If the
  /// parameter is not included, the `UserIdentityInfo` is used to authenticate
  /// users from your existing directory.
  ///
  /// This parameter is required if you are using an existing directory for
  /// identity management in Amazon Connect when Amazon Connect cannot access
  /// your directory to authenticate users. If you are using SAML for identity
  /// management and include this parameter, an `InvalidRequestException` is
  /// returned.
  ///
  /// [securityProfileIds]: The unique identifier of the security profile to
  /// assign to the user created.
  ///
  /// [routingProfileId]: The unique identifier for the routing profile to
  /// assign to the user created.
  ///
  /// [hierarchyGroupId]: The unique identifier for the hierarchy group to
  /// assign to the user created.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<CreateUserResponse> createUser(
      {@required String username,
      String password,
      UserIdentityInfo identityInfo,
      @required UserPhoneConfig phoneConfig,
      String directoryUserId,
      @required List<String> securityProfileIds,
      @required String routingProfileId,
      String hierarchyGroupId,
      @required String instanceId}) async {
    return CreateUserResponse.fromJson({});
  }

  /// Deletes a user account from Amazon Connect.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [userId]: The unique identifier of the user to delete.
  Future<void> deleteUser(
      {@required String instanceId, @required String userId}) async {}

  /// Returns a `User` object that contains information about the user account
  /// specified by the `UserId`.
  ///
  /// [userId]: Unique identifier for the user account to return.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<DescribeUserResponse> describeUser(
      {@required String userId, @required String instanceId}) async {
    return DescribeUserResponse.fromJson({});
  }

  /// Returns a `HierarchyGroup` object that includes information about a
  /// hierarchy group in your instance.
  ///
  /// [hierarchyGroupId]: The identifier for the hierarchy group to return.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<DescribeUserHierarchyGroupResponse> describeUserHierarchyGroup(
      {@required String hierarchyGroupId, @required String instanceId}) async {
    return DescribeUserHierarchyGroupResponse.fromJson({});
  }

  /// Returns a `HiearchyGroupStructure` object, which contains data about the
  /// levels in the agent hierarchy.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<DescribeUserHierarchyStructureResponse> describeUserHierarchyStructure(
      String instanceId) async {
    return DescribeUserHierarchyStructureResponse.fromJson({});
  }

  /// Retrieves the contact attributes associated with a contact.
  ///
  /// [instanceId]: The instance ID for the instance from which to retrieve
  /// contact attributes.
  ///
  /// [initialContactId]: The ID for the initial contact in Amazon Connect
  /// associated with the attributes to update.
  Future<GetContactAttributesResponse> getContactAttributes(
      {@required String instanceId, @required String initialContactId}) async {
    return GetContactAttributesResponse.fromJson({});
  }

  /// The `GetCurrentMetricData` operation retrieves current metric data from
  /// your Amazon Connect instance.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:GetCurrentMetricData` action.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [filters]: A `Filters` object that contains a list of queue IDs or queue
  /// ARNs, up to 100, or list of Channels to use to filter the metrics returned
  /// in the response. Metric data is retrieved only for the resources
  /// associated with the queue IDs, ARNs, or Channels included in the filter.
  /// You can include both IDs and ARNs in the same request. To retrieve metrics
  /// for all queues, add the queue ID or ARN for each queue in your instance.
  /// Only VOICE is supported for Channels.
  ///
  /// To find the ARN for a queue, open the queue you want to use in the Amazon
  /// Connect Queue editor. The ARN for the queue is displayed in the address
  /// bar as part of the URL. For example, the queue ARN is the set of
  /// characters at the end of the URL, after 'id=' such as
  /// `arn:aws:connect:us-east-1:270923740243:instance/78fb859d-1b7d-44b1-8aa3-12f0835c5855/queue/1d1a4575-9618-40ab-bbeb-81e45795fe61`.
  /// The queue ID is also included in the URL, and is the string after
  /// 'queue/'.
  ///
  /// [groupings]: The grouping applied to the metrics returned. For example,
  /// when grouped by QUEUE, the metrics returned apply to each queue rather
  /// than aggregated for all queues. If you group by CHANNEL, you should
  /// include a Channels filter. The only supported channel is VOICE.
  ///
  /// If no `Grouping` is included in the request, a summary of `CurrentMetrics`
  /// is returned.
  ///
  /// [currentMetrics]: A list of `CurrentMetric` objects for the metrics to
  /// retrieve. Each `CurrentMetric` includes a name of a metric to retrieve and
  /// the unit to use for it. You must list each metric to retrieve data for in
  /// the request.
  ///
  /// The following metrics are available:
  ///
  /// AGENTS_AVAILABLE
  ///
  /// Unit: COUNT
  ///
  /// AGENTS_ONLINE
  ///
  /// Unit: COUNT
  ///
  /// AGENTS\_ON\_CALL
  ///
  /// Unit: COUNT
  ///
  /// AGENTS_STAFFED
  ///
  /// Unit: COUNT
  ///
  /// AGENTS\_AFTER\_CONTACT_WORK
  ///
  /// Unit: COUNT
  ///
  /// AGENTS\_NON\_PRODUCTIVE
  ///
  /// Unit: COUNT
  ///
  /// AGENTS_ERROR
  ///
  /// Unit: COUNT
  ///
  /// CONTACTS\_IN\_QUEUE
  ///
  /// Unit: COUNT
  ///
  /// OLDEST\_CONTACT\_AGE
  ///
  /// Unit: SECONDS
  ///
  /// CONTACTS_SCHEDULED
  ///
  /// Unit: COUNT
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the [NextToken]() must use the same request parameters
  /// as the request that generated the token.
  ///
  /// [maxResults]:  `MaxResults` indicates the maximum number of results to
  /// return per page in the response, between 1 and 100.
  Future<GetCurrentMetricDataResponse> getCurrentMetricData(
      {@required String instanceId,
      @required Filters filters,
      List<String> groupings,
      @required List<CurrentMetric> currentMetrics,
      String nextToken,
      int maxResults}) async {
    return GetCurrentMetricDataResponse.fromJson({});
  }

  /// Retrieves a token for federation.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<GetFederationTokenResponse> getFederationToken(
      String instanceId) async {
    return GetFederationTokenResponse.fromJson({});
  }

  /// The `GetMetricData` operation retrieves historical metrics data from your
  /// Amazon Connect instance.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:GetMetricData` action.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [startTime]: The timestamp, in UNIX Epoch time format, at which to start
  /// the reporting interval for the retrieval of historical metrics data. The
  /// time must be specified using a multiple of 5 minutes, such as 10:05,
  /// 10:10, 10:15.
  ///
  ///  `StartTime` cannot be earlier than 24 hours before the time of the
  /// request. Historical metrics are available in Amazon Connect only for 24
  /// hours.
  ///
  /// [endTime]: The timestamp, in UNIX Epoch time format, at which to end the
  /// reporting interval for the retrieval of historical metrics data. The time
  /// must be specified using an interval of 5 minutes, such as 11:00, 11:05,
  /// 11:10, and must be later than the `StartTime` timestamp.
  ///
  /// The time range between `StartTime` and `EndTime` must be less than 24
  /// hours.
  ///
  /// [filters]: A `Filters` object that contains a list of queue IDs or queue
  /// ARNs, up to 100, or a list of Channels to use to filter the metrics
  /// returned in the response. Metric data is retrieved only for the resources
  /// associated with the IDs, ARNs, or Channels included in the filter. You can
  /// use both IDs and ARNs together in a request. Only VOICE is supported for
  /// Channel.
  ///
  /// To find the ARN for a queue, open the queue you want to use in the Amazon
  /// Connect Queue editor. The ARN for the queue is displayed in the address
  /// bar as part of the URL. For example, the queue ARN is the set of
  /// characters at the end of the URL, after 'id=' such as
  /// `arn:aws:connect:us-east-1:270923740243:instance/78fb859d-1b7d-44b1-8aa3-12f0835c5855/queue/1d1a4575-9618-40ab-bbeb-81e45795fe61`.
  /// The queue ID is also included in the URL, and is the string after
  /// 'queue/'.
  ///
  /// [groupings]: The grouping applied to the metrics returned. For example,
  /// when results are grouped by queueId, the metrics returned are grouped by
  /// queue. The values returned apply to the metrics for each queue rather than
  /// aggregated for all queues.
  ///
  /// The current version supports grouping by Queue
  ///
  /// If no `Grouping` is included in the request, a summary of
  /// `HistoricalMetrics` for all queues is returned.
  ///
  /// [historicalMetrics]: A list of `HistoricalMetric` objects that contain the
  /// metrics to retrieve with the request.
  ///
  /// A `HistoricalMetric` object contains: `HistoricalMetricName`, `Statistic`,
  /// `Threshold`, and `Unit`.
  ///
  /// You must list each metric to retrieve data for in the request. For each
  /// historical metric you include in the request, you must include a `Unit`
  /// and a `Statistic`.
  ///
  /// The following historical metrics are available:
  ///
  /// CONTACTS_QUEUED
  ///
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  ///
  /// CONTACTS_HANDLED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS_ABANDONED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS_CONSULTED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_AGENT\_HUNG\_UP\_FIRST
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_HANDLED\_INCOMING
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_HANDLED\_OUTBOUND
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_HOLD\_ABANDONS
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_TRANSFERRED\_IN
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_TRANSFERRED\_OUT
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_TRANSFERRED\_IN\_FROM\_QUEUE
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS\_TRANSFERRED\_OUT\_FROM\_QUEUE
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CALLBACK\_CONTACTS\_HANDLED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CALLBACK\_CONTACTS\_HANDLED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// API\_CONTACTS\_HANDLED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// CONTACTS_MISSED
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// OCCUPANCY
  ///
  /// Unit: PERCENT
  ///
  /// Statistics: AVG
  ///
  /// HANDLE_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// AFTER\_CONTACT\_WORK_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// QUEUED_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: MAX
  ///
  /// ABANDON_TIME
  ///
  /// Unit: COUNT
  ///
  /// Statistics: SUM
  ///
  /// QUEUE\_ANSWER\_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// HOLD_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// INTERACTION_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// INTERACTION\_AND\_HOLD_TIME
  ///
  /// Unit: SECONDS
  ///
  /// Statistics: AVG
  ///
  /// SERVICE_LEVEL
  ///
  /// Unit: PERCENT
  ///
  /// Statistics: AVG
  ///
  /// Threshold: Only "Less than" comparisons are supported, with the following
  /// service level thresholds: 15, 20, 25, 30, 45, 60, 90, 120, 180, 240, 300,
  /// 600
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// [maxResults]: Indicates the maximum number of results to return per page
  /// in the response, between 1-100.
  Future<GetMetricDataResponse> getMetricData(
      {@required String instanceId,
      @required DateTime startTime,
      @required DateTime endTime,
      @required Filters filters,
      List<String> groupings,
      @required List<HistoricalMetric> historicalMetrics,
      String nextToken,
      int maxResults}) async {
    return GetMetricDataResponse.fromJson({});
  }

  /// Returns an array of `RoutingProfileSummary` objects that includes
  /// information about the routing profiles in your instance.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// [maxResults]: The maximum number of routing profiles to return in the
  /// response.
  Future<ListRoutingProfilesResponse> listRoutingProfiles(String instanceId,
      {String nextToken, int maxResults}) async {
    return ListRoutingProfilesResponse.fromJson({});
  }

  /// Returns an array of SecurityProfileSummary objects that contain
  /// information about the security profiles in your instance, including the
  /// ARN, Id, and Name of the security profile.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// [maxResults]: The maximum number of security profiles to return.
  Future<ListSecurityProfilesResponse> listSecurityProfiles(String instanceId,
      {String nextToken, int maxResults}) async {
    return ListSecurityProfilesResponse.fromJson({});
  }

  /// Returns a `UserHierarchyGroupSummaryList`, which is an array of
  /// `HierarchyGroupSummary` objects that contain information about the
  /// hierarchy groups in your instance.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// [maxResults]: The maximum number of hierarchy groups to return.
  Future<ListUserHierarchyGroupsResponse> listUserHierarchyGroups(
      String instanceId,
      {String nextToken,
      int maxResults}) async {
    return ListUserHierarchyGroupsResponse.fromJson({});
  }

  /// Returns a `UserSummaryList`, which is an array of `UserSummary` objects.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [nextToken]: The token for the next set of results. Use the value returned
  /// in the previous response in the next request to retrieve the next set of
  /// results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<ListUsersResponse> listUsers(String instanceId,
      {String nextToken, int maxResults}) async {
    return ListUsersResponse.fromJson({});
  }

  /// The `StartOutboundVoiceContact` operation initiates a contact flow to
  /// place an outbound call to a customer.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:StartOutboundVoiceContact` action.
  ///
  /// There is a 60 second dialing timeout for this operation. If the call is
  /// not connected after 60 seconds, the call fails.
  ///
  /// [destinationPhoneNumber]: The phone number of the customer in E.164
  /// format.
  ///
  /// [contactFlowId]: The identifier for the contact flow to connect the
  /// outbound call to.
  ///
  /// To find the `ContactFlowId`, open the contact flow you want to use in the
  /// Amazon Connect contact flow editor. The ID for the contact flow is
  /// displayed in the address bar as part of the URL. For example, the contact
  /// flow ID is the set of characters at the end of the URL, after
  /// 'contact-flow/' such as `78ea8fd5-2659-4f2b-b528-699760ccfc1b`.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. The token is valid for 7 days after
  /// creation. If a contact is already started, the contact ID is returned. If
  /// the contact is disconnected, a new contact is started.
  ///
  /// [sourcePhoneNumber]: The phone number, in E.164 format, associated with
  /// your Amazon Connect instance to use for the outbound call.
  ///
  /// [queueId]: The queue to add the call to. If you specify a queue, the phone
  /// displayed for caller ID is the phone number specified in the queue. If you
  /// do not specify a queue, the queue used will be the queue defined in the
  /// contact flow.
  ///
  /// To find the `QueueId`, open the queue you want to use in the Amazon
  /// Connect Queue editor. The ID for the queue is displayed in the address bar
  /// as part of the URL. For example, the queue ID is the set of characters at
  /// the end of the URL, after 'queue/' such as
  /// `queue/aeg40574-2d01-51c3-73d6-bf8624d2168c`.
  ///
  /// [attributes]: Specify a custom key-value pair using an attribute map. The
  /// attributes are standard Amazon Connect attributes, and can be accessed in
  /// contact flows just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// For example, if you want play a greeting when the customer answers the
  /// call, you can pass the customer name in attributes similar to the
  /// following:
  Future<StartOutboundVoiceContactResponse> startOutboundVoiceContact(
      {@required String destinationPhoneNumber,
      @required String contactFlowId,
      @required String instanceId,
      String clientToken,
      String sourcePhoneNumber,
      String queueId,
      Map<String, String> attributes}) async {
    return StartOutboundVoiceContactResponse.fromJson({});
  }

  /// Ends the contact initiated by the `StartOutboundVoiceContact` operation.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:StopContact` action.
  ///
  /// [contactId]: The unique identifier of the contact to end.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<StopContactResponse> stopContact(
      {@required String contactId, @required String instanceId}) async {
    return StopContactResponse.fromJson({});
  }

  /// The `UpdateContactAttributes` operation lets you programmatically create
  /// new, or update existing, contact attributes associated with a contact. You
  /// can use the operation to add or update attributes for both ongoing and
  /// completed contacts. For example, you can update the customer's name or the
  /// reason the customer called while the call is active, or add notes about
  /// steps that the agent took during the call that are displayed to the next
  /// agent that takes the call. You can also use the `UpdateContactAttributes`
  /// operation to update attributes for a contact using data from your CRM
  /// application and save the data with the contact in Amazon Connect. You
  /// could also flag calls for additional analysis, such as legal review or
  /// identifying abusive callers.
  ///
  /// Contact attributes are available in Amazon Connect for 24 months, and are
  /// then deleted.
  ///
  ///  _Important:_
  ///
  /// You cannot use the operation to update attributes for contacts that
  /// occurred prior to the release of the API, September 12, 2018. You can
  /// update attributes only for contacts that started after the release of the
  /// API. If you attempt to update attributes for a contact that occurred prior
  /// to the release of the API, a 400 error is returned. This applies also to
  /// queued callbacks that were initiated prior to the release of the API but
  /// are still active in your instance.
  ///
  /// [initialContactId]: The unique identifier of the contact for which to
  /// update attributes. This is the identifier for the contact associated with
  /// the first interaction with the contact center.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  ///
  /// [attributes]: Specify a custom key-value pair using an attribute map. The
  /// attributes are standard Amazon Connect attributes, and can be accessed in
  /// contact flows just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  Future<UpdateContactAttributesResponse> updateContactAttributes(
      {@required String initialContactId,
      @required String instanceId,
      @required Map<String, String> attributes}) async {
    return UpdateContactAttributesResponse.fromJson({});
  }

  /// Assigns the specified hierarchy group to the user.
  ///
  /// [hierarchyGroupId]: The identifier for the hierarchy group to assign to
  /// the user.
  ///
  /// [userId]: The identifier of the user account to assign the hierarchy group
  /// to.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<void> updateUserHierarchy(
      {String hierarchyGroupId,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the identity information for the specified user in a
  /// `UserIdentityInfo` object, including email, first name, and last name.
  ///
  /// [identityInfo]: A `UserIdentityInfo` object.
  ///
  /// [userId]: The identifier for the user account to update identity
  /// information for.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<void> updateUserIdentityInfo(
      {@required UserIdentityInfo identityInfo,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the phone configuration settings in the `UserPhoneConfig` object
  /// for the specified user.
  ///
  /// [phoneConfig]: A `UserPhoneConfig` object that contains settings for
  /// `AfterContactWorkTimeLimit`, `AutoAccept`, `DeskPhoneNumber`, and
  /// `PhoneType` to assign to the user.
  ///
  /// [userId]: The identifier for the user account to change phone settings
  /// for.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<void> updateUserPhoneConfig(
      {@required UserPhoneConfig phoneConfig,
      @required String userId,
      @required String instanceId}) async {}

  /// Assigns the specified routing profile to a user.
  ///
  /// [routingProfileId]: The identifier of the routing profile to assign to the
  /// user.
  ///
  /// [userId]: The identifier for the user account to assign the routing
  /// profile to.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<void> updateUserRoutingProfile(
      {@required String routingProfileId,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the security profiles assigned to the user.
  ///
  /// [securityProfileIds]: The identifiers for the security profiles to assign
  /// to the user.
  ///
  /// [userId]: The identifier of the user account to assign the security
  /// profiles.
  ///
  /// [instanceId]: The identifier for your Amazon Connect instance. To find the
  /// ID of your instance, open the AWS console and select Amazon Connect.
  /// Select the alias of the instance in the Instance alias column. The
  /// instance ID is displayed in the Overview section of your instance
  /// settings. For example, the instance ID is the set of characters at the end
  /// of the instance ARN, after instance/, such as
  /// 10a4c4eb-f57e-4d4c-b602-bf39176ced07.
  Future<void> updateUserSecurityProfiles(
      {@required List<String> securityProfileIds,
      @required String userId,
      @required String instanceId}) async {}
}

class CreateUserResponse {
  /// The unique identifier for the user account in Amazon Connect
  final String userId;

  /// The Amazon Resource Name (ARN) of the user account created.
  final String userArn;

  CreateUserResponse({
    this.userId,
    this.userArn,
  });
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse();
}

class Credentials {
  /// An access token generated for a federated user to access Amazon Connect
  final String accessToken;

  /// A token generated with an expiration time for the session a user is logged
  /// in to Amazon Connect
  final DateTime accessTokenExpiration;

  /// Renews a token generated for a user to access the Amazon Connect instance.
  final String refreshToken;

  /// Renews the expiration timer for a generated token.
  final DateTime refreshTokenExpiration;

  Credentials({
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
  });
  static Credentials fromJson(Map<String, dynamic> json) => Credentials();
}

class CurrentMetric {
  /// The name of the metric.
  final String name;

  /// The unit for the metric.
  final String unit;

  CurrentMetric({
    this.name,
    this.unit,
  });
  static CurrentMetric fromJson(Map<String, dynamic> json) => CurrentMetric();
}

class CurrentMetricData {
  /// The metric in a `CurrentMetricData` object.
  final CurrentMetric metric;

  /// The value of the metric in the CurrentMetricData object.
  final double value;

  CurrentMetricData({
    this.metric,
    this.value,
  });
  static CurrentMetricData fromJson(Map<String, dynamic> json) =>
      CurrentMetricData();
}

class CurrentMetricResult {
  /// The `Dimensions` for the `CurrentMetricResult` object.
  final Dimensions dimensions;

  /// The `Collections` for the `CurrentMetricResult` object.
  final List<CurrentMetricData> collections;

  CurrentMetricResult({
    this.dimensions,
    this.collections,
  });
  static CurrentMetricResult fromJson(Map<String, dynamic> json) =>
      CurrentMetricResult();
}

class DescribeUserHierarchyGroupResponse {
  /// Returns a `HierarchyGroup` object.
  final HierarchyGroup hierarchyGroup;

  DescribeUserHierarchyGroupResponse({
    this.hierarchyGroup,
  });
  static DescribeUserHierarchyGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeUserHierarchyGroupResponse();
}

class DescribeUserHierarchyStructureResponse {
  /// A `HierarchyStructure` object.
  final HierarchyStructure hierarchyStructure;

  DescribeUserHierarchyStructureResponse({
    this.hierarchyStructure,
  });
  static DescribeUserHierarchyStructureResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeUserHierarchyStructureResponse();
}

class DescribeUserResponse {
  /// A `User` object that contains information about the user account and
  /// configuration settings.
  final User user;

  DescribeUserResponse({
    this.user,
  });
  static DescribeUserResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserResponse();
}

class Dimensions {
  /// A `QueueReference` object used as one part of dimension for the metrics
  /// results.
  final QueueReference queue;

  /// The channel used for grouping and filters. Only VOICE is supported.
  final String channel;

  Dimensions({
    this.queue,
    this.channel,
  });
  static Dimensions fromJson(Map<String, dynamic> json) => Dimensions();
}

class Filters {
  /// A list of up to 100 queue IDs or queue ARNs to use to filter the metrics
  /// retrieved. You can include both IDs and ARNs in a request.
  final List<String> queues;

  /// The Channel to use as a filter for the metrics returned. Only VOICE is
  /// supported.
  final List<String> channels;

  Filters({
    this.queues,
    this.channels,
  });
}

class GetContactAttributesResponse {
  /// The attributes to update.
  final Map<String, String> attributes;

  GetContactAttributesResponse({
    this.attributes,
  });
  static GetContactAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetContactAttributesResponse();
}

class GetCurrentMetricDataResponse {
  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the NextToken must use the same request parameters as
  /// the request that generated the token.
  final String nextToken;

  /// A list of `CurrentMetricResult` objects organized by `Dimensions`
  /// combining with `CurrentMetricDataCollections`.
  ///
  ///  `Dimensions` is the resourceId specified in the `Filters` of the request.
  ///
  ///  `Collections` is a list of `CurrentMetricData` objects with corresponding
  /// values to the `CurrentMetrics` specified in the request.
  ///
  /// If no `Grouping` is specified in the request, `Collections` is a summary
  /// for the `CurrentMetric` returned.
  final List<CurrentMetricResult> metricResults;

  /// The time at which `CurrentMetricData` was retrieved and cached for
  /// pagination.
  final DateTime dataSnapshotTime;

  GetCurrentMetricDataResponse({
    this.nextToken,
    this.metricResults,
    this.dataSnapshotTime,
  });
  static GetCurrentMetricDataResponse fromJson(Map<String, dynamic> json) =>
      GetCurrentMetricDataResponse();
}

class GetFederationTokenResponse {
  /// The credentials to use for federation.
  final Credentials credentials;

  GetFederationTokenResponse({
    this.credentials,
  });
  static GetFederationTokenResponse fromJson(Map<String, dynamic> json) =>
      GetFederationTokenResponse();
}

class GetMetricDataResponse {
  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the NextToken must use the same request parameters as
  /// the request that generated the token.
  final String nextToken;

  /// A list of `HistoricalMetricResult` objects, organized by `Dimensions`,
  /// which is the ID of the resource specified in the `Filters` used for the
  /// request. The metrics are combined with the metrics included in
  /// `Collections`, which is a list of `HisotricalMetricData` objects.
  ///
  /// If no `Grouping` is specified in the request, `Collections` includes
  /// summary data for the `HistoricalMetrics`.
  final List<HistoricalMetricResult> metricResults;

  GetMetricDataResponse({
    this.nextToken,
    this.metricResults,
  });
  static GetMetricDataResponse fromJson(Map<String, dynamic> json) =>
      GetMetricDataResponse();
}

class HierarchyGroup {
  /// The identifier for the hierarchy group.
  final String id;

  /// The Amazon Resource Name (ARN) for the hierarchy group.
  final String arn;

  /// The name of the hierarchy group in your instance.
  final String name;

  /// The identifier for the level in the hierarchy group.
  final String levelId;

  /// A `HierarchyPath` object that contains information about the levels in the
  /// hierarchy group.
  final HierarchyPath hierarchyPath;

  HierarchyGroup({
    this.id,
    this.arn,
    this.name,
    this.levelId,
    this.hierarchyPath,
  });
  static HierarchyGroup fromJson(Map<String, dynamic> json) => HierarchyGroup();
}

class HierarchyGroupSummary {
  /// The identifier of the hierarchy group.
  final String id;

  /// The ARN for the hierarchy group.
  final String arn;

  /// The name of the hierarchy group.
  final String name;

  HierarchyGroupSummary({
    this.id,
    this.arn,
    this.name,
  });
  static HierarchyGroupSummary fromJson(Map<String, dynamic> json) =>
      HierarchyGroupSummary();
}

class HierarchyLevel {
  /// The identifier for the hierarchy group level.
  final String id;

  /// The ARN for the hierarchy group level.
  final String arn;

  /// The name of the hierarchy group level.
  final String name;

  HierarchyLevel({
    this.id,
    this.arn,
    this.name,
  });
  static HierarchyLevel fromJson(Map<String, dynamic> json) => HierarchyLevel();
}

class HierarchyPath {
  /// A `HierarchyGroupSummary` object that contains information about the level
  /// of the hierarchy group, including ARN, Id, and Name.
  final HierarchyGroupSummary levelOne;

  /// A `HierarchyGroupSummary` object that contains information about the level
  /// of the hierarchy group, including ARN, Id, and Name.
  final HierarchyGroupSummary levelTwo;

  /// A `HierarchyGroupSummary` object that contains information about the level
  /// of the hierarchy group, including ARN, Id, and Name.
  final HierarchyGroupSummary levelThree;

  /// A `HierarchyGroupSummary` object that contains information about the level
  /// of the hierarchy group, including ARN, Id, and Name.
  final HierarchyGroupSummary levelFour;

  /// A `HierarchyGroupSummary` object that contains information about the level
  /// of the hierarchy group, including ARN, Id, and Name.
  final HierarchyGroupSummary levelFive;

  HierarchyPath({
    this.levelOne,
    this.levelTwo,
    this.levelThree,
    this.levelFour,
    this.levelFive,
  });
  static HierarchyPath fromJson(Map<String, dynamic> json) => HierarchyPath();
}

class HierarchyStructure {
  /// A `HierarchyLevel` object that contains information about the hierarchy
  /// group level.
  final HierarchyLevel levelOne;

  /// A `HierarchyLevel` object that contains information about the hierarchy
  /// group level.
  final HierarchyLevel levelTwo;

  /// A `HierarchyLevel` object that contains information about the hierarchy
  /// group level.
  final HierarchyLevel levelThree;

  /// A `HierarchyLevel` object that contains information about the hierarchy
  /// group level.
  final HierarchyLevel levelFour;

  /// A `HierarchyLevel` object that contains information about the hierarchy
  /// group level.
  final HierarchyLevel levelFive;

  HierarchyStructure({
    this.levelOne,
    this.levelTwo,
    this.levelThree,
    this.levelFour,
    this.levelFive,
  });
  static HierarchyStructure fromJson(Map<String, dynamic> json) =>
      HierarchyStructure();
}

class HistoricalMetric {
  /// The name of the historical metric.
  final String name;

  /// The threshold for the metric, used with service level metrics.
  final Threshold threshold;

  /// The statistic for the metric.
  final String statistic;

  /// The unit for the metric.
  final String unit;

  HistoricalMetric({
    this.name,
    this.threshold,
    this.statistic,
    this.unit,
  });
  static HistoricalMetric fromJson(Map<String, dynamic> json) =>
      HistoricalMetric();
}

class HistoricalMetricData {
  /// A `HistoricalMetric` object.
  final HistoricalMetric metric;

  /// The `Value` of the metric.
  final double value;

  HistoricalMetricData({
    this.metric,
    this.value,
  });
  static HistoricalMetricData fromJson(Map<String, dynamic> json) =>
      HistoricalMetricData();
}

class HistoricalMetricResult {
  /// The `Dimensions` for the metrics.
  final Dimensions dimensions;

  /// A list of `HistoricalMetricData` objects.
  final List<HistoricalMetricData> collections;

  HistoricalMetricResult({
    this.dimensions,
    this.collections,
  });
  static HistoricalMetricResult fromJson(Map<String, dynamic> json) =>
      HistoricalMetricResult();
}

class ListRoutingProfilesResponse {
  /// An array of `RoutingProfileSummary` objects that include the ARN, Id, and
  /// Name of the routing profile.
  final List<RoutingProfileSummary> routingProfileSummaryList;

  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  final String nextToken;

  ListRoutingProfilesResponse({
    this.routingProfileSummaryList,
    this.nextToken,
  });
  static ListRoutingProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListRoutingProfilesResponse();
}

class ListSecurityProfilesResponse {
  /// An array of `SecurityProfileSummary` objects.
  final List<SecurityProfileSummary> securityProfileSummaryList;

  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  final String nextToken;

  ListSecurityProfilesResponse({
    this.securityProfileSummaryList,
    this.nextToken,
  });
  static ListSecurityProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListSecurityProfilesResponse();
}

class ListUserHierarchyGroupsResponse {
  /// An array of `HierarchyGroupSummary` objects.
  final List<HierarchyGroupSummary> userHierarchyGroupSummaryList;

  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  final String nextToken;

  ListUserHierarchyGroupsResponse({
    this.userHierarchyGroupSummaryList,
    this.nextToken,
  });
  static ListUserHierarchyGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListUserHierarchyGroupsResponse();
}

class ListUsersResponse {
  /// An array of `UserSummary` objects that contain information about the users
  /// in your instance.
  final List<UserSummary> userSummaryList;

  /// A string returned in the response. Use the value returned in the response
  /// as the value of the NextToken in a subsequent request to retrieve the next
  /// set of results.
  final String nextToken;

  ListUsersResponse({
    this.userSummaryList,
    this.nextToken,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

class QueueReference {
  /// The ID of the queue associated with the metrics returned.
  final String id;

  /// The Amazon Resource Name (ARN) of queue.
  final String arn;

  QueueReference({
    this.id,
    this.arn,
  });
  static QueueReference fromJson(Map<String, dynamic> json) => QueueReference();
}

class RoutingProfileSummary {
  /// The identifier of the routing profile.
  final String id;

  /// The ARN of the routing profile.
  final String arn;

  /// The name of the routing profile.
  final String name;

  RoutingProfileSummary({
    this.id,
    this.arn,
    this.name,
  });
  static RoutingProfileSummary fromJson(Map<String, dynamic> json) =>
      RoutingProfileSummary();
}

class SecurityProfileSummary {
  /// The identifier of the security profile.
  final String id;

  /// The ARN of the security profile.
  final String arn;

  /// The name of the security profile.
  final String name;

  SecurityProfileSummary({
    this.id,
    this.arn,
    this.name,
  });
  static SecurityProfileSummary fromJson(Map<String, dynamic> json) =>
      SecurityProfileSummary();
}

class StartOutboundVoiceContactResponse {
  /// The unique identifier of this contact within your Amazon Connect instance.
  final String contactId;

  StartOutboundVoiceContactResponse({
    this.contactId,
  });
  static StartOutboundVoiceContactResponse fromJson(
          Map<String, dynamic> json) =>
      StartOutboundVoiceContactResponse();
}

class StopContactResponse {
  StopContactResponse();
  static StopContactResponse fromJson(Map<String, dynamic> json) =>
      StopContactResponse();
}

class Threshold {
  /// The Threshold to use to compare service level metrics to. Only "Less than"
  /// (LT) comparisons are supported.
  final String comparison;

  /// The value of the threshold to compare the metric to. Only "Less than" (LT)
  /// comparisons are supported.
  final double thresholdValue;

  Threshold({
    this.comparison,
    this.thresholdValue,
  });
  static Threshold fromJson(Map<String, dynamic> json) => Threshold();
}

class UpdateContactAttributesResponse {
  UpdateContactAttributesResponse();
  static UpdateContactAttributesResponse fromJson(Map<String, dynamic> json) =>
      UpdateContactAttributesResponse();
}

class User {
  /// The identifier of the user account.
  final String id;

  /// The ARN of the user account.
  final String arn;

  /// The user name assigned to the user account.
  final String username;

  /// A `UserIdentityInfo` object.
  final UserIdentityInfo identityInfo;

  /// A `UserPhoneConfig` object.
  final UserPhoneConfig phoneConfig;

  /// The directory Id for the user account in the existing directory used for
  /// identity management.
  final String directoryUserId;

  /// The identifier(s) for the security profile assigned to the user.
  final List<String> securityProfileIds;

  /// The identifier of the routing profile assigned to the user.
  final String routingProfileId;

  /// The identifier for the hierarchy group assigned to the user.
  final String hierarchyGroupId;

  User({
    this.id,
    this.arn,
    this.username,
    this.identityInfo,
    this.phoneConfig,
    this.directoryUserId,
    this.securityProfileIds,
    this.routingProfileId,
    this.hierarchyGroupId,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}

class UserIdentityInfo {
  /// The first name used in the user account. This is required if you are using
  /// Amazon Connect or SAML for identity management.
  final String firstName;

  /// The last name used in the user account. This is required if you are using
  /// Amazon Connect or SAML for identity management.
  final String lastName;

  /// The email address added to the user account. If you are using SAML for
  /// identity management and include this parameter, an
  /// `InvalidRequestException` is returned.
  final String email;

  UserIdentityInfo({
    this.firstName,
    this.lastName,
    this.email,
  });
  static UserIdentityInfo fromJson(Map<String, dynamic> json) =>
      UserIdentityInfo();
}

class UserPhoneConfig {
  /// The phone type selected for the user, either Soft phone or Desk phone.
  final String phoneType;

  /// The Auto accept setting for the user, Yes or No.
  final bool autoAccept;

  /// The After Call Work (ACW) timeout setting, in seconds, for the user.
  final int afterContactWorkTimeLimit;

  /// The phone number for the user's desk phone.
  final String deskPhoneNumber;

  UserPhoneConfig({
    @required this.phoneType,
    this.autoAccept,
    this.afterContactWorkTimeLimit,
    this.deskPhoneNumber,
  });
  static UserPhoneConfig fromJson(Map<String, dynamic> json) =>
      UserPhoneConfig();
}

class UserSummary {
  /// The identifier for the user account.
  final String id;

  /// The ARN for the user account.
  final String arn;

  /// The Amazon Connect user name for the user account.
  final String username;

  UserSummary({
    this.id,
    this.arn,
    this.username,
  });
  static UserSummary fromJson(Map<String, dynamic> json) => UserSummary();
}
