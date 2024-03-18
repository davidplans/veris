import 'package:Veris/core/user/authentication_repository.dart';
import 'package:Veris/features/authentication/models/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/utils/form_inputs.dart';
import 'package:formz/formz.dart';

class LoginCubit extends Cubit<LoginState> {
    final AuthenticationRepository authenticationRepository;
  LoginCubit(this.authenticationRepository) : super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await authenticationRepository.logIn(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (e) {
      print(e);
      // emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
