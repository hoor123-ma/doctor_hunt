import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/core/services/fire_store_service.dart';
import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:doctor_hunt/core/utils/errors/firestore_error.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo.dart';
import 'package:uuid/uuid.dart';

class DoctorsRepoImp implements DoctorsRepo {
  final CloudinaryService cloudinaryService;
  final FirestoreService firestoreService;

  const DoctorsRepoImp({
    required this.cloudinaryService,
    required this.firestoreService,
  });

  @override
  Future<Either<AppError, void>> addDoctor({
    required String imageUrl,
    required String name,
    required String speciality,
  }) async {
    try {
      final doctorId = const Uuid().v4();

      final doctor = AdminDoctorModel(
        id: doctorId,
        imageUrl: imageUrl,
        name: name,
        speciality: speciality,
        isActive: true,
      );

      await firestoreService.setDoc(
        AppConsts.doctorsCollection,
        doctorId,
        doctor.toJson(),
      );

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(FirestoreError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<AppError, String?>> addDoctorPhoto() async {
    try {
      final String? imageUrl;
      imageUrl = await cloudinaryService.uploadPhoto();
      if (imageUrl == null) {
        return const Right(null);
      } else {
        return Right(imageUrl);
      }
    } catch (e) {
      return const Left(AppError(errorMsg: "Failed to upload photo"));
    }
  }

  @override
  Stream<Either<AppError, List<AdminDoctorModel>>> getDoctors() {
    try {
      return firestoreService
          .getRealTimeCollection(AppConsts.doctorsCollection)
          .map((snapshot) {
            final doctors = snapshot.docs
                .map((doc) => AdminDoctorModel.fromJson(doc.data()))
                .toList();

            return Right(doctors);
          });
    } catch (e) {
      return Stream.value(
        const Left(AppError(errorMsg: 'Failed to get doctors')),
      );
    }
  }

  @override
  Future<Either<AppError, void>> deleteDoctor(String docId) async {
    try {
      await firestoreService.deleteDoc(AppConsts.doctorsCollection, docId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(FirestoreError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> updateDoctor({required docId, required Map<String, dynamic> data}) async{
     try {
      await firestoreService.updateDoc(AppConsts.doctorsCollection, docId,data);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(FirestoreError(errorMsg: e.toString()));
    }
  }

  

 
}
