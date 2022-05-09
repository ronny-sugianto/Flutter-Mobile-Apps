import 'package:equatable/equatable.dart';

/// Base class for all states used in the blocs
abstract class BaseState<T> extends Equatable {
  final T? data;
  final DateTime? timestamp;

  const BaseState({
    this.data,
    this.timestamp,
  });

  @override
  List<Object?> get props => [
        data,
        timestamp,
      ];
}

/// Default state
///
/// Use it for initialization of the bloc
class InitializedState<T> extends BaseState<T> {
  const InitializedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'InitializeState { timestamp: $timestamp, data: $data }';
  }
}

/// Main loading state
///
/// If the screen loads multiple data and needs more than one loading state,
/// consider creating another micro loading state on the corresponding blocs
class LoadingState<T> extends BaseState<T> {
  const LoadingState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'LoadingState { timestamp: $timestamp, data: $data }';
  }
}

/// Main success state for load data to the screen
///
/// If the screen loads multiple data and needs more than one loaded state,
/// consider creating another micro loaded state on the corresponding blocs
///
/// To indicate empty data, please consider use [EmptyState] instead of doing
/// length checking on this state.
class LoadedState<T> extends BaseState<T> {
  const LoadedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'LoadedState { timestamp: $timestamp, data: $data,}';
  }
}

/// Success state for action bloc
///
/// Don't use this state for blocs that responsible for loading data to the screen.
class SuccessState<T> extends BaseState<T> {
  const SuccessState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'SuccessState { timestamp: $timestamp, data: $data,}';
  }
}

/// Main empty state
///
/// Use this state for indicate empty data if the data successfully loaded.
class EmptyState<T> extends BaseState<T> {
  const EmptyState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'EmptyState { timestamp: $timestamp, data: $data }';
  }
}

/// Main error state
///
/// Use this state to indicate failure on every blocs.
///
/// If the screen loads multiple data and needs more than one error state,
/// consider creating another micro error state on the corresponding blocs
class ErrorState<T> extends BaseState<T> {
  /// Error message is enforced to be provided for UX clarity
  final String error;

  const ErrorState({
    required this.error,
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'ErrorState { timestamp: $timestamp, data: $data }';
  }
}
