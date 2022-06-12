import 'package:geolocator/geolocator.dart';

part 'geolocator_client.dart';

abstract class BaseGeolocatorClient {
  Future<LocationPermission> checkGeolocationPermissionStatus();
  Future<bool> isGeoLocationServiceEnabled();
  Future<Position> getCurrentPosition({
    LocationAccuracy desiredAccuracy,
    bool forceAndroidLocationManager,
    Duration timeLimit,
  });
  Future<Position?> getLastKnownPosition({
    bool forceAndroidLocationManager = false,
  });
  Future<bool> openAppSettings();
  Future<LocationPermission> requestPermission();
}
