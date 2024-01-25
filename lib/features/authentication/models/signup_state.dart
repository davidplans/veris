import 'package:equatable/equatable.dart';
import 'package:Veris/core/utils/form_inputs.dart';
import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final bool isValid;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    bool? isValid,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
