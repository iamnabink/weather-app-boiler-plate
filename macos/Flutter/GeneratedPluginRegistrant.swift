//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import flutter_secure_storage_macos
import geolocator_apple
import package_info_plus
import path_provider_macos
import sentry_flutter
import shared_preferences_macos
import sqflite

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FlutterSecureStorageMacosPlugin.register(with: registry.registrar(forPlugin: "FlutterSecureStorageMacosPlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  FLTPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlusPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SentryFlutterPlugin.register(with: registry.registrar(forPlugin: "SentryFlutterPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
