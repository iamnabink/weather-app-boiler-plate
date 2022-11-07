import 'package:auto_route/auto_route.dart';
import 'package:moru_weather/routes/router.gr.dart';

import '../features/help/domain/repository/settings_repository.dart';

/// An auto_route guard object that routes the user to our Home page
class InitialRouteGuard extends AutoRouteGuard {
  SettingsRepository repo;

  InitialRouteGuard(this.repo);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Here we check if the user is first time
    // not logged in)
    if (await repo.isFirstTime() == true) {
      resolver.next();
    } else {
      await router.push(const HomeRoute());
    }
  }
}
