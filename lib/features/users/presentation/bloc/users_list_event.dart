part of 'users_list_bloc.dart';

@freezed
sealed class UsersListEvent with _$UsersListEvent {
  const factory UsersListEvent.load({Completer? completer}) = _Load;
}
