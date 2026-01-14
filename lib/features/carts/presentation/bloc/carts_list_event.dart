part of 'carts_list_bloc.dart';

@freezed
sealed class CartsListEvent with _$CartsListEvent {
  const factory CartsListEvent.load({Completer? completer}) = _Load;
}
