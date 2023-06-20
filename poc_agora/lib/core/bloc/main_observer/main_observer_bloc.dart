import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MainObserverBlocTag { change, error }

class MainObserverBloc extends BlocObserver {
  MainObserverBloc();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    _printLog(
      tag: MainObserverBlocTag.change,
      className: bloc.runtimeType.toString(),
      message: '${change.nextState}',
      stackTrace: change.toString(),
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    _printLog(
      tag: MainObserverBlocTag.error,
      className: bloc.runtimeType.toString(),
      stackTrace: stackTrace.toString(),
      exception: error.toString(),
    );
  }

  void _printLog({
    required MainObserverBlocTag tag,
    required String className,
    String? message,
    String? stackTrace,
    String? exception,
  }) {
    String date = DateTime.now().toIso8601String();

    String fullMessage = "[$tag: $date]\n"
        "Class: $className \n"
        "Message: $message \n"
        "Exception: $exception \n"
        "Stack trace: $stackTrace";

    debugPrint(fullMessage);
  }
}
