abstract class AuthState {}

final class AuthInitial extends AuthState {}

//////////////signup////////////////////////

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String msg;
  SignUpFailure(this.msg);
}

//////////////login////////////////////////

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInFailure extends AuthState {
  final String msg;
  LogInFailure(this.msg);
}

//////////////mail/////////////////////////

final class EmailNotVerified extends AuthState {}

final class EmailLoadingVerification extends AuthState {}

final class EmailSuccessVerification extends AuthState {}

final class ResendEmailSuccessVerification extends AuthState {}

final class EmailFailureVerification extends AuthState {
  final String msg;
  EmailFailureVerification(this.msg);
}

//////////////forget pass/////////////////////////

class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ForgetPasswordFailure extends AuthState {
  final String msg;
  ForgetPasswordFailure(this.msg);
}