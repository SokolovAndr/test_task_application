import 'package:equatable/equatable.dart';

class NameEntity extends Equatable {
  const NameEntity({required this.firstname, required this.lastname});

  final String firstname;
  final String lastname;

  @override
  List<Object?> get props => [firstname, lastname];
}
