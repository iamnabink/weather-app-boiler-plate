abstract class SettingsRepository {
  /// checks whether app is opening for the first time
  Future<bool> isFirstTime();

  /// set first time value
  void setFirstTime(bool value);
}
