import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:equatable/equatable.dart';

enum AgoraLiveStatus { initialized, joined, leaved }

class AgoraLiveModel extends Equatable {
  final RtcEngine engine;
  final bool isHost;
  final bool isJoined;
  final int? uid;
  final List<int>? remoteUid;
  final AgoraLiveStatus? status;
  final String? roomKey;
  final bool isAudioEnable;
  final bool isVideoEnable;

  const AgoraLiveModel({
    required this.engine,
    this.isHost = false,
    this.isJoined = false,
    this.isAudioEnable = true,
    this.isVideoEnable = true,
    this.roomKey,
    this.uid,
    this.remoteUid,
    this.status,
  });

  copyWith({
    RtcEngine? engine,
    bool? isJoined,
    bool? isHost,
    bool? isAudioEnable,
    bool? isVideoEnable,
    int? uid,
    List<int>? remoteUid,
    AgoraLiveStatus? status,
    String? roomKey,
  }) =>
      AgoraLiveModel(
        engine: engine ?? this.engine,
        isJoined: isJoined ?? this.isJoined,
        isHost: isHost ?? this.isHost,
        isAudioEnable: isAudioEnable ?? this.isAudioEnable,
        isVideoEnable: isVideoEnable ?? this.isVideoEnable,
        uid: uid ?? this.uid,
        remoteUid: remoteUid ?? this.remoteUid,
        status: status ?? this.status,
        roomKey: roomKey ?? this.roomKey,
      );

  @override
  List<Object?> get props => [
        engine,
        isJoined,
        isHost,
        isAudioEnable,
        isVideoEnable,
        uid,
        remoteUid,
        status,
        roomKey,
      ];
}
