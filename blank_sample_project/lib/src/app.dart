import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'common/common.dart';
import 'core/core.dart';

class SetupApp extends StatelessWidget {
  final Alice alice;
  final BaseApiClient apiClient;
  final BaseAppSettingsClient appSettingsClient;
  final BaseGeocoderClient geocoderClient;
  final BaseGeolocatorClient geolocatorClient;
  final BasePermissionClient permissionClient;
  final BaseSharedPrefClient sharedPrefClient;
  final BaseImageRepository imageRepository;

  const SetupApp({
    Key? key,
    required this.alice,
    required this.apiClient,
    required this.appSettingsClient,
    required this.geocoderClient,
    required this.geolocatorClient,
    required this.permissionClient,
    required this.sharedPrefClient,
    required this.imageRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => alice),
        RepositoryProvider(create: (context) => apiClient),
        RepositoryProvider(create: (context) => appSettingsClient),
        RepositoryProvider(create: (context) => geocoderClient),
        RepositoryProvider(create: (context) => geolocatorClient),
        RepositoryProvider(create: (context) => permissionClient),
        RepositoryProvider(create: (context) => sharedPrefClient),
        RepositoryProvider(create: (context) => imageRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSetupCubit()..initialize(),
          ),
        ],
        child: const App(
          title: "Sample Project",
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addObserver(this);

    try {
      context.read<Alice>().setNavigatorKey(_navigatorKey);
    } catch (e) {
      debugPrint('Http Inspector is not implemented: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      locale: const Locale('id', ''),
      builder: (BuildContext context, Widget? child) =>
          BlocListener<AppSetupCubit, BaseState>(
        listener: (context, state) {
          if (state is LoadedState) {
            _navigatorKey.currentState!.pushNamedAndRemoveUntil(
              RouteName.landingScreen,
              (route) => false,
            );
          }
        },
        child: child,
      ),
    );
  }
}
