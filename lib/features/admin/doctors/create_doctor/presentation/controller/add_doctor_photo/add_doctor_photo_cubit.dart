import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';
import 'package:equatable/equatable.dart';

part 'add_doctor_photo_state.dart';

class AddDoctorPhotoCubit extends Cubit<AddDoctorPhotoState> {
  final DoctorsRepo doctorsRepo;
  AddDoctorPhotoCubit({required this.doctorsRepo})
    : super(AddDoctorPhotoInitial());
  Future<void> addDoctorPhoto() async {
    emit(AddDoctorPhotoLoading());
    final result = await doctorsRepo.addDoctorPhoto();
    result.fold(
      (error) {
        emit(AddDoctorPhotoFailure(errorMessage: error.errorMsg));
      },
      (imageUrl) {
        if (imageUrl == null) {
          emit(AddDoctorPhotoInitial());
        } else {
          emit(AddDoctorPhotoSucces(imageUrl: imageUrl));
        }
      },
    );
  }
}
