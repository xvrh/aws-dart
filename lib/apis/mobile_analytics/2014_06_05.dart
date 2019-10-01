import 'package:meta/meta.dart';

/// Amazon Mobile Analytics is a service for collecting, visualizing, and
/// understanding app usage data at scale.
class MobileAnalyticsApi {
  /// The PutEvents operation records one or more events. You can have up to
  /// 1,500 unique custom events per app, any combination of up to 40 attributes
  /// and metrics per custom event, and any number of attribute or metric
  /// values.
  ///
  /// [events]: An array of Event JSON objects
  ///
  /// [clientContext]: The client context including the client ID, app title,
  /// app version and package name.
  ///
  /// [clientContextEncoding]: The encoding used for the client context.
  Future<void> putEvents(
      {@required List<Event> events,
      @required String clientContext,
      String clientContextEncoding}) async {}
}

/// A JSON object representing a batch of unique event occurrences in your app.
class Event {
  /// A name signifying an event that occurred in your app. This is used for
  /// grouping and aggregating like events together for reporting purposes.
  final String eventType;

  /// The time the event occurred in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String timestamp;

  /// The session the event occured within.
  final Session session;

  /// The version of the event.
  final String version;

  /// A collection of key-value pairs that give additional context to the event.
  /// The key-value pairs are specified by the developer.
  ///
  /// This collection can be empty or the attribute object can be omitted.
  final Map<String, String> attributes;

  /// A collection of key-value pairs that gives additional, measurable context
  /// to the event. The key-value pairs are specified by the developer.
  ///
  /// This collection can be empty or the attribute object can be omitted.
  final Map<String, double> metrics;

  Event({
    @required this.eventType,
    @required this.timestamp,
    this.session,
    this.version,
    this.attributes,
    this.metrics,
  });
}

/// Describes the session. Session information is required on ALL events.
class Session {
  /// A unique identifier for the session
  final String id;

  /// The duration of the session.
  final BigInt duration;

  /// The time the event started in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String startTimestamp;

  /// The time the event terminated in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String stopTimestamp;

  Session({
    this.id,
    this.duration,
    this.startTimestamp,
    this.stopTimestamp,
  });
}
