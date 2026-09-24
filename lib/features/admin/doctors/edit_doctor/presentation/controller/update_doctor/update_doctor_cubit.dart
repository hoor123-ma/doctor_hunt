import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'update_doctor_state.dart';

class UpdateDoctorCubit extends Cubit<UpdateDoctorState> {
  final DoctorsRepo doctorsRepo;
  UpdateDoctorCubit({required this.doctorsRepo}) : super(UpdateDoctorInitial());
  Future<void> updateDoctor(AdminDoctorModel doctor) async {
    final result = await doctorsRepo.updateDoctor(doctor);
    result.fold(
      (eror) {
        emit(UpdateDoctorFailure(errorMessage: eror.errorMsg));
      },
      (succes) {
        emit(UpdateDoctorSuccess());
      },
    );
  }
}
