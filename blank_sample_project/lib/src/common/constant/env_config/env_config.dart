/// Build-time environment configs
///
/// These values are coming from `--dart-define` command arguments
class EnvConfig {
  static const env = String.fromEnvironment(
    'ENV',
    defaultValue: 'DEV',
  );

  static const envTag = String.fromEnvironment(
    'ENV_TAG',
    defaultValue: '',
  );

  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
  );

  static const googleMapsApiKey = String.fromEnvironment(
    'GOOGLE_MAPS_API_KEY',
  );

  static const defaultMsTimeout = int.fromEnvironment(
    'DEFAULT_MS_TIMEOUT',
    defaultValue: 30000,
  );
}
