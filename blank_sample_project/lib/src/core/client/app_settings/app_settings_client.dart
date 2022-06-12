part of 'base_app_settings_client.dart';

class AppSettingsClient extends BaseAppSettingsClient {
  AppSettingsClient._();
  static final AppSettingsClient _instance = AppSettingsClient._();
  static AppSettingsClient get instance => _instance;

  @override
  Future<void> openLocationSettings() async =>
      AppSettings.openLocationSettings();
}
