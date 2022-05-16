import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerFullScreen extends StatelessWidget {
  const VideoPlayerFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: (ModalRoute.of(context)?.settings.arguments != null &&
              ModalRoute.of(context)?.settings.arguments is VideoMeta)
          ? WillPopScope(
              onWillPop: () async => false,
              child: VideoPlayerWidget(
                videoMeta:
                    ModalRoute.of(context)?.settings.arguments as VideoMeta,
              ),
            )
          : Container(),
    );
  }
}
