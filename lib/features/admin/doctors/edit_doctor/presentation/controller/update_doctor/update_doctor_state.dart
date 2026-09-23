part of 'update_doctor_cubit.dart';

abstract class UpdatedoctorState {
  const UpdatedoctorState();
}

class UpdatedoctorInitial extends UpdatedoctorState {}

class UpdatedoctorLoading extends UpdatedoctorState {}

class UpdatedoctorSuccess extends UpdatedoctorState {}

class UpdatedoctorFailure extends UpdatedoctorState {
  final String errorMessage;

  UpdatedoctorFailure({required this.errorMessage});
}
