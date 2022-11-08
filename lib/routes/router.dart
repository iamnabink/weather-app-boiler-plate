import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moru_weather/routes/route_guard.dart';

import '../features/help/presentation/page/help.dart';
import '../features/home/presentation/page/home.dart';

/*
flutter packages pub run build_runner build --delete-conflicting-outputs
*/
/// navigating between screens, choose the approach that makes most sense in terms of usability.

/// register screen here
@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HelpPage, guards: [InitialRouteGuard], initial: true),
    AutoRoute(page: HomePage)

    // redirect all other paths
    // RedirectRoute(path: '*', redirectTo: 'login'),
  ],
)
class $AppRouter {}
/// router observer
class MyRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('New route popped: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('New route removed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
