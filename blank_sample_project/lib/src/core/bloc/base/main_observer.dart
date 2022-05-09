import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main observer that observes all state changes.
class MainBlocObserver extends BlocObserver {
  MainBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
      '\n===================================================\n'
      'Tag                      : Updated\n'
      'ClassName                : ${bloc.runtimeType}\n'
      'Message or StackTrace    : $change\n',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(
      '\n===================================================\n'
      'Tag        : Error\n'
      'ClassName  : ${bloc.runtimeType}\n'
      'Message    : $error\n'
      'StackTrace : $stackTrace\n',
    );
  }
}
