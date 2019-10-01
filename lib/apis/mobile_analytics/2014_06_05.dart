import 'package:meta/meta.dart';

/// Amazon Mobile Analytics is a service for collecting, visualizing, and
/// understanding app usage data at scale.
class MobileAnalyticsApi {
  /// The PutEvents operation records one or more events. You can have up to
  /// 1,500 unique custom events per app, any combination of up to 40 attributes
  /// and metrics per custom event, and any number of attribute or metric
  /// values.
  Future<void> putEvents(
      {@required List<Event> events,
      @required String clientContext,
      String clientContextEncoding}) async {}
}

class Event {}

class Session {}
