import 'package:equatable/equatable.dart';
import 'package:flutter_schema_health/data/models/user.dart';



abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AuthEvent {}

class AppUserChanged extends AuthEvent {

  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}