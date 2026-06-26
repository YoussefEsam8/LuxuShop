part of 'login_cupit_cubit.dart';

@immutable
sealed class LoginCupitState {}

final class LoginCupitInitial extends LoginCupitState {}

class LoginLoading extends LoginCupitState {}

class LoginSuccess extends LoginCupitState {
  final dynamic loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginError extends LoginCupitState {
  final String error;
  LoginError(this.error);
}
