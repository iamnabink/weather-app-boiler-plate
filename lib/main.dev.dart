/// Author:    Nabraj Khadka
/// Created:   08.11.2022
/// Description: Main entry (point) file - development
///*/

import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'main_common.dart';

Future<void> main() async {
  await mainCommon();
  runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => ProviderScope(observers: [Logger()],child:  Application()),
      ));
  // runApp(MyApp());
}