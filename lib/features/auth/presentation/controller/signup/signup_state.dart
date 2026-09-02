part of 'signup_cubit.dart';

abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errorMesssage;

  const SignUpFailure({required this.errorMesssage});
}

class SignUpSuccess extends SignUpState {
  final UserModel user;

  const SignUpSuccess({required this.user});
}
