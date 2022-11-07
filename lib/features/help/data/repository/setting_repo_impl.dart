import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moru_weather/features/help/domain/repository/settings_repository.dart';
import '../../../../core/data/local/storage_const.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  // final secureStorage secureStorage;
  final FlutterSecureStorage secureStorage;

  SettingsRepositoryImpl({required this.secureStorage});

  @override
  void setFirstTime(bool value) => secureStorage.write(
      key: LocalStorageConst.kIsFirstTime, value: value.toString());

  @override
  Future<bool> isFirstTime() async {
    try {
      final isFirstTime = await secureStorage.read(key: LocalStorageConst.kIsFirstTime);
      return isFirstTime == null;
    } catch (e) {
      return true;
    }
  }
}
