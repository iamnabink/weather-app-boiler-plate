import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/features/help/domain/repository/settings_repository.dart';
import '../../../core/di/injection.dart';
import '../../../routes/di.dart';
import '../data/repository/setting_repo_impl.dart';
import '../presentation/provider/start_up_provider.dart';

final settingsRepository =
    Provider<SettingsRepository>((ref) => SettingsRepositoryImpl(
          secureStorage: ref.watch(sharedPrefsProvider),
        ));

var startupProvider = Provider<StartUpProvider>((ref) {
  return StartUpProvider(
      repo: ref.watch(settingsRepository), router: ref.watch(routerProvider));
});
