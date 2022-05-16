import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'video_player_progress_seekbar_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoMeta videoMeta;

  const VideoPlayerWidget({
    Key? key,
    required this.videoMeta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, BaseState<VideoMeta?>>(
      bloc: context.read<VideoPlayerCubit>()..initialize(videoMeta: videoMeta),
      builder: (context, state) {
        if (state is LoadedState && state.data?.controller != null) {
          return GestureDetector(
            onTap: () => context
                .read<VideoPlayerCubit>()
                .showHideMenuControl(state.data!),
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: state.data?.controller?.value.isInitialized ==
                            true
                        ? state.data?.controller!.value.aspectRatio ?? 16 / 9
                        : 16 / 9,
                    child: VideoPlayer(state.data!.controller!),
                  ),

                  // Overlay
                  Stack(
                    children: [
                      IgnorePointer(
                        child: Container(
                          color: state.data!.isShowControl == true
                              ? Colors.black.withOpacity(.5)
                              : Colors.transparent,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 7,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child:
                                  state.data!.controller!.value.isBuffering ||
                                          !state.data!.controller!.value
                                              .isInitialized
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(.5),
                                            color: Colors.white,
                                          ),
                                        )
                                      : state.data!.isShowControl == true
                                          ? _btnPlayPause(
                                              context,
                                              videoMeta: state.data!,
                                            )
                                          : Container(),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: state.data!.isShowControl == true
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _parseTime(state.data!.controller!),
                                            style: UIFontStyle.h8Regular(
                                              color: Colors.white,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => _onFullOrNormalTap(
                                              context,
                                              videoMeta: state.data!,
                                            ),
                                            child: Icon(
                                              (MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.portrait)
                                                  ? Icons.fullscreen_rounded
                                                  : Icons
                                                      .fullscreen_exit_rounded,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      if (state.data!.isShowControl == true) ...[
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: VideoPlayerProgressSeekBarWidget(
                            progress: state.data!.controller!.value.position,
                            total: state.data!.controller!.value.duration,
                            baseBarColor: Colors.white.withOpacity(.5),
                            progressBarColor: Colors.white,
                            bufferedBarColor: Colors.white.withOpacity(.7),
                            thumbColor: Colors.white,
                            barHeight: 5,
                            barCapShape: BarCapShape.square,
                            thumbRadius: 5,
                            thumbGlowRadius: 5,
                            timeLabelLocation: TimeLabelLocation.none,
                            onDragUpdate: (ThumbDragDetails details) {
                              state.data!.controller!.seekTo(details.timeStamp);
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: Text('Error'),
        );
      },
    );
  }

  void _onFullOrNormalTap(
    BuildContext context, {
    required VideoMeta videoMeta,
  }) async {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      final result = await Navigator.pushNamed(
        context,
        RouteName.videoPlayerFullScreen,
        arguments: ScreenArgument(
          data: videoMeta.copyWith(
            currentPosition: videoMeta.controller!.value.position,
            isPlaying: videoMeta.controller!.value.isPlaying,
          ),
        ),
      );

      if (result != null && result is VideoMeta) {
        context.read<VideoPlayerCubit>().sync(
              videoMeta.copyWith(
                currentPosition: result.currentPosition,
                isPlaying: result.isPlaying == true,
              ),
            );
      }
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      Navigator.pop(
        context,
        videoMeta.copyWith(
          currentPosition: videoMeta.controller!.value.position,
          isPlaying: videoMeta.controller!.value.isPlaying,
        ),
      );
    }
  }

  Widget _btnPlayPause(
    BuildContext context, {
    required VideoMeta videoMeta,
  }) =>
      GestureDetector(
        onTap: () => context.read<VideoPlayerCubit>().playPause(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.5),
            border: Border.all(color: Colors.white, width: .5),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            videoMeta.isFinish == true
                ? Icons.replay_rounded
                : videoMeta.isPlaying == true
                    ? Icons.pause
                    : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      );

  String _parseTime(VideoPlayerController videoPlayerController) =>
      '${Utils().getVideoTimeString(videoPlayerController.value.position)}'
      ' / '
      '${Utils().getVideoTimeString(videoPlayerController.value.duration)}';
}
