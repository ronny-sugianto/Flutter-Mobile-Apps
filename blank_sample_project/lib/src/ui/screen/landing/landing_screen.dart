import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/ui/ui.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sample Blank Project',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.photosScreen,
                  ),
                  text: 'Get Photos',
                ),
                ButtonWidget(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.gpsScreen,
                  ),
                  text: 'Get GPS',
                ),
                ButtonWidget(
                  onTap: () => null,
                  text: 'Root Status : False ',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
