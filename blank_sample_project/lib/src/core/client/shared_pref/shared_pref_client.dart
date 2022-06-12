part of 'base_shared_pref_client.dart';

/// Shared preference client
class SharedPrefClient extends BaseSharedPrefClient {
  SharedPrefClient._();

  static final SharedPrefClient _instance = SharedPrefClient._();
  static SharedPrefClient get instance => _instance;

  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> get _client async {
    if (_sharedPreferences != null) {
      return _sharedPreferences!;
    }

    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future getByKey(String key, SharedPrefType type) async {
    try {
      dynamic data;
      SharedPreferences client = await _client;

      if (type == SharedPrefType.string) {
        data = client.getString(key);
      } else if (type == SharedPrefType.int) {
        data = client.getInt(key);
      }

      return data;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveByKey(data, String key, SharedPrefType type) async {
    SharedPreferences client = await _client;

    if (type == SharedPrefType.string) {
      await client.setString(key, data);
    } else if (type == SharedPrefType.int) {
      await client.setInt(key, data);
    }

    return;
  }

  @override
  Future<bool> deleteByKey(String key) async {
    try {
      SharedPreferences client = await _client;
      client.remove(key);

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> clearAll() async {
    try {
      if (_sharedPreferences == null) {
        return false;
      }

      return await _sharedPreferences!.clear();
    } catch (e) {
      return false;
    }
  }
}
