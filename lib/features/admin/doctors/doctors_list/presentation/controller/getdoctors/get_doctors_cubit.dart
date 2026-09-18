import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';

part 'get_doctors_state.dart';

class GetDoctorsCubit extends Cubit<GetDoctorsState> {
  StreamSubscription<Either<AppError, List<AdminDoctorModel>>>?
  _doctorSubscription;
  GetDoctorsCubit({required this.doctorsRepo}) : super(GetDoctorsInitial());
  final DoctorsRepo doctorsRepo;
  void getDoctors() {
    _doctorSubscription?.cancel();
    emit(GetDoctorsLoading());
    _doctorSubscription = doctorsRepo.getDoctors().listen((result) {
      result.fold(
        (error) {
          emit(GetDoctorsFailure(errorMessage: error.errorMsg));
        },
        (doctors) {
          emit(GetDoctorsSucces(doctors: doctors));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _doctorSubscription?.cancel();
    return super.close();
  }
}
