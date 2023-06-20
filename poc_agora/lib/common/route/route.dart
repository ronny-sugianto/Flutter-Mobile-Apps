import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_agora/common/constant/constant.dart';
import 'package:poc_agora/ui/ui.dart';

class AppRoute {
  static GoRouter get instance => GoRouter(
        initialLocation: homeScreen,
        routes: <RouteBase>[
          GoRoute(
              path: homeScreen,
              builder: (BuildContext _, GoRouterState __) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: createLiveScreen,
                  builder: (BuildContext context, GoRouterState state) {
                    return const CreateLiveScreen();
                  },
                ),
                GoRoute(
                  path: liveScreen,
                  builder: (BuildContext context, GoRouterState state) {
                    return const LiveScreen();
                  },
                ),
              ]),
        ],
      );
}
