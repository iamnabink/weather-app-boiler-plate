import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/features/home/data/datasource/local/local_saved_location.dart';
import 'package:moru_weather/features/home/data/datasource/local/location_services.dart';
import 'package:moru_weather/features/home/data/datasource/remote/weather_remote_data_source.dart';
import 'package:moru_weather/features/home/domain/weather_info_repository.dart';

import '../../../core/data/entities/result_state.dart';
import '../../../core/di/injection.dart';
import '../data/repository/weather_repository_impl.dart';
import '../presentation/notifier/saved_location_notifier.dart';
import '../presentation/notifier/weather_info_notifier.dart';

final _remoteDataSourceWeatherInfo = Provider<WeatherRemoteDataSource>((ref) =>
    WeatherRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));

final _locationService =
    Provider<LocationServices>((ref) => LocationServices());

final _savedLocationService = Provider<LocalSavedLocation>(
    (ref) => LocalSavedLocation(secureStorage: ref.watch(sharedPrefsProvider)));
final _weatherRepository = Provider<WeatherInfoRepository>((ref) =>
    WeatherInfoRepositoryImpl(
        remoteDataSource: ref.watch(_remoteDataSourceWeatherInfo),
        networkInfo: ref.watch(networkInfoProvider),
        locationServices: ref.watch(_locationService),
        savedLocationLocal: ref.watch(_savedLocationService)));

final weatherInfoNotifier =
    StateNotifierProvider<WeatherInfoNotifier, ResultState>(
        (ref) => WeatherInfoNotifier(repo: ref.watch(_weatherRepository)));

final savedLocationNotifier =
    StateNotifierProvider<SavedLocationNotifier, String>(
        (ref) => SavedLocationNotifier(repo: ref.watch(_weatherRepository)));
