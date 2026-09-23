import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'update_doctor_state.dart';

class UpdatedoctorCubit extends Cubit<UpdatedoctorState> {
  final DoctorsRepo doctorsRepo;
  UpdatedoctorCubit({required this.doctorsRepo}) : super(UpdatedoctorInitial());
  Future<void> updateDoctor({
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    final result = await doctorsRepo.updateDoctor(docId: docId, data: data);
    result.fold(
      (eror) {
        emit(UpdatedoctorFailure(errorMessage: eror.errorMsg));
      },
      (succes) {
        emit(UpdatedoctorSuccess());
      },
    );
  }
}
