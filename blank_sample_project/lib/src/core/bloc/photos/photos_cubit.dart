import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosCubit extends Cubit<BaseState<List<Photos>?>> {
  final BaseImageRepository imageRepository;
  PhotosCubit({
    required this.imageRepository,
  }) : super(const InitializedState());

  void getImage() async {
    emit(const LoadingState());
    List<Photos>? result = [];
    try {
      result = await imageRepository.getAll();
    } catch (e) {
      debugPrint('Error while get photos : $e');
      return emit(ErrorState(error: '$e'));
    }

    emit(LoadedState(data: result));
  }
}
