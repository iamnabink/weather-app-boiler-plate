import 'package:moru_weather/features/help/domain/repository/settings_repository.dart';
import '../../../../routes/router.gr.dart';

class StartUpProvider {
  SettingsRepository repo;
  AppRouter router;

  StartUpProvider({required this.repo, required this.router});

  Future<bool> isFirstTime() async {
    return await repo.isFirstTime();
  }

  void goToHomePage() async {
    await router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }

  void skipHelpPage() async {
    repo.setFirstTime(false);
    await router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }
}
