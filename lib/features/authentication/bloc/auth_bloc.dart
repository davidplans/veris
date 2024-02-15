import 'dart:async';

import 'package:Veris/core/user/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/authentication/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository authenticationRepository;
  late StreamSubscription<AuthStream> authenticationStatusSubscription;
  AuthBloc({required this.authenticationRepository})
      : super(
          const AuthState.unknown(),
        ) {
    on<AuthenticationStatusChanged>(_onUserChanged);
    on<AuthenticationLogoutRequested>(_onLogoutRequested);
    on<AuthenticationPersistRequested>(_onPersistRequested);
    authenticationStatusSubscription = authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  void _onUserChanged(
      AuthenticationStatusChanged event, Emitter<AuthState> emit) {
    switch (event.status.status) {
      case AuthStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());

      case AuthStatus.authenticated:
        final user = event.status.user;
        return emit(AuthState.authenticated(user!));

      case AuthStatus.authenticating:
        return emit(const AuthState.authenticating());

      case AuthStatus.error:
        return emit(const AuthState.unauthenticated());

      case AuthStatus.initial:
        return emit(const AuthState.unknown());
    }
  }

  void _onLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthState> emit) {
    unawaited(authenticationRepository.logOut());
  }

  void _onPersistRequested(
      AuthenticationPersistRequested event, Emitter<AuthState> emit) {
    authenticationRepository.persistUserAuth();
  }

  @override
  Future<void> close() {
    authenticationStatusSubscription.cancel();
    return super.close();
  }
}
