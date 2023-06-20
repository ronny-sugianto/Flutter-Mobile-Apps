import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveUserJoinedItemCardWidget extends StatelessWidget {
  final RtcEngine engine;
  final String roomKey;
  final int userId;
  final int? giftValue;
  final bool isHost;
  final bool isFullscreen;
  final bool isVideoEnable;
  final bool isAudioEnable;

  const LiveUserJoinedItemCardWidget({
    Key? key,
    required this.engine,
    required this.roomKey,
    required this.userId,
    this.giftValue,
    this.isHost = false,
    this.isFullscreen = false,
    this.isVideoEnable = true,
    this.isAudioEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("x2xx =========> $isHost - $userId - $roomKey - $isFullscreen");
    return Container(
      height: isFullscreen ? double.maxFinite : 253.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          AgoraVideoView(
            controller: isHost == true
                ? VideoViewController(
                    rtcEngine: engine,
                    canvas: VideoCanvas(
                      uid: userId,
                      renderMode: RenderModeType.renderModeAdaptive,
                    ),
                  )
                : VideoViewController.remote(
                    rtcEngine: engine,
                    canvas: VideoCanvas(
                      uid: userId,
                      renderMode: RenderModeType.renderModeAdaptive,
                    ),
                    connection: RtcConnection(channelId: roomKey),
                  ),
          ),
          if (isHost == false) ...[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.54),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Text(
                    userId.toString(),
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (giftValue != null) ...[
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.54),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.yellow,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${giftValue ?? 0}',
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            )
          ],
          if (!isVideoEnable) ...[
            Container(
              color: Colors.black.withOpacity(.4),
              width: double.infinity,
              height: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                'Video Paused',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
