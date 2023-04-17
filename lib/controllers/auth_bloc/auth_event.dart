part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  RegisterUserEvent({
    required this.userName,
    required this.emailId,
    required this.phoneNumber,
    required this.password,
  });

  final String userName;
  final String emailId;
  final int phoneNumber;
  final String password;
}

class LoginUserEvent extends AuthEvent {
  LoginUserEvent({required this.emailId, required this.password});
  final String emailId;
  final String password;
}

class SaveActivePin extends AuthEvent {
  SaveActivePin({required this.activePin});
  final String activePin;
}
