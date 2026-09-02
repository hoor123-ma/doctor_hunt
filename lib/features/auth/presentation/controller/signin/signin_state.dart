part of 'signin_cubit.dart';

abstract class SigninState {
  const SigninState();
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserModel user;
  const SigninSuccess({required this.user});
}

class SigninFailure extends SigninState {
  final String errorMessage;
  const SigninFailure({required this.errorMessage});
}
