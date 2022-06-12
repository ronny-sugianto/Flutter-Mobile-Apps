part of 'base_location_service.dart';

/// Service for handling latest location
class LocationService extends BaseLocationService {
  final BasePermissionClient permissionClient;
  final BaseGeocoderClient geocodingClient;
  final BaseGeolocatorClient geolocatorClient;
  final BaseApiClient apiClient;
  final BaseAppSettingsClient appSettingsClient;

  LocationService({
    required this.permissionClient,
    required this.geocodingClient,
    required this.geolocatorClient,
    required this.apiClient,
    required this.appSettingsClient,
  });

  @override
  Future<bool> initialize() async {
    await permissionClient.requestLocation();

    return await isLocationServiceEnabled();
  }

  @override
  Future<Position?> getLastLocation() async {
    if (!await isLocationServiceEnabled()) {
      return null;
    }

    try {
      return geolocatorClient.getCurrentPosition();
    } catch (e) {
      return geolocatorClient.getLastKnownPosition();
    }
  }

  @override
  Future<GeoData?> reserveLocation() async {
    GeoData? data;

    try {
      Position? position = await getLastLocation();

      if (position != null) {
        data = await geocodingClient.getByCoordinates(
          lat: position.latitude,
          long: position.longitude,
        );
      }
    } catch (e) {
      log('reserveLocation - Error : $e');
    }

    return data;
  }

  @override
  Future<bool> isGeoLocationPermissionEnabled() async {
    final LocationPermission permission =
        await geolocatorClient.checkGeolocationPermissionStatus();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> isGeoLocationServiceEnabled() async =>
      geolocatorClient.isGeoLocationServiceEnabled();

  @override
  Future<bool> isLocationServiceEnabled() async {
    try {
      bool isLocationPermissionEnabled = await isGeoLocationPermissionEnabled();
      bool isGpsEnabled = await geolocatorClient.isGeoLocationServiceEnabled();

      if (isLocationPermissionEnabled && isGpsEnabled) {
        return true;
      }
    } catch (e) {
      log('isLocationServiceEnabled - error checking service: $e');
    }

    return false;
  }

  @override
  Future<void> activateLocation() async {
    await appSettingsClient.openLocationSettings();
  }
}
