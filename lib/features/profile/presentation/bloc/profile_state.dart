part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const factory ProfileState.loaded({
    required UserEntity user,
  }) = _Loaded;
  const factory ProfileState.loading() = _Loading;
}
