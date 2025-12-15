import 'package:equatable/equatable.dart';

class GeolocationEntity extends Equatable {
  const GeolocationEntity({required this.lat, required this.long});

  final String lat;
  final String long;

  @override
  List<Object?> get props => [lat, long];
}
