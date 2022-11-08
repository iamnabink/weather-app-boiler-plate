import 'package:dio/dio.dart';
import 'package:moru_weather/core/data/remote/api_result.dart';
import 'package:moru_weather/features/home/data/datasource/local/local_saved_location.dart';
import 'package:moru_weather/features/home/data/datasource/local/location_services.dart';
import 'package:moru_weather/features/home/data/datasource/remote/weather_remote_data_source.dart';
import 'package:moru_weather/features/home/data/entity/weather.dart';
import 'package:moru_weather/features/home/domain/weather_info_repository.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/data/remote/network_info.dart';

class WeatherInfoRepositoryImpl extends WeatherInfoRepository {
  final LocationServices locationServices;
  final LocalSavedLocation savedLocationLocal;
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherInfoRepositoryImpl(
      {required this.locationServices,
      required this.savedLocationLocal,
      required this.remoteDataSource,
      required this.networkInfo});

  // get users current location
  Future<String?> getUserCurrentLocation() async {
    var current = await locationServices.getUserCurrentLocation();
    if (current != null) {
      return '${current.latitude},${current.longitude}';
    }
    return null;
  }

  @override
  Future<ApiResult<Weather>> getWeatherInfoByCurrentLocation() async {
    if (await networkInfo.isConnected) {
      try {
        // first check if current location is fetched or not
        if (await getUserCurrentLocation() == null) {
          return const ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  'Unable to fetch user current location'));
        }
        final remoteData = await remoteDataSource.getWeatherInfoByLatLon(
            latLon: await getUserCurrentLocation() ?? '');
        final weatherInfo = Weather.fromJson(remoteData);
        return ApiResult.success(data: weatherInfo);
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  e.response?.data['error']['message'])); //code for code
        } else {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(e.toString()));
        }
      }
    } else {
      //Or fetch data locally
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<ApiResult<Weather>> getWeatherInfoByLocation(String city) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await remoteDataSource.getWeatherInfoByLocation(city: city);
        final weatherInfo = Weather.fromJson(remoteData);
        return ApiResult.success(data: weatherInfo);
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  e.response?.data['error']['message'])); //code for code
        } else {
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }
      }
    } else {
      //Or fetch data locally
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<String> fetchSavedLocation() async {
    return await savedLocationLocal.fetchSavedLocation();
  }

  @override
  Future<void> saveLocation(String location) async {
    savedLocationLocal.saveLocation(location);
  }
}
