import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'delete_doctor_state.dart';

class DeleteDoctorCubit extends Cubit<DeleteDoctorState> {
  final DoctorsRepo doctorsRepo;
  DeleteDoctorCubit({required this.doctorsRepo}) : super(DeleteDoctorInitial());

  void deleteDoctor(String docId) async {
    emit(DeleteDoctorLoading());
    final result = await doctorsRepo.deleteDoctor(docId);
    result.fold(
      (eror) {
        emit(DeleteDoctorFailure(erorMessage: eror.errorMsg));
      },
      (succes) {
        emit(DeleteDoctorSucces());
      },
    );
  }
}
