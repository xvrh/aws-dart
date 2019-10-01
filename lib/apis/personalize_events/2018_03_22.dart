import 'package:meta/meta.dart';

class PersonalizeEventsApi {
  /// Records user interaction event data.
  Future<void> putEvents(
      {@required String trackingId,
      String userId,
      @required String sessionId,
      @required List<Event> eventList}) async {}
}

class Event {}
