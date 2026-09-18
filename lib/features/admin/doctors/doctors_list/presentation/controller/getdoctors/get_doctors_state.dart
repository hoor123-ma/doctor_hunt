part of 'get_doctors_cubit.dart';

abstract class GetDoctorsState {
  const GetDoctorsState();
}

class GetDoctorsInitial extends GetDoctorsState {}

class GetDoctorsLoading extends GetDoctorsState {}

class GetDoctorsFailure extends GetDoctorsState {
  final String errorMessage;
  const GetDoctorsFailure({required this.errorMessage});
}

class GetDoctorsSucces extends GetDoctorsState {
  final List<AdminDoctorModel> doctors;
  const GetDoctorsSucces({required this.doctors});
}
