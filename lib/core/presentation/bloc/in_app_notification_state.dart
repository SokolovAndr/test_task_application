part of 'in_app_notification_bloc.dart';

class InAppNotificationState {
  const InAppNotificationState({this.error, this.info});

  final ErrorEntity? error;
  final InfoEntity? info;
}
