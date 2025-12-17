part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required AuthEntity auth,
  }) = _Login;
}
