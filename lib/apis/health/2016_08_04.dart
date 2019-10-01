import 'package:meta/meta.dart';

/// AWS Health
///
/// The AWS Health API provides programmatic access to the AWS Health
/// information that is presented in the
/// [AWS Personal Health Dashboard](https://phd.aws.amazon.com/phd/home#/). You
/// can get information about events that affect your AWS resources:
///
/// *    DescribeEvents: Summary information about events.
///
/// *    DescribeEventDetails: Detailed information about one or more events.
///
/// *    DescribeAffectedEntities: Information about AWS resources that are
/// affected by one or more events.
///
///
/// In addition, these operations provide information about event types and
/// summary counts of events or affected entities:
///
/// *    DescribeEventTypes: Information about the kinds of events that AWS
/// Health tracks.
///
/// *    DescribeEventAggregates: A count of the number of events that meet
/// specified criteria.
///
/// *    DescribeEntityAggregates: A count of the number of affected entities
/// that meet specified criteria.
///
///
/// The Health API requires a Business or Enterprise support plan from
/// [AWS Support](http://aws.amazon.com/premiumsupport/). Calling the Health API
/// from an account that does not have a Business or Enterprise support plan
/// causes a `SubscriptionRequiredException`.
///
/// For authentication of requests, AWS Health uses the
/// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
///
/// See the
/// [AWS Health User Guide](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html)
/// for information about how to use the API.
///
///  **Service Endpoint**
///
/// The HTTP endpoint for the AWS Health API is:
///
/// *   https://health.us-east-1.amazonaws.com
class HealthApi {
  final _client;
  HealthApi(client) : _client = client.configured('Health', serializer: 'json');

