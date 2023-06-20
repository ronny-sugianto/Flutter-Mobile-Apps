import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poc_agora/common/common.dart';
import 'package:poc_agora/core/core.dart';

class AgoraCubit extends Cubit<BaseState<AgoraLiveModel>> {
  AgoraCubit() : super(const InitializedState());

  // static const String _appId = "4e541d6514e548feb07be7099bfc0dd6";
  static const String _appId = "01254a6c76514e4787628f4b6bdc1786";

  void initialize() async {
    RtcEngine? agoraEngine;
    try {
      emit(const LoadingState());
      // retrieve or request camera and microphone permissions
      await [Permission.microphone, Permission.camera].request();

      // Agora engine instance
      agoraEngine = createAgoraRtcEngine();

      await agoraEngine.initialize(const RtcEngineContext(appId: _appId));
    } catch (e) {
      return emit(ErrorState(error: e.toString()));
    }
    emit(
      SuccessState(
        data: AgoraLiveModel(
          engine: agoraEngine,
          status: AgoraLiveStatus.initialized,
        ),
        timestamp: DateTime.now(),
      ),
    );
  }

  void join({
    required RtcEngine rtcEngine,
    ClientRoleType roleLive = ClientRoleType.clientRoleBroadcaster,
    required String channelId,
    String token = '',
    int uid = 0,
  }) async {
    print("roleLive =========> $roleLive");
    try {
      // Set channel options
      ChannelMediaOptions options = ChannelMediaOptions(
        clientRoleType: roleLive,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      );

      await rtcEngine.enableVideo();
      await rtcEngine.enableAudio();
      await rtcEngine.startPreview();

      await rtcEngine.joinChannel(
        token: token,
        channelId: channelId,
        uid: uid,
        options: options,
      );
    } catch (e) {
      return emit(ErrorState(error: e.toString()));
    }

    emit(
      SuccessState(
        data: state.data?.copyWith(
          status: AgoraLiveStatus.joined,
          roomKey: channelId,
          isHost: roleLive == ClientRoleType.clientRoleBroadcaster,
          remoteUid: [],
        ),
        timestamp: DateTime.now(),
      ),
    );

    setListener(
      onJoinChannelSuccess: (conn, _) => setLocalId(conn.localUid ?? 0),
      onUserJoined: (conn, remoteId, _) => setUserId(remoteId),
      onUserOffline: (conn, remoteId, _) => removeUserId(remoteId),
    );
  }

  void leave({required RtcEngine rtcEngine}) async {
    emit(const LoadingState());

    try {
      rtcEngine.leaveChannel();
    } catch (e) {
      return emit(ErrorState(error: e.toString()));
    }

    emit(
      SuccessState(
        data: AgoraLiveModel(
          engine: rtcEngine,
          status: AgoraLiveStatus.leaved,
        ),
        timestamp: DateTime.now(),
      ),
    );
  }

  void setLocalId(int id) => emit(
        SuccessState(
          data: state.data?.copyWith(uid: id),
          timestamp: DateTime.now(),
        ),
      );

  void setUserId(int id) async {
    List<int> listRemoteId = state.data?.remoteUid ?? [];
    listRemoteId.add(id);
    listRemoteId = listRemoteId.toSet().toList();

    emit(
      SuccessState(
        data: state.data?.copyWith(remoteUid: listRemoteId),
        timestamp: DateTime.now(),
      ),
    );
  }

  void removeUserId(int id) async {
    List<int> listRemoteId = state.data?.remoteUid ?? [];
    listRemoteId.remove(state.data?.uid);
    listRemoteId.remove(id);
    listRemoteId = listRemoteId.toSet().toList();

    emit(
      SuccessState(
        data: state.data?.copyWith(remoteUid: listRemoteId),
        timestamp: DateTime.now(),
      ),
    );
  }

  void autoSetAudio() {
    if (state.data?.isAudioEnable == true) {
      state.data?.engine.enableLocalAudio(false);
    } else {
      state.data?.engine.enableLocalAudio(true);
    }

    emit(
      SuccessState(
        data: state.data?.copyWith(isAudioEnable: !state.data!.isAudioEnable),
        timestamp: DateTime.now(),
      ),
    );
  }

  void autoSetVideo() {
    if (state.data?.isVideoEnable == true) {
      state.data?.engine.enableLocalVideo(false);
    } else {
      state.data?.engine.enableLocalVideo(true);
    }

    emit(
      SuccessState(
        data: state.data?.copyWith(isVideoEnable: !state.data!.isVideoEnable),
        timestamp: DateTime.now(),
      ),
    );
  }

  void setListener({
    Function(
      RtcConnection connection,
      int elapsed,
    )? onJoinChannelSuccess,
    Function(
      RtcConnection connection,
      int remoteUid,
      int elapsed,
    )? onUserJoined,
    Function(
      RtcConnection connection,
      int remoteUid,
      UserOfflineReasonType reason,
    )? onUserOffline,
  }) =>
      emit(
        SuccessState(
          data: state.data
            ?..engine.registerEventHandler(
              RtcEngineEventHandler(
                onJoinChannelSuccess: onJoinChannelSuccess,
                onUserJoined: onUserJoined,
                onUserOffline: onUserOffline,
              ),
            ),
          timestamp: DateTime.now(),
        ),
      );
}
