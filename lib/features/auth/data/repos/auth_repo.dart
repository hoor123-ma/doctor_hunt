import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/errors/auth_error.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<AuthError, UserModel>> signInWithEmailAndPassword(
    String email,
    String pass,
  );
  Future<Either<AuthError, UserModel>> signInWithGoogle(String role);

  Future<Either<AuthError, UserModel>> signUp(
    String email,

    String pass,

    String name,
    String role,
  );

  Future<void> signOut();

  Future<Either<AuthError, void>> resetPassword(String emailAddress);
}
