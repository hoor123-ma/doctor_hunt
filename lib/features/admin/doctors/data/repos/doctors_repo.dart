import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';

abstract class DoctorsRepo {
Future<Either<AppError,String?>> addDoctorPhoto();
Future<Either<AppError,void>> addDoctor(AdminDoctorModel doctor);
Stream<Either<AppError,List<AdminDoctorModel>>> getDoctors();
}