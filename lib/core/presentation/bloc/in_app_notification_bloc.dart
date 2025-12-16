import 'package:bloc/bloc.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/core/domain/entities/info_entity.dart';

part 'in_app_notification_event.dart';
part 'in_app_notification_state.dart';

class InAppNotificationBloc
    extends Bloc<_InAppNotificationEventRefresh, InAppNotificationState> {
  InAppNotificationBloc(this.inAppNotificationRepository)
    : super(const InAppNotificationState()) {
    on<_InAppNotificationEventRefresh>((event, emit) async {
      final error = await inAppNotificationRepository.error;
      final info = await inAppNotificationRepository.info;
      emit(InAppNotificationState(error: error, info: info));
    });
    inAppNotificationRepository.addListener(_update);
  }

  final InAppNotificationRepository inAppNotificationRepository;

  void _update() {
    add(const _InAppNotificationEventRefresh());
  }

  @override
  Future<void> close() {
    inAppNotificationRepository.removeListener(_update);
    return super.close();
  }
}
