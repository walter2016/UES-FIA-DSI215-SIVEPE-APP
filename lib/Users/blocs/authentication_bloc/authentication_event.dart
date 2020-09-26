import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent{}

class LoginRequest extends AuthenticationEvent{
  final String email;
  final String password;
  LoginRequest({ @required this.email, @required this.password });

  @override
  List<Object> get props => [email, password];

  @override
  bool get stringify => true;
}

class LoginError extends AuthenticationEvent {
  final String message;
  LoginError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class UpdateUserProfile extends AuthenticationEvent {
  final String name;
  final String photoURL;
  UpdateUserProfile({@required this.name, this.photoURL});

  @override
  List<Object> get props => [name, photoURL];

  @override
  bool get stringify => true;
}

class RegisterUserWithEmail extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  RegisterUserWithEmail({ @required this.name, @required this.email, @required this.password });

  @override
  List<Object> get props => [name, email, password];

  @override
  bool get stringify => true;
}
