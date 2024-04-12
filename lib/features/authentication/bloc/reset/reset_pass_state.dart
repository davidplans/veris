import 'package:Veris/core/utils/form_inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.email = const Email.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final Email email;
  final bool isValid;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, status];

  ResetPasswordState copyWith({
    Email? email,
    bool? isValid,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
