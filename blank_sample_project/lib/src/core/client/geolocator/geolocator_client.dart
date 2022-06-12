part of 'base_geolocator_client.dart';

class GeolocatorClient extends BaseGeolocatorClient {
  GeolocatorClient._();
  static final GeolocatorClient _instance = GeolocatorClient._();
  static GeolocatorClient get instance => _instance;

  @override
  Future<LocationPermission> checkGeolocationPermissionStatus() async =>
      Geolocator.checkPermission();

  @override
  Future<bool> isGeoLocationServiceEnabled() async =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<Position> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async =>
      Geolocator.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        forceAndroidLocationManager: forceAndroidLocationManager,
        timeLimit: timeLimit,
      );

  @override
  Future<Position?> getLastKnownPosition({
    bool forceAndroidLocationManager = false,
  }) async =>
      Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: forceAndroidLocationManager,
      );

  @override
  Future<bool> openAppSettings() async => Geolocator.openAppSettings();

  @override
  Future<LocationPermission> requestPermission() async =>
      Geolocator.requestPermission();
}
