import 'package:equatable/equatable.dart';
import 'package:Veris/core/user/user.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
  error,
  authenticating
}

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.initial,
    this.user = UserModel.empty,
  });
  const AuthState.unknown() : this._();
  const AuthState.authenticated(UserModel user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticating() : this._(status: AuthStatus.authenticating);

  final AuthStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}
