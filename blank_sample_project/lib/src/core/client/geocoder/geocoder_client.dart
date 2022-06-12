part of 'base_geocoder_client.dart';

class GeocoderClient extends BaseGeocoderClient {
  GeocoderClient._();

  static final GeocoderClient _instance = GeocoderClient._();

  static GeocoderClient get instance => _instance;

  @override
  Future<GeoData> getByAddress(String address) => Geocoder2.getDataFromAddress(
        address: address,
        googleMapApiKey: EnvConfig.googleMapsApiKey,
      );

  @override
  Future<GeoData> getByCoordinates({
    required double long,
    required double lat,
  }) =>
      Geocoder2.getDataFromCoordinates(
        latitude: lat,
        longitude: long,
        googleMapApiKey: EnvConfig.googleMapsApiKey,
      );
}
