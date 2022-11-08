
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/routes/router.gr.dart';

import '../features/help/di/di.dart';
import 'route_guard.dart';

/// Task - Use - dependency injection libraries

// * DI for auto route
final routeGuardProvider =
Provider((ref) => InitialRouteGuard(ref.watch(settingsRepository)));
final routerProvider = Provider(
  // (ref) => AppRouter());
        (ref) => AppRouter(initialRouteGuard: ref.watch(routeGuardProvider)));
// * DI for auto route