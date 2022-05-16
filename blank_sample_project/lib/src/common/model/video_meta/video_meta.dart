import 'package:blank_sample_project/src/common/common.dart';
import 'package:video_player/video_player.dart';

class VideoMeta extends BaseModel {
  final String? streamUrl;
  final Duration? currentPosition;
  final bool? isPlaying;
  final bool? isFinish;
  final bool? isShowControl;
  final VideoPlayerController? controller;

  VideoMeta({
    this.streamUrl,
    this.currentPosition,
    this.isPlaying,
    this.isFinish,
    this.isShowControl,
    this.controller,
  });

  @override
  copyWith({
    String? streamUrl,
    Duration? currentPosition,
    bool? isPlaying,
    bool? isFinish,
    bool? isShowControl,
    VideoPlayerController? controller,
  }) =>
      VideoMeta(
        streamUrl: streamUrl ?? this.streamUrl,
        currentPosition: currentPosition ?? this.currentPosition,
        isPlaying: isPlaying ?? this.isPlaying,
        isFinish: isFinish ?? this.isFinish,
        isShowControl: isShowControl ?? this.isShowControl,
        controller: controller ?? this.controller,
      );

  @override
  List<Object?> get props => [
        streamUrl,
        currentPosition,
        isPlaying,
        isFinish,
        isShowControl,
        controller,
      ];
}
