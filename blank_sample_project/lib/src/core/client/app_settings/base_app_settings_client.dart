import 'package:app_settings/app_settings.dart';

part 'app_settings_client.dart';

abstract class BaseAppSettingsClient {
  /// Open location settings for both platforms
  Future<void> openLocationSettings();
}
