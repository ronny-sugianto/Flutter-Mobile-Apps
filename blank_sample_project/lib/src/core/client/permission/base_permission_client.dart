import 'package:permission_handler/permission_handler.dart';
export 'package:permission_handler/permission_handler.dart';

part 'permission_client.dart';

abstract class BasePermissionClient {
  Future<PermissionStatus> requestLocation();

  Future<int> locationPermissionStatus();

  Future<PermissionStatus> requestCamera();

  Future requestStorage();

  Future storagePermissionStatus();
}
