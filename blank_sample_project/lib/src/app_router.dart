import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Application router
///
/// This class handle named routing for entire application.
class AppRouter {
  /// Delegates for screen routing
  Route onGenerateRoute(RouteSettings routeSettings) {
    final ScreenArgument? args = routeSettings.arguments != null
        ? routeSettings.arguments as ScreenArgument
        : null;

    switch (routeSettings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.splashScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SplashScreen(),
                )
              : const SplashScreen(),
        );

      case RouteName.landingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.landingScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LandingScreen(),
                )
              : const LandingScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteName.notFoundScreen,
          ),
          builder: (context) => const GeneralNotFoundScreen(),
        );
    }
  }
}
