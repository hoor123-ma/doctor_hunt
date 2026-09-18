part of 'cretae_doctor_cubit.dart';

abstract class CreateDoctorState {
  const CreateDoctorState();
}

class CreateDoctorInitial extends CreateDoctorState {}

class CreateDoctorLoading extends CreateDoctorState {}

class CreateDoctorSucess extends CreateDoctorState {}

class CreateDoctorFailure extends CreateDoctorState {
  final String errorMessage;

  CreateDoctorFailure({required this.errorMessage});
}
