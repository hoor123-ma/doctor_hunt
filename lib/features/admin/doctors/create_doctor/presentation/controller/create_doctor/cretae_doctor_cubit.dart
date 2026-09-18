import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'create_doctor_state.dart';

class CreateDoctorCubit extends Cubit<CreateDoctorState> {
  final DoctorsRepo doctorsRepo;
  CreateDoctorCubit({required this.doctorsRepo}) : super(CreateDoctorInitial());
  Future<void> createDoctor(AdminDoctorModel doctor) async {
    final result = await doctorsRepo.addDoctor(doctor);
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
