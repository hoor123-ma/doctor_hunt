part of 'delete_doctor_cubit.dart';

abstract class DeleteDoctorState {
  const DeleteDoctorState();
}

class DeleteDoctorInitial extends DeleteDoctorState {}

class DeleteDoctorLoading extends DeleteDoctorState {}

class DeleteDoctorSucces extends DeleteDoctorState {}

class DeleteDoctorFailure extends DeleteDoctorState {
  final String erorMessage;
  DeleteDoctorFailure({required this.erorMessage});
}
