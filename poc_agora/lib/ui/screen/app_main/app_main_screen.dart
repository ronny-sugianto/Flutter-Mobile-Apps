import 'package:flutter/material.dart';
import 'package:poc_agora/common/route/route.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  final _appRoute = AppRoute.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRoute.routeInformationParser,
      routeInformationProvider: _appRoute.routeInformationProvider,
      routerDelegate: _appRoute.routerDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
      debugShowCheckedModeBanner: false,
    );
  }
}