  /// Returns a list of entities that have been affected by the specified
  /// events, based on the specified filter criteria. Entities can refer to
  /// individual customer resources, groups of customer resources, or any other
  /// construct, depending on the AWS service. Events that have impact beyond
  /// that of the affected entities, or where the extent of impact is unknown,
  /// include at least one entity indicating this.
  ///
  /// At least one event ARN is required. Results are sorted by the
  /// `lastUpdatedTime` of the entity, starting with the most recent.
  ///
  /// [filter]: Values to narrow the results returned. At least one event ARN is
  /// required.
  ///
  /// [locale]: The locale (language) to return information in. English (en) is
  /// the default and the only supported value at this time.
  ///
  /// [nextToken]: If the results of a search are large, only a portion of the
  /// results are returned, and a `nextToken` pagination token is returned in
  /// the response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  ///
  /// [maxResults]: The maximum number of items to return in one batch, between
  /// 10 and 100, inclusive.
  Future<DescribeAffectedEntitiesResponse> describeAffectedEntities(
      EntityFilter filter,
      {String locale,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeAffectedEntities', {
      'filter': filter,
      if (locale != null) 'locale': locale,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return DescribeAffectedEntitiesResponse.fromJson(response_);
  }

  /// Returns the number of entities that are affected by each of the specified
  /// events. If no events are specified, the counts of all affected entities
  /// are returned.
  ///
  /// [eventArns]: A list of event ARNs (unique identifiers). For example:
  /// `"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"`
  Future<DescribeEntityAggregatesResponse> describeEntityAggregates(
      {List<String> eventArns}) async {
    var response_ = await _client.send('DescribeEntityAggregates', {
      if (eventArns != null) 'eventArns': eventArns,
    });
    return DescribeEntityAggregatesResponse.fromJson(response_);
  }

  /// Returns the number of events of each event type (issue, scheduled change,
  /// and account notification). If no filter is specified, the counts of all
  /// events in each category are returned.
  ///
  /// [filter]: Values to narrow the results returned.
  ///
  /// [aggregateField]: The only currently supported value is
  /// `eventTypeCategory`.
  ///
  /// [maxResults]: The maximum number of items to return in one batch, between
  /// 10 and 100, inclusive.
  ///
  /// [nextToken]: If the results of a search are large, only a portion of the
  /// results are returned, and a `nextToken` pagination token is returned in
  /// the response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  Future<DescribeEventAggregatesResponse> describeEventAggregates(
      String aggregateField,
      {EventFilter filter,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeEventAggregates', {
      if (filter != null) 'filter': filter,
      'aggregateField': aggregateField,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return DescribeEventAggregatesResponse.fromJson(response_);
  }

  /// Returns detailed information about one or more specified events.
  /// Information includes standard event data (region, service, etc., as
  /// returned by DescribeEvents), a detailed event description, and possible
  /// additional metadata that depends upon the nature of the event. Affected
  /// entities are not included; to retrieve those, use the
  /// DescribeAffectedEntities operation.
  ///
  /// If a specified event cannot be retrieved, an error message is returned for
  /// that event.
  ///
  /// [eventArns]: A list of event ARNs (unique identifiers). For example:
  /// `"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"`
  ///
  /// [locale]: The locale (language) to return information in. English (en) is
  /// the default and the only supported value at this time.
  Future<DescribeEventDetailsResponse> describeEventDetails(
      List<String> eventArns,
      {String locale}) async {
    var response_ = await _client.send('DescribeEventDetails', {
      'eventArns': eventArns,
      if (locale != null) 'locale': locale,
    });
    return DescribeEventDetailsResponse.fromJson(response_);
  }

  /// Returns the event types that meet the specified filter criteria. If no
  /// filter criteria are specified, all event types are returned, in no
  /// particular order.
  ///
  /// [filter]: Values to narrow the results returned.
  ///
  /// [locale]: The locale (language) to return information in. English (en) is
  /// the default and the only supported value at this time.
  ///
  /// [nextToken]: If the results of a search are large, only a portion of the
  /// results are returned, and a `nextToken` pagination token is returned in
  /// the response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  ///
  /// [maxResults]: The maximum number of items to return in one batch, between
  /// 10 and 100, inclusive.
  Future<DescribeEventTypesResponse> describeEventTypes(
      {EventTypeFilter filter,
      String locale,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeEventTypes', {
      if (filter != null) 'filter': filter,
      if (locale != null) 'locale': locale,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return DescribeEventTypesResponse.fromJson(response_);
  }

  /// Returns information about events that meet the specified filter criteria.
  /// Events are returned in a summary form and do not include the detailed
  /// description, any additional metadata that depends on the event type, or
  /// any affected resources. To retrieve that information, use the
  /// DescribeEventDetails and DescribeAffectedEntities operations.
  ///
  /// If no filter criteria are specified, all events are returned. Results are
  /// sorted by `lastModifiedTime`, starting with the most recent.
  ///
  /// [filter]: Values to narrow the results returned.
  ///
  /// [nextToken]: If the results of a search are large, only a portion of the
  /// results are returned, and a `nextToken` pagination token is returned in
  /// the response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When all results have been
  /// returned, the response does not contain a pagination token value.
  ///
  /// [maxResults]: The maximum number of items to return in one batch, between
  /// 10 and 100, inclusive.
  ///
  /// [locale]: The locale (language) to return information in. English (en) is
  /// the default and the only supported value at this time.
  Future<DescribeEventsResponse> describeEvents(
      {EventFilter filter,
      String nextToken,
      int maxResults,
      String locale}) async {
    var response_ = await _client.send('DescribeEvents', {
      if (filter != null) 'filter': filter,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (locale != null) 'locale': locale,
    });
    return DescribeEventsResponse.fromJson(response_);
  }
}

/// Information about an entity that is affected by a Health event.
class AffectedEntity {
  /// The unique identifier for the entity. Format:
  /// `arn:aws:health:_entity-region_:_aws-account_:entity/_entity-id_` .
  /// Example:
  /// `arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K`
  final String entityArn;

  /// The unique identifier for the event. Format:
  /// `arn:aws:health:_event-region_::event/_SERVICE_/_EVENT_TYPE_CODE_/_EVENT_TYPE_PLUS_ID_`
  /// . Example: `Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456`
  final String eventArn;

  /// The ID of the affected entity.
  final String entityValue;

  final String entityUrl;

  /// The 12-digit AWS account number that contains the affected entity.
  final String awsAccountId;

  /// The most recent time that the entity was updated.
  final DateTime lastUpdatedTime;

  /// The most recent status of the entity affected by the event. The possible
  /// values are `IMPAIRED`, `UNIMPAIRED`, and `UNKNOWN`.
  final String statusCode;

  /// A map of entity tags attached to the affected entity.
  final Map<String, String> tags;

  AffectedEntity({
    this.entityArn,
    this.eventArn,
    this.entityValue,
    this.entityUrl,
    this.awsAccountId,
    this.lastUpdatedTime,
    this.statusCode,
    this.tags,
  });
  static AffectedEntity fromJson(Map<String, dynamic> json) => AffectedEntity(
        entityArn:
            json.containsKey('entityArn') ? json['entityArn'] as String : null,
        eventArn:
            json.containsKey('eventArn') ? json['eventArn'] as String : null,
        entityValue: json.containsKey('entityValue')
            ? json['entityValue'] as String
            : null,
        entityUrl:
            json.containsKey('entityUrl') ? json['entityUrl'] as String : null,
        awsAccountId: json.containsKey('awsAccountId')
            ? json['awsAccountId'] as String
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
        statusCode: json.containsKey('statusCode')
            ? json['statusCode'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A range of dates and times that is used by the EventFilter and EntityFilter
/// objects. If `from` is set and `to` is set: match items where the timestamp
/// (`startTime`, `endTime`, or `lastUpdatedTime`) is between `from` and `to`
/// inclusive. If `from` is set and `to` is not set: match items where the
/// timestamp value is equal to or after `from`. If `from` is not set and `to`
/// is set: match items where the timestamp value is equal to or before `to`.
class DateTimeRange {
  /// The starting date and time of a time range.
  final DateTime from;

  /// The ending date and time of a time range.
  final DateTime to;

  DateTimeRange({
    this.from,
    this.to,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DescribeAffectedEntitiesResponse {
  /// The entities that match the filter criteria.
  final List<AffectedEntity> entities;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a `nextToken` pagination token is returned in the response.
  /// To retrieve the next batch of results, reissue the search request and
  /// include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String nextToken;

  DescribeAffectedEntitiesResponse({
    this.entities,
    this.nextToken,
  });
  static DescribeAffectedEntitiesResponse fromJson(Map<String, dynamic> json) =>
      DescribeAffectedEntitiesResponse(
        entities: json.containsKey('entities')
            ? (json['entities'] as List)
                .map((e) => AffectedEntity.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeEntityAggregatesResponse {
  /// The number of entities that are affected by each of the specified events.
  final List<EntityAggregate> entityAggregates;

  DescribeEntityAggregatesResponse({
    this.entityAggregates,
  });
  static DescribeEntityAggregatesResponse fromJson(Map<String, dynamic> json) =>
      DescribeEntityAggregatesResponse(
        entityAggregates: json.containsKey('entityAggregates')
            ? (json['entityAggregates'] as List)
                .map((e) => EntityAggregate.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventAggregatesResponse {
  /// The number of events in each category that meet the optional filter
  /// criteria.
  final List<EventAggregate> eventAggregates;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a `nextToken` pagination token is returned in the response.
  /// To retrieve the next batch of results, reissue the search request and
  /// include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String nextToken;

  DescribeEventAggregatesResponse({
    this.eventAggregates,
    this.nextToken,
  });
  static DescribeEventAggregatesResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventAggregatesResponse(
        eventAggregates: json.containsKey('eventAggregates')
            ? (json['eventAggregates'] as List)
                .map((e) => EventAggregate.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeEventDetailsResponse {
  /// Information about the events that could be retrieved.
  final List<EventDetails> successfulSet;

  /// Error messages for any events that could not be retrieved.
  final List<EventDetailsErrorItem> failedSet;

  DescribeEventDetailsResponse({
    this.successfulSet,
    this.failedSet,
  });
  static DescribeEventDetailsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventDetailsResponse(
        successfulSet: json.containsKey('successfulSet')
            ? (json['successfulSet'] as List)
                .map((e) => EventDetails.fromJson(e))
                .toList()
            : null,
        failedSet: json.containsKey('failedSet')
            ? (json['failedSet'] as List)
                .map((e) => EventDetailsErrorItem.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventTypesResponse {
  /// A list of event types that match the filter criteria. Event types have a
  /// category (`issue`, `accountNotification`, or `scheduledChange`), a service
  /// (for example, `EC2`, `RDS`, `DATAPIPELINE`, `BILLING`), and a code (in the
  /// format `AWS__SERVICE___DESCRIPTION_` ; for example,
  /// `AWS_EC2_SYSTEM_MAINTENANCE_EVENT`).
  final List<EventType> eventTypes;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a `nextToken` pagination token is returned in the response.
  /// To retrieve the next batch of results, reissue the search request and
  /// include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String nextToken;

  DescribeEventTypesResponse({
    this.eventTypes,
    this.nextToken,
  });
  static DescribeEventTypesResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventTypesResponse(
        eventTypes: json.containsKey('eventTypes')
            ? (json['eventTypes'] as List)
                .map((e) => EventType.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeEventsResponse {
  /// The events that match the specified filter criteria.
  final List<Event> events;

  /// If the results of a search are large, only a portion of the results are
  /// returned, and a `nextToken` pagination token is returned in the response.
  /// To retrieve the next batch of results, reissue the search request and
  /// include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  final String nextToken;

  DescribeEventsResponse({
    this.events,
    this.nextToken,
  });
  static DescribeEventsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventsResponse(
        events: json.containsKey('events')
            ? (json['events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The number of entities that are affected by one or more events. Returned by
/// the DescribeEntityAggregates operation.
class EntityAggregate {
  /// The unique identifier for the event. Format:
  /// `arn:aws:health:_event-region_::event/_SERVICE_/_EVENT_TYPE_CODE_/_EVENT_TYPE_PLUS_ID_`
  /// . Example: `Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456`
  final String eventArn;

  /// The number entities that match the criteria for the specified events.
  final int count;

  EntityAggregate({
    this.eventArn,
    this.count,
  });
  static EntityAggregate fromJson(Map<String, dynamic> json) => EntityAggregate(
        eventArn:
            json.containsKey('eventArn') ? json['eventArn'] as String : null,
        count: json.containsKey('count') ? json['count'] as int : null,
      );
}

/// The values to use to filter results from the DescribeAffectedEntities
/// operation.
class EntityFilter {
  /// A list of event ARNs (unique identifiers). For example:
  /// `"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"`
  final List<String> eventArns;

  /// A list of entity ARNs (unique identifiers).
  final List<String> entityArns;

  /// A list of IDs for affected entities.
  final List<String> entityValues;

  /// A list of the most recent dates and times that the entity was updated.
  final List<DateTimeRange> lastUpdatedTimes;

  /// A map of entity tags attached to the affected entity.
  final List<Map<String, String>> tags;

  /// A list of entity status codes (`IMPAIRED`, `UNIMPAIRED`, or `UNKNOWN`).
  final List<String> statusCodes;

  EntityFilter({
    @required this.eventArns,
    this.entityArns,
    this.entityValues,
    this.lastUpdatedTimes,
    this.tags,
    this.statusCodes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Summary information about an event, returned by the DescribeEvents
/// operation. The DescribeEventDetails operation also returns this information,
/// as well as the EventDescription and additional event metadata.
class Event {
  /// The unique identifier for the event. Format:
  /// `arn:aws:health:_event-region_::event/_SERVICE_/_EVENT_TYPE_CODE_/_EVENT_TYPE_PLUS_ID_`
  /// . Example: `Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456`
  final String arn;

  /// The AWS service that is affected by the event. For example, `EC2`, `RDS`.
  final String service;

  /// The unique identifier for the event type. The format is
  /// `AWS__SERVICE___DESCRIPTION_` ; for example,
  /// `AWS_EC2_SYSTEM_MAINTENANCE_EVENT`.
  final String eventTypeCode;

  /// The category of the event. Possible values are `issue`, `scheduledChange`,
  /// and `accountNotification`.
  final String eventTypeCategory;

  /// The AWS region name of the event.
  final String region;

  /// The AWS Availability Zone of the event. For example, us-east-1a.
  final String availabilityZone;

  /// The date and time that the event began.
  final DateTime startTime;

  /// The date and time that the event ended.
  final DateTime endTime;

  /// The most recent date and time that the event was updated.
  final DateTime lastUpdatedTime;

  /// The most recent status of the event. Possible values are `open`, `closed`,
  /// and `upcoming`.
  final String statusCode;

  Event({
    this.arn,
    this.service,
    this.eventTypeCode,
    this.eventTypeCategory,
    this.region,
    this.availabilityZone,
    this.startTime,
    this.endTime,
    this.lastUpdatedTime,
    this.statusCode,
  });
  static Event fromJson(Map<String, dynamic> json) => Event(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        service: json.containsKey('service') ? json['service'] as String : null,
        eventTypeCode: json.containsKey('eventTypeCode')
            ? json['eventTypeCode'] as String
            : null,
        eventTypeCategory: json.containsKey('eventTypeCategory')
            ? json['eventTypeCategory'] as String
            : null,
        region: json.containsKey('region') ? json['region'] as String : null,
        availabilityZone: json.containsKey('availabilityZone')
            ? json['availabilityZone'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
        statusCode: json.containsKey('statusCode')
            ? json['statusCode'] as String
            : null,
      );
}

/// The number of events of each issue type. Returned by the
/// DescribeEventAggregates operation.
class EventAggregate {
  /// The issue type for the associated count.
  final String aggregateValue;

  /// The number of events of the associated issue type.
  final int count;

  EventAggregate({
    this.aggregateValue,
    this.count,
  });
  static EventAggregate fromJson(Map<String, dynamic> json) => EventAggregate(
        aggregateValue: json.containsKey('aggregateValue')
            ? json['aggregateValue'] as String
            : null,
        count: json.containsKey('count') ? json['count'] as int : null,
      );
}

/// The detailed description of the event. Included in the information returned
/// by the DescribeEventDetails operation.
class EventDescription {
  /// The most recent description of the event.
  final String latestDescription;

  EventDescription({
    this.latestDescription,
  });
  static EventDescription fromJson(Map<String, dynamic> json) =>
      EventDescription(
        latestDescription: json.containsKey('latestDescription')
            ? json['latestDescription'] as String
            : null,
      );
}

/// Detailed information about an event. A combination of an Event object, an
/// EventDescription object, and additional metadata about the event. Returned
/// by the DescribeEventDetails operation.
class EventDetails {
  /// Summary information about the event.
  final Event event;

  /// The most recent description of the event.
  final EventDescription eventDescription;

  /// Additional metadata about the event.
  final Map<String, String> eventMetadata;

  EventDetails({
    this.event,
    this.eventDescription,
    this.eventMetadata,
  });
  static EventDetails fromJson(Map<String, dynamic> json) => EventDetails(
        event: json.containsKey('event') ? Event.fromJson(json['event']) : null,
        eventDescription: json.containsKey('eventDescription')
            ? EventDescription.fromJson(json['eventDescription'])
            : null,
        eventMetadata: json.containsKey('eventMetadata')
            ? (json['eventMetadata'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Error information returned when a DescribeEventDetails operation cannot find
/// a specified event.
class EventDetailsErrorItem {
  /// The unique identifier for the event. Format:
  /// `arn:aws:health:_event-region_::event/_SERVICE_/_EVENT_TYPE_CODE_/_EVENT_TYPE_PLUS_ID_`
  /// . Example: `Example:
  /// arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456`
  final String eventArn;

  /// The name of the error.
  final String errorName;

  /// A message that describes the error.
  final String errorMessage;

  EventDetailsErrorItem({
    this.eventArn,
    this.errorName,
    this.errorMessage,
  });
  static EventDetailsErrorItem fromJson(Map<String, dynamic> json) =>
      EventDetailsErrorItem(
        eventArn:
            json.containsKey('eventArn') ? json['eventArn'] as String : null,
        errorName:
            json.containsKey('errorName') ? json['errorName'] as String : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
      );
}

/// The values to use to filter results from the DescribeEvents and
/// DescribeEventAggregates operations.
class EventFilter {
  /// A list of event ARNs (unique identifiers). For example:
  /// `"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
  /// "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"`
  final List<String> eventArns;

  /// A list of unique identifiers for event types. For example,
  /// `"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED"`
  final List<String> eventTypeCodes;

  /// The AWS services associated with the event. For example, `EC2`, `RDS`.
  final List<String> services;

  /// A list of AWS regions.
  final List<String> regions;

  /// A list of AWS availability zones.
  final List<String> availabilityZones;

  /// A list of dates and times that the event began.
  final List<DateTimeRange> startTimes;

  /// A list of dates and times that the event ended.
  final List<DateTimeRange> endTimes;

  /// A list of dates and times that the event was last updated.
  final List<DateTimeRange> lastUpdatedTimes;

  /// A list of entity ARNs (unique identifiers).
  final List<String> entityArns;

  /// A list of entity identifiers, such as EC2 instance IDs (`i-34ab692e`) or
  /// EBS volumes (`vol-426ab23e`).
  final List<String> entityValues;

  /// A list of event type category codes (`issue`, `scheduledChange`, or
  /// `accountNotification`).
  final List<String> eventTypeCategories;

  /// A map of entity tags attached to the affected entity.
  final List<Map<String, String>> tags;

  /// A list of event status codes.
  final List<String> eventStatusCodes;

  EventFilter({
    this.eventArns,
    this.eventTypeCodes,
    this.services,
    this.regions,
    this.availabilityZones,
    this.startTimes,
    this.endTimes,
    this.lastUpdatedTimes,
    this.entityArns,
    this.entityValues,
    this.eventTypeCategories,
    this.tags,
    this.eventStatusCodes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Metadata about a type of event that is reported by AWS Health. Data consists
/// of the category (for example, `issue`), the service (for example, `EC2`),
/// and the event type code (for example, `AWS_EC2_SYSTEM_MAINTENANCE_EVENT`).
class EventType {
  /// The AWS service that is affected by the event. For example, `EC2`, `RDS`.
  final String service;

  /// The unique identifier for the event type. The format is
  /// `AWS__SERVICE___DESCRIPTION_` ; for example,
  /// `AWS_EC2_SYSTEM_MAINTENANCE_EVENT`.
  final String code;

  /// A list of event type category codes (`issue`, `scheduledChange`, or
  /// `accountNotification`).
  final String category;

  EventType({
    this.service,
    this.code,
    this.category,
  });
  static EventType fromJson(Map<String, dynamic> json) => EventType(
        service: json.containsKey('service') ? json['service'] as String : null,
        code: json.containsKey('code') ? json['code'] as String : null,
        category:
            json.containsKey('category') ? json['category'] as String : null,
      );
}

/// The values to use to filter results from the DescribeEventTypes operation.
class EventTypeFilter {
  /// A list of event type codes.
  final List<String> eventTypeCodes;

  /// The AWS services associated with the event. For example, `EC2`, `RDS`.
  final List<String> services;

  /// A list of event type category codes (`issue`, `scheduledChange`, or
  /// `accountNotification`).
  final List<String> eventTypeCategories;

  EventTypeFilter({
    this.eventTypeCodes,
    this.services,
    this.eventTypeCategories,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
