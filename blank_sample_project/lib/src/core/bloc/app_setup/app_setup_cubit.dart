import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSetupCubit extends Cubit<BaseState> {
  AppSetupCubit() : super(const InitializedState());

  void initialize() async {
    emit(const LoadingState());

    await Future.delayed(const Duration(seconds: 3));

    emit(const LoadedState());
  }
}
