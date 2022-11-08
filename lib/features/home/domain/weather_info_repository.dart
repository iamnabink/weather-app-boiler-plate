import 'package:moru_weather/features/home/data/entity/weather.dart';

import '../../../core/data/remote/api_result.dart';

abstract class WeatherInfoRepository {

  /// fetch weather info according to the city name provided
  Future<ApiResult<Weather>> getWeatherInfoByLocation(String city);

  /// fetch weather info according to the users with current location
  Future<ApiResult<Weather>> getWeatherInfoByCurrentLocation();

  /// checks whether app is opening for the first time
  Future<String> fetchSavedLocation();

  /// set first time value
  Future<void> saveLocation(String location);


// Determine the current position of the local.
// When the location services are not enabled or permissions
// are denied the `Future` will return an error.
  // Future<String?> getUserCurrentLocation();
}
