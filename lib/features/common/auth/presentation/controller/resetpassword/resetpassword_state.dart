part of 'resetpassword_cubit.dart';

abstract class ResetpasswordState {
  const ResetpasswordState();
}

class ResetpasswordInitial extends ResetpasswordState {}

class ResetpasswordLoading extends ResetpasswordState {}

class ResetpasswordFailure extends ResetpasswordState {
  final String error;

  ResetpasswordFailure({required this.error});
}

class ResetpasswordSuccess extends ResetpasswordState {}
