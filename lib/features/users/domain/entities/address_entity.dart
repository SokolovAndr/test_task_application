import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/users/domain/entities/geolocation_entity.dart';

class AddressEntity extends Equatable {
  const AddressEntity({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  final GeolocationEntity geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  @override
  List<Object?> get props => [geolocation, city, street, number, zipcode];
}
