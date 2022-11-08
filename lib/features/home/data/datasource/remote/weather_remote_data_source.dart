import '../../../../../core/data/remote/api_endpoints.dart';
import '../../../../../core/data/remote/dio_client.dart';

abstract class WeatherRemoteDataSource {
  Future<dynamic> getWeatherInfoByLocation({required String city});

  Future<dynamic> getWeatherInfoByLatLon({required String latLon});
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  late DioClient dioClient;

  WeatherRemoteDataSourceImpl({required this.dioClient});

  @override
  Future getWeatherInfoByLocation({required String city}) async {
    try {
      final response = await dioClient.get(
        APIPathHelper.currentWeather(APIPath.byCityLocation, location: city),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getWeatherInfoByLatLon({required String latLon}) async {
    try {
      final response = await dioClient.get(
        APIPathHelper.currentWeather(APIPath.byLatLon, latLon: latLon),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
