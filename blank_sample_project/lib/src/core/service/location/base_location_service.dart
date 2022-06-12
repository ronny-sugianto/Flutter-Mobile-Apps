import 'dart:async';
import 'dart:developer';

import 'package:blank_sample_project/src/core/core.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';

part 'location_service.dart';

/// Base class for location service
abstract class BaseLocationService {
  /// Initialize location service.
  Future<bool> initialize();

  /// Get current position or latest location if necessary
  Future<Position?> getLastLocation();

  /// Get location details for presenter layer
  Future<GeoData?> reserveLocation();

  /// Check if geolocation permission is enabled
  Future<bool> isGeoLocationPermissionEnabled();

  /// Check if geolocation service is enabled
  Future<bool> isGeoLocationServiceEnabled();

  /// Check if location service is enable and ready to use
  Future<bool> isLocationServiceEnabled();

  /// Prompt location settings dialog
  Future<void> activateLocation();
}
