import 'package:blank_sample_project/src/common/common.dart';
import 'package:geolocator/geolocator.dart';

class Gps extends BaseModel {
  final bool? permissionStatus;
  final Position? latlong;
  final String? address;

  Gps({this.permissionStatus = false, this.latlong, this.address});

  @override
  Map<String, dynamic> toJson() => {
        'permission_status': permissionStatus,
        'latlong': latlong,
        'address': address,
      };

  @override
  copyWith({
    bool? permissionStatus,
    Position? latlong,
    String? address,
  }) =>
      Gps(
        permissionStatus: permissionStatus ?? this.permissionStatus,
        latlong: latlong ?? this.latlong,
        address: address ?? this.address,
      );

  @override
  List<Object?> get props => [permissionStatus, latlong, address];
}
