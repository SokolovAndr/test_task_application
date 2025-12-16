part of 'users_list_bloc.dart';

@freezed
sealed class UsersListEvent with _$UsersListEvent {
  const factory UsersListEvent.loadMore({Completer? completer}) = _LoadMore;

  const factory UsersListEvent.load({Completer? completer}) = _Load;

  const factory UsersListEvent.updateLocal({
    required UserEntity entity,
    required int index,
  }) = _UpdateLocal;
}
