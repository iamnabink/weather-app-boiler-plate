import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/core/data/entities/result_state.dart';
import 'package:moru_weather/core/data/remote/api_result.dart';
import 'package:moru_weather/features/home/data/entity/weather.dart';
import 'package:moru_weather/features/home/domain/weather_info_repository.dart';


class WeatherInfoNotifier extends StateNotifier<ResultState> {
  WeatherInfoNotifier({required this.repo})
      : super(const ResultState.idle()) {
    _onInit();
  }

  final WeatherInfoRepository repo;

  void _onInit() async{
    var location = await repo.fetchSavedLocation();
    if (location.isEmpty) {
      getWeatherInfoByLocation();
    } else if (location.isNotEmpty) {
      getWeatherInfoByLocation(city: location);
    }
  }

  void getWeatherInfoByLocation({String? city}) async {
    state = const ResultState.loading();
    ApiResult<Weather> result;
    if (city == null || city.isEmpty) {
      result = await repo.getWeatherInfoByCurrentLocation();
    } else {
      result = await repo.getWeatherInfoByLocation(city);
    }
    result.when(success: (data) {
      state = ResultState.data(data: data);
    }, failure: (error) {
      state = ResultState.error(error: error);
    });
  }
}
