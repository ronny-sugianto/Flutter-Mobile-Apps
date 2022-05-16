import 'package:blank_sample_project/src/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base class for all screen argument models
class ScreenArgument extends BaseModel {
  /// Bloc that will be passed into another screen
  final BlocBase<Object?>? bloc;

  /// Model for spesific screen argument, please consider using its own class
  /// argument to avoid dynamic type. Because flutter disable mirroring, please
  /// be careful when casting the data property on each screens
  final Object? data;

  /// Indicate current [RouteName]
  ///
  /// Some implementation need to know current route to determine certain behaviour
  final String? currentRoute;

  ScreenArgument({
    this.bloc,
    this.data,
    this.currentRoute,
  });

  @override
  copyWith({
    BlocBase<Object?>? bloc,
    Object? data,
    String? currentRoute,
  }) =>
      ScreenArgument(
        bloc: bloc ?? this.bloc,
        data: data ?? this.data,
        currentRoute: currentRoute ?? this.currentRoute,
      );

  @override
  List<Object?> get props => [
        bloc,
        data,
        currentRoute,
      ];
}
