import 'package:equatable/equatable.dart';

/// Base class for all model in the application
abstract class BaseModel extends Equatable {
  /// toJson converter
  Map<String, dynamic> toJson();

  /// copyWith converter
  copyWith();
}
