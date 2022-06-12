part of 'base_permission_client.dart';

class PermissionClient extends BasePermissionClient {
  PermissionClient._();

  static final PermissionClient _instance = PermissionClient._();

  static PermissionClient get instance => _instance;

  @override
  Future<PermissionStatus> requestLocation() async =>
      Permission.location.request();

  @override
  Future<int> locationPermissionStatus() async => Permission.location.value;

  @override
  Future<PermissionStatus> requestCamera() async => Permission.camera.request();

  @override
  Future<PermissionStatus> requestStorage() async =>
      Permission.storage.request();

  @override
  Future<PermissionStatus> storagePermissionStatus() async =>
      Permission.storage.status;
}
