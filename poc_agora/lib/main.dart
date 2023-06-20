import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_agora/core/core.dart';
import 'package:poc_agora/ui/ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MainObserverBloc();
  runApp(const AppInitializeScreen());
}
