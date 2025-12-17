part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loaded(String? username) = _Loaded;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.finished() = _Finished;
  const factory AuthState.error(String error) = _Error;
}
