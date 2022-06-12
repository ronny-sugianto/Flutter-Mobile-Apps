import 'package:blank_sample_project/src/common/common.dart';
import 'package:geocoder2/geocoder2.dart';

part 'geocoder_client.dart';

abstract class BaseGeocoderClient {
  Future<GeoData> getByAddress(String address);
  Future<GeoData> getByCoordinates({
    required double long,
    required double lat,
  });
}
