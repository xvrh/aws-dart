import 'package:meta/meta.dart';

/// AWS Health
///
/// The AWS Health API provides programmatic access to the AWS Health
/// information that is presented in the [AWS Personal Health
/// Dashboard](https://phd.aws.amazon.com/phd/home#/). You can get information
/// about events that affect your AWS resources:
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
/// The Health API requires a Business or Enterprise support plan from [AWS
/// Support](http://aws.amazon.com/premiumsupport/). Calling the Health API from
/// an account that does not have a Business or Enterprise support plan causes a
/// `SubscriptionRequiredException`.
///
/// For authentication of requests, AWS Health uses the [Signature Version 4
/// Signing
/// Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
///
/// See the [AWS Health User
/// Guide](https://docs.aws.amazon.com/health/latest/ug/what-is-aws-health.html)
/// for information about how to use the API.
///
///  **Service Endpoint**
///
/// The HTTP endpoint for the AWS Health API is:
///
/// *   https://health.us-east-1.amazonaws.com
class HealthApi {
  /// Returns a list of entities that have been affected by the specified
  /// events, based on the specified filter criteria. Entities can refer to
  /// individual customer resources, groups of customer resources, or any other
  /// construct, depending on the AWS service. Events that have impact beyond
  /// that of the affected entities, or where the extent of impact is unknown,
  /// include at least one entity indicating this.
  ///
  /// At least one event ARN is required. Results are sorted by the
  /// `lastUpdatedTime` of the entity, starting with the most recent.
  Future<void> describeAffectedEntities(EntityFilter filter,
      {String locale, String nextToken, int maxResults}) async {}

  /// Returns the number of entities that are affected by each of the specified
  /// events. If no events are specified, the counts of all affected entities
  /// are returned.
  Future<void> describeEntityAggregates({List<String> eventArns}) async {}

  /// Returns the number of events of each event type (issue, scheduled change,
  /// and account notification). If no filter is specified, the counts of all
  /// events in each category are returned.
  Future<void> describeEventAggregates(String aggregateField,
      {EventFilter filter, int maxResults, String nextToken}) async {}

  /// Returns detailed information about one or more specified events.
  /// Information includes standard event data (region, service, etc., as
  /// returned by DescribeEvents), a detailed event description, and possible
  /// additional metadata that depends upon the nature of the event. Affected
  /// entities are not included; to retrieve those, use the
  /// DescribeAffectedEntities operation.
  ///
  /// If a specified event cannot be retrieved, an error message is returned for
  /// that event.
  Future<void> describeEventDetails(List<String> eventArns,
      {String locale}) async {}

  /// Returns the event types that meet the specified filter criteria. If no
  /// filter criteria are specified, all event types are returned, in no
  /// particular order.
  Future<void> describeEventTypes(
      {EventTypeFilter filter,
      String locale,
      String nextToken,
      int maxResults}) async {}

  /// Returns information about events that meet the specified filter criteria.
  /// Events are returned in a summary form and do not include the detailed
  /// description, any additional metadata that depends on the event type, or
  /// any affected resources. To retrieve that information, use the
  /// DescribeEventDetails and DescribeAffectedEntities operations.
  ///
  /// If no filter criteria are specified, all events are returned. Results are
  /// sorted by `lastModifiedTime`, starting with the most recent.
  Future<void> describeEvents(
      {EventFilter filter,
      String nextToken,
      int maxResults,
      String locale}) async {}
}

class AffectedEntity {}

class DateTimeRange {}

class DescribeAffectedEntitiesResponse {}

class DescribeEntityAggregatesResponse {}

class DescribeEventAggregatesResponse {}

class DescribeEventDetailsResponse {}

class DescribeEventTypesResponse {}

class DescribeEventsResponse {}

class EntityAggregate {}

class EntityFilter {}

class Event {}

class EventAggregate {}

class EventDescription {}

class EventDetails {}

class EventDetailsErrorItem {}

class EventFilter {}

class EventType {}

class EventTypeFilter {}
