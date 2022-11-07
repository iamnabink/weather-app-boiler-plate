abstract class SettingsRepository{

  Future<bool> isFirstTime();
  void setFirstTime(bool value);

}