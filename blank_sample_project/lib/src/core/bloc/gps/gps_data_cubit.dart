import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder2/geocoder2.dart';

class GpsDataCubit extends Cubit<BaseState<Gps>> {
  final BasePermissionClient permissionClient;
  final BaseGeolocatorClient geolocatorClient;
  final BaseGeocoderClient geocoderClient;

  GpsDataCubit({
    required this.permissionClient,
    required this.geolocatorClient,
    required this.geocoderClient,
  }) : super(InitializedState(data: Gps()));

  void getStatus() async {
    emit(const LoadingState());
    Gps result = Gps();

    try {
      int permissionCode = await permissionClient.locationPermissionStatus();
      debugPrint('-------------> $permissionCode');
      result = result.copyWith(
        permissionStatus: permissionCode >= 3 && permissionCode <= 5,
      );
    } catch (e) {
      debugPrint('Error while get permission location status : $e');
    }

    if (result.permissionStatus == true) {
      try {
        result = result.copyWith(
          latlong: await geolocatorClient.getCurrentPosition(),
        );
      } catch (e) {
        debugPrint('Error while get latlong : $e');
        result = result.copyWith(
          permissionStatus: false,
        );
      }
    }

    if (result.latlong != null) {
      try {
        GeoData geoData = await geocoderClient.getByCoordinates(
          long: result.latlong?.longitude ?? 0,
          lat: result.latlong?.latitude ?? 0,
        );

        result = result.copyWith(address: geoData.address);
      } catch (e) {
        debugPrint('Error while get address : $e');
      }
    }

    return emit(LoadedState(data: result));
  }
}
