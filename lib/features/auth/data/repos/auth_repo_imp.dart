import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/services/auth_service.dart';
import 'package:doctor_hunt/core/services/shared_prefrence_services.dart';
import 'package:doctor_hunt/core/utils/errors/auth_error.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImp extends AuthRepo {
  final AuthService authService;

  AuthRepoImp({required this.authService});

  @override
  Future<Either<AuthError, UserModel>> signInWithEmailAndPassword(
    String email,
    String pass,
  ) async {
    try {
      final UserCredential credential = await authService
          .signInWithEmailandPassword(email, pass);
      final user = credential.user;

      if (user == null) {
        return Left(AuthError(errorMsg: 'User not found'));
      }
      return Right(
        UserModel(
          uid: user.uid,
          name: user.displayName ?? "",
          email: user.email ?? "",
        ),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthError.fromFirebaseAuthException(e));
      } else {
        return Left(
          AuthError(errorMsg: "Unexpexted error please try again later"),
        );
      }
    }
  }

  @override
  Future<Either<AuthError, UserModel>> signUp(
    String email,
    String pass,
    String name,
  ) async {
    try {
      final UserCredential credential = await authService
          .createUserWithEmailAndPassword(email, pass);
      await credential.user!.updateDisplayName(name);
      UserModel user = UserModel(
        uid: credential.user!.uid,
        name: name,
        email: credential.user!.email!,
      );

      return Right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthError.fromFirebaseAuthException(e));
      } else {
        return Left(
          AuthError(errorMsg: "Unexpexted error, please try again later."),
        );
      }
    }
  }

  @override
  Future<void> signOut() async {
    await authService.signOut();
  }

  @override
  Future<Either<AuthError, void>> resetPassword(String emailAddress) async {
    try {
      return Right(await authService.passwordResetEmail(emailAddress));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthError.fromFirebaseAuthException(e));
      } else {
        return Left(
          AuthError(errorMsg: "Unexpected error, please try again later."),
        );
      }
    }
  }

  @override
  Future<Either<AuthError, UserModel>> signInWithGoogle() async {
    try {
      UserCredential userCredential = await authService.signInWithGoogle();
      final user = userCredential.user;

      if (user == null) {
        return Left(AuthError(errorMsg: 'User not found'));
      }
      return Right(
        UserModel(
          uid: user.uid,
          name: user.displayName ?? "",
          email: user.email ?? "",
        ),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthError.fromFirebaseAuthException(e));
      } else if (e is GoogleSignInException) {
        return Left(AuthError.fromGoogleSignInException(e));
      } else {
        return Left(
          AuthError(errorMsg: "Unexpected error, please try again later."),
        );
      }
    }
  }
}
