import 'package:Veris/core/utils/form_inputs.dart';
import 'package:Veris/features/authentication/bloc/reset/reset_pass_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(const ResetPasswordState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email,]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> resetPassword() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: state.email.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (catchError) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}


