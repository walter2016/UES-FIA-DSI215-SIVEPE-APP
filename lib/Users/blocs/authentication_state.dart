import '../models/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState();

  @override List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final UserEntity user;

  Authenticated(this.user);

  @override
  List<Object> get props => [this.user];

  @override
  bool get stringify => true;
}

class Unauthenticated extends AuthenticationState {
  final String reason;

  Unauthenticated(this.reason);

  @override
  List<Object> get props => [reason];

  @override
  bool get stringify => true;
}
