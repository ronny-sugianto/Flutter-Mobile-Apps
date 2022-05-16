import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCubit extends Cubit<BaseState<VideoMeta?>> {
  VideoPlayerCubit() : super(const InitializedState());

  VideoPlayerController? _controller;

  void initialize({
    required VideoMeta videoMeta,
  }) async {
    if (videoMeta.streamUrl == null || videoMeta.controller != null) return;

    emit(const LoadingState());

    try {
      _controller = state.data?.controller ??
          VideoPlayerController.network(videoMeta.streamUrl!)
        ..initialize().then((_) {
          if (videoMeta.currentPosition != null) {
            _controller?.seekTo(videoMeta.currentPosition!);
          }

          videoMeta.isPlaying == true
              ? _controller?.play()
              : _controller?.pause();
        })
        ..addListener(() {
          sync(videoMeta.copyWith(controller: _controller));
        });
    } catch (e, s) {
      return emit(ErrorState(error: '$e - $s'));
    }

    emit(LoadedState(data: videoMeta.copyWith(controller: _controller)));
  }

  void sync(VideoMeta? videoMeta) => emit(
        LoadedState(
          data: state.data?.copyWith(
            currentPosition: videoMeta?.currentPosition,
            isPlaying: state.data?.controller?.value.isPlaying,
            isFinish: state.data?.controller?.value.position ==
                state.data?.controller!.value.duration,
            isShowControl: videoMeta?.isShowControl,
          ),
          timestamp: DateTime.now(),
        ),
      );

  void showHideMenuControl(VideoMeta videoMeta) => emit(LoadedState(
        data: state.data?.copyWith(
          currentPosition: videoMeta.currentPosition,
          isFinish: state.data?.controller?.value.position ==
              state.data?.controller!.value.duration,
          isShowControl: videoMeta.isShowControl == true ? false : true,
        ),
        timestamp: DateTime.now(),
      ));

  void playPause({VideoMeta? videoMeta}) {
    if (state.data?.isFinish == true) {
      // Replay Video
      state.data?.controller
        ?..seekTo(Duration.zero)
        ..play();
    } else {
      state.data?.isPlaying == true
          ? state.data?.controller?.pause()
          : state.data?.controller?.play();
    }

    emit(
      LoadedState(
        data: state.data?.copyWith(
          isPlaying: state.data?.controller?.value.isPlaying,
        ),
      ),
    );
  }
}
