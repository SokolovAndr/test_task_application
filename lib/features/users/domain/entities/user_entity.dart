import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_task_application/features/users/domain/entities/address_entity.dart';
import 'package:test_task_application/features/users/domain/entities/name_entity.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  final AddressEntity address;
  final int id;
  final String email;
  final String username;
  final String password;
  final NameEntity name;
  final String phone;

  @override
  List<Object?> get props => [
    address,
    id,
    email,
    username,
    password,
    name,
    phone,
  ];
}

extension UserEntityInitials on UserEntity {
  String get initials {
    final first = name.firstname.characters.first;
    final second = name.lastname.characters.first;
    return (first + second).toUpperCase();
  }
}
