import 'package:equatable/equatable.dart';

class InfoEntity extends Equatable {
  const InfoEntity({required this.notification});
  final String notification;

  @override
  List<Object?> get props => [notification];
}
