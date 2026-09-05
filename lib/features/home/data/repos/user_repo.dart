import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<AppError, String?>> uplaodUserPhoto(
    String collectionName,
    UserModel user,
  );
  Future<Either<AppError, void>> addUser(String collectionName, UserModel user);
  Future<Either<AppError, UserModel>> getUser(
    String collectionName,
    String userId,
  );
}
