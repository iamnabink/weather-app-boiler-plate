import 'package:moru_weather/features/home/data/entity/weather.dart';

import '../../../core/data/remote/api_result.dart';

abstract class WeatherInfoRepository {
  /// Determine the current position of the local.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  ///
  Future<ApiResult<Weather>> getWeatherInfoByLocation(String city);

  Future<ApiResult<Weather>> getWeatherInfoByCurrentLocation();

  // Future<String?> getUserCurrentLocation();
}
