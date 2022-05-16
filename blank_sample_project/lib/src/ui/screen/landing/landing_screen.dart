import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/ui/ui.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayerWidget(
            videoMeta: VideoMeta(
              streamUrl:
                  'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_1920_18MG.mp4',
              isPlaying: true,
            ),
          ),
        ),
      ),
    );
  }
}
