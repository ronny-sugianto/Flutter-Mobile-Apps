import 'package:equatable/equatable.dart';

/// Base class for all model in the application
abstract class BaseModel extends Equatable {
  /// copyWith converter
  copyWith();
}
