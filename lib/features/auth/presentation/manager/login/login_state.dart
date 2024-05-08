import 'package:finalabanob/features/auth/data/auth_login/auth.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoaded extends LoginState {}

final class LoginSuccess extends LoginState {
  final Auth loginModel;

  LoginSuccess(this.loginModel);
}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

final class LoginchangePasswordVisibility extends LoginState {}