part of 'update_doctor_cubit.dart';

abstract class UpdateDoctorState {
  const UpdateDoctorState();
}

class UpdateDoctorInitial extends UpdateDoctorState {}

class UpdateDoctorLoading extends UpdateDoctorState {}

class UpdateDoctorSuccess extends UpdateDoctorState {}

class UpdateDoctorFailure extends UpdateDoctorState {
  final String errorMessage;

  UpdateDoctorFailure({required this.errorMessage});
}
