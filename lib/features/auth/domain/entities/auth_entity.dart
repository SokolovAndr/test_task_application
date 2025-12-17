import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String username;

  final String password;

  const AuthEntity({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
