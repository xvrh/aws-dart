import 'package:meta/meta.dart';

/// Provides APIs for creating and managing Amazon Forecast resources.
class ForecastqueryApi {
  /// Retrieves a forecast filtered by the supplied criteria.
  ///
  /// The criteria is a key-value pair. The key is either `item_id` (or the
  /// equivalent non-timestamp, non-target field) from the
  /// `TARGET\_TIME\_SERIES` dataset, or one of the forecast dimensions
  /// specified as part of the `FeaturizationConfig` object.
  ///
  /// By default, the complete date range of the filtered forecast is returned.
  /// Optionally, you can request a specific date range within the forecast.
  ///
  ///
  ///
  /// The forecasts generated by Amazon Forecast are in the same timezone as the
  /// dataset that was used to create the predictor.
  Future<void> queryForecast(
      {@required String forecastArn,
      String startDate,
      String endDate,
      @required Map<String, String> filters,
      String nextToken}) async {}
}

class DataPoint {}

class Forecast {}

class QueryForecastResponse {}
