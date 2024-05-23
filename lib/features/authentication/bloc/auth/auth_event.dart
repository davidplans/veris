import 'package:Veris/core/user/authentication_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequested extends AuthEvent {}
class AuthenticationPersistRequested extends AuthEvent {}

class AuthenticationStatusChanged extends AuthEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthStream status;

  @override
  List<Object> get props => [status];
}
