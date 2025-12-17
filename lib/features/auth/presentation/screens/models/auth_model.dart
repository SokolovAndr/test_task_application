import 'package:equatable/equatable.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'auth_model.gform.dart';

@Rf()
class AuthModel extends Equatable {
  const AuthModel({
    @RfControl(validators: [RequiredValidator()]) this.username = '',
    @RfControl(validators: [RequiredValidator()]) this.password = '',
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
