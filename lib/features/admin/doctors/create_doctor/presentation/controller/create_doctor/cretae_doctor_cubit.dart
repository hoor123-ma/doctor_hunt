import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  final DoctorsRepo doctorsRepo;
  CreateDoctorCubit({required this.doctorsRepo}) : super(CreateDoctorInitial());
  Future<void> createDoctor({required String imageUrl,required String name,required String speciality}) async {
    final result = await doctorsRepo.addDoctor(imageUrl: imageUrl,name: name,speciality: speciality);
    result.fold(
      (error) {
        emit(CreateDoctorFailure(errorMessage: error.errorMsg));
      },
      (succes) {
        emit(CreateDoctorSucess());
      },
    );
  }
}
