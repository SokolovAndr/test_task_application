/*import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_easy/dtos/resource_error.dart';
import 'package:hr_easy/entities/error_entity.dart';
import 'package:hr_easy/repositories/auth_repository.dart';
import 'package:hr_easy/repositories/in_app_notification_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.authRepository, this.inAppNotificationRepository)
    : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      try {
        await authRepository.login(
          username: event.username,
          password: event.password,
        );
        emit(const _Finished());
      } on ResourceError catch (e) {
        emit(_Error(e.description));
      } on RequestError catch (e) {
        emit(const _Initial());
        await inAppNotificationRepository.addError(
          ErrorEntity(
            error: e.description,
            retryAction: () {
              if (!isClosed) {
                add(event);
              }
            },
          ),
        );
      }
    });
  }
  final AuthRepository authRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
*/