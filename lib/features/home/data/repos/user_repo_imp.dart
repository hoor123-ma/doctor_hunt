import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/core/services/fire_store_service.dart';
import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:doctor_hunt/core/utils/errors/firestore_error.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo.dart';

class UserRepoImp extends UserRepo {
  final FirestoreService firestoreService;
  final CloudinaryService cloudinaryService;

  UserRepoImp({
    required this.firestoreService,
    required this.cloudinaryService,
  });

  @override
  Future<Either<AppError, void>> addUser(
    String collectionName,
    UserModel user,
  ) async {
    try {
      await firestoreService.setDoc(collectionName, user.uid, user.toJson());
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(FirestoreError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<AppError, UserModel>> getUser(
    String collectionName,
    String userId,
  ) async {
    try {
      final result = await firestoreService.getDoc(collectionName, userId);
      return Right(UserModel.fromJson(result.data()!));
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(FirestoreError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<AppError, String?>> uplaodUserPhoto(
    String collectionName,
    UserModel user,
  ) async {
    try {
      final String? imageUrl = await cloudinaryService.uploadPhoto();

      if (imageUrl == null) {
        return const Right(null);
      }

      await firestoreService.updateDoc(collectionName, user.uid, {
        'imageUrl': imageUrl,
      });

      return Right(imageUrl);
    } on FirebaseException catch (e) {
      return Left(FirestoreError.fromFirebaseException(e));
    } catch (e) {
      return Left(AppError(errorMsg: "Failed to upload photo"));
    }
  }
}
