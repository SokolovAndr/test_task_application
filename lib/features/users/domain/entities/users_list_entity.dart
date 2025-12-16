
import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';

class UsersListEntity extends Equatable {
  const UsersListEntity({
    required this.users,
    required this.totalCount,
  });

  UsersListEntity copyWith({
    List<UserEntity>? users,
    int? totalCount,
  }) => UsersListEntity(
    totalCount: totalCount ?? this.totalCount,
    users: users ?? this.users,
  );

  final List<UserEntity> users;
  final int totalCount;

  @override
  List<Object?> get props => [users, totalCount];
}
