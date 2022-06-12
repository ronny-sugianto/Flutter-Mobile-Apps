import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_client.dart';

/// Type definition for shared preference
enum SharedPrefType {
  string,
  int,
}

/// Local storage using Shared Preference Client
abstract class BaseSharedPrefClient {
  /// Get local data by key
  Future getByKey(String key, SharedPrefType type);

  /// Save local data by key
  Future<void> saveByKey(data, String key, SharedPrefType type);

  /// Delete local data by key
  Future<bool> deleteByKey(String key);

  /// Clear all local data
  Future<bool> clearAll();
}
