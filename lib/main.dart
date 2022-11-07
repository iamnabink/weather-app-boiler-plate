/// Author:    Nabraj Khadka
/// Created:   17.03.2022
///
/// Description: Main entry (point) file - Production
///

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'main_common.dart';


Future<void> main() async {
  await mainCommon();
  await runZonedGuarded(() async {
    await SentryFlutter.init(
          (options) {
        options.dsn =
        dotenv.env['SENTRY_DSN'];
      },
    );
    runApp(ProviderScope(observers: [Logger()],child:  Application()));
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
  // runApp(MyApp());
}



