part of 'users_list_bloc.dart';

@freezed
sealed class UsersListState with _$UsersListState {
  const factory UsersListState.initial() = _Initial;
  const factory UsersListState.loading() = _Loading;
  const factory UsersListState.loaded({required UsersListEntity users}) =
      _Loaded;
}
