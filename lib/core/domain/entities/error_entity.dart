import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ErrorEntity extends Equatable {
  const ErrorEntity({required this.error, this.retryAction});
  final String error;
  final VoidCallback? retryAction;

  @override
  List<Object?> get props => [error, retryAction];
}
