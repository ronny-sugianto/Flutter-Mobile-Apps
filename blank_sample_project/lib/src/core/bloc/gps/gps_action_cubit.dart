import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsActionCubit extends Cubit<BaseState> {
  final BasePermissionClient permissionClient;

  GpsActionCubit({required this.permissionClient})
      : super(const InitializedState());

  void requestLocation() async {
    emit(const LoadingState());
    try {
      await permissionClient.requestLocation();
    } catch (e) {
      debugPrint('Error while request permission : $e');
      return emit(ErrorState(error: '$e'));
    }
    emit(const LoadedState());
  }
}
