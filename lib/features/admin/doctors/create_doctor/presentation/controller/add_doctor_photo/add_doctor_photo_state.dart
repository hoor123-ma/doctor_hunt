part of 'add_doctor_photo_cubit.dart';

abstract class AddDoctorPhotoState extends Equatable {
  const AddDoctorPhotoState();

  @override
  List<Object> get props => [];
}

class AddDoctorPhotoInitial extends AddDoctorPhotoState {}

class AddDoctorPhotoLoading extends AddDoctorPhotoState {}

class AddDoctorPhotoSucces extends AddDoctorPhotoState {
  final String imageUrl;

  const AddDoctorPhotoSucces({required this.imageUrl});
}

class AddDoctorPhotoFailure extends AddDoctorPhotoState {
  final String errorMessage;

  const AddDoctorPhotoFailure({required this.errorMessage});
}
