/// Author:    Nabraj Khadka
/// Created:   17.03.2022
/// Description:
///*/

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/routes/di.dart';
import 'package:moru_weather/routes/router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/presentation/resources/constants.dart';
import 'core/presentation/resources/theme_data.dart';

/// Main Common functions before run app execution
Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  //environment file
  await dotenv.load(
      fileName: "assets/.env",
      mergeWith: Platform.environment); //dotenv.env['BASE_URL'];

  // await Firebase.initializeApp();
// changing system ui overflow color to transparent so that we can use our own custom color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  //disable Landscape mode
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class Application extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _router = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: kAppName,
      routerDelegate: AutoRouterDelegate(
        _router,
        navigatorObservers: () => [
          SentryNavigatorObserver(),
          MyRouteObserver(),
        ],
      ),
      routeInformationParser: _router.defaultRouteParser(),
      locale: DevicePreview.locale(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: appTheme(),
    );
  }
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}
