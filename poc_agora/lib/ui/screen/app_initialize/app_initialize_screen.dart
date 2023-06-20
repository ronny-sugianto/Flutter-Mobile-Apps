import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_agora/core/core.dart';
import 'package:poc_agora/ui/ui.dart';

class AppInitializeScreen extends StatelessWidget {
  const AppInitializeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AgoraCubit()..initialize())
      ],
      child: const AppMainScreen(),
    );
  }
}
