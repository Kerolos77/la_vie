import 'package:la_vie/data/models/registration/RegistrationModel.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class ChangeRegistration extends RegistrationState {}

class SignUpLoadingRegistrationState extends RegistrationState {}

class SignUpSuccessRegistrationState extends RegistrationState {
  final RegistrationModel registrationModel;

  SignUpSuccessRegistrationState(this.registrationModel);
}

class SignUpErrorRegistrationState extends RegistrationState {
  final String error;

  SignUpErrorRegistrationState({required this.error});
}
