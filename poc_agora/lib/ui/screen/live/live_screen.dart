import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc_agora/common/common.dart';
import 'package:poc_agora/core/core.dart';
import 'package:poc_agora/ui/ui.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<AgoraCubit, BaseState<AgoraLiveModel>>(
          listener: (context, state) {
            if (state is SuccessState &&
                state.data?.status == AgoraLiveStatus.leaved) {
              context
                ..pop()
                ..read<AgoraCubit>().initialize();
            }
          },
          builder: (context, state) {
            if (state is SuccessState &&
                state.data?.status == AgoraLiveStatus.joined) {
              final agoraData = state.data;
              return Stack(
                children: [
                  LiveUsersJoinedWidget(
                    children: [
                      if (agoraData?.isHost == true) ...[
                        LiveUserJoinedItemCardWidget(
                          engine: agoraData!.engine,
                          userId: 0,
                          isHost: true,
                          isFullscreen: agoraData.remoteUid?.isEmpty == true ||
                              agoraData.remoteUid?.length == 3,
                          isVideoEnable: agoraData.isVideoEnable,
                          roomKey: agoraData.roomKey ?? '-',
                        ),
                      ],
                      ...?agoraData?.remoteUid
                          ?.toSet()
                          .toList()
                          .map(
                            (userId) => LiveUserJoinedItemCardWidget(
                              engine: agoraData.engine,
                              userId: userId,
                              isHost: false,
                              isFullscreen: (){
                                var isFullscreen = agoraData.remoteUid?.length == 3;
                                if(agoraData.isHost) {
                                  isFullscreen = isFullscreen || agoraData.remoteUid?.isEmpty == true;
                                } else {
                                  isFullscreen = isFullscreen || agoraData.remoteUid?.length == 1;
                                }

                                return isFullscreen;
                              }(),
                              roomKey: agoraData.roomKey ?? '-',
                            ),
                          )
                          .toList()
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    padding: const EdgeInsets.all(8),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            child: Text(
                              agoraData?.roomKey ?? '-',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      'LIVE',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      '${agoraData?.remoteUid?.length ?? 0} ${agoraData?.isHost == true ? 'Joined' : 'Streamer'}',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (agoraData?.isHost == true) ...[
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => context
                                          .read<AgoraCubit>()
                                          .autoSetVideo(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.5),
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(right: 8),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color:
                                              agoraData?.isVideoEnable == true
                                                  ? Colors.white
                                                  : Colors.red,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context
                                          .read<AgoraCubit>()
                                          .autoSetAudio(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.5),
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          agoraData?.isAudioEnable == true
                                              ? Icons.mic_none_rounded
                                              : Icons.mic_off_rounded,
                                          color:
                                              agoraData?.isAudioEnable == true
                                                  ? Colors.white
                                                  : Colors.red,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (agoraData?.isHost == false &&
                      (agoraData?.remoteUid == null ||
                          agoraData?.remoteUid?.isEmpty == true)) ...[
                    Container(
                      color: Colors.black.withOpacity(.4),
                      width: double.infinity,
                      height: double.maxFinite,
                      alignment: Alignment.center,
                      child: Text(
                        'Waiting for a host join',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 16,
                    child: GestureDetector(
                      onTap: () => context.read<AgoraCubit>().leave(
                            rtcEngine: agoraData!.engine,
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.5),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.power_settings_new_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 16,
                  //   right: 16,
                  //   bottom: 0,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         height: 154,
                  //         margin: const EdgeInsets.only(bottom: 25),
                  //         child: ListView(
                  //           physics: const PageScrollPhysics(),
                  //           children: List.generate(10, (index) => _comment()),
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 color: Colors.white.withOpacity(.4),
                  //                 borderRadius: BorderRadius.circular(25),
                  //               ),
                  //               padding: const EdgeInsets.symmetric(
                  //                 vertical: 4,
                  //                 horizontal: 8,
                  //               ),
                  //               margin:
                  //                   const EdgeInsets.symmetric(vertical: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Expanded(
                  //                     child: TextFormField(
                  //                       decoration: InputDecoration(
                  //                         border: InputBorder.none,
                  //                         isDense: true,
                  //                         hintText: 'Type comment here..',
                  //                         hintStyle: GoogleFonts.poppins(
                  //                           fontSize: 12,
                  //                           color: Colors.black.withOpacity(.5),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.send,
                  //                     color: Colors.white,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(width: 10),
                  //           const Icon(
                  //             Icons.card_giftcard,
                  //             color: Colors.amberAccent,
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _comment() => Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.32),
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 1.5,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.people,
              color: Colors.yellow,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              'Wulan',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Kemana aja kaka kok baru live',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
