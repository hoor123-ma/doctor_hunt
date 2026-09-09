import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/services/auth_service.dart';
import 'package:doctor_hunt/core/services/fire_store_service.dart';
import 'package:doctor_hunt/core/utils/errors/auth_error.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImp extends AuthRepo {
  final AuthService authService;
  final FirestoreService firestoreService;

  AuthRepoImp({required this.authService, required this.firestoreService});

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
      final result = await firestoreService.getDoc(
        AppConsts.usersCollection,
        user.uid,
      );
      UserModel currentUser = UserModel.fromJson(result.data()!);
      return Right(currentUser);
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
    String role,
  ) async {
    try {
      final UserCredential credential = await authService
          .createUserWithEmailAndPassword(email, pass);
      await credential.user!.updateDisplayName(name);
      UserModel user = UserModel(
        uid: credential.user!.uid,
        name: name,
        email: credential.user!.email!,
        role: role,
      );

      await firestoreService.setDoc(
        AppConsts.usersCollection,
        user.uid,
        user.toJson(),
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
  Future<Either<AuthError, UserModel>> signInWithGoogle(String role) async {
    try {
      UserCredential userCredential = await authService.signInWithGoogle();
      final user = userCredential.user;

      if (user == null) {
        return Left(AuthError(errorMsg: 'User not found'));
      }
      final result = await firestoreService.getDoc(
        AppConsts.usersCollection,
        user.uid,
      );

      if (result.exists && result.data() != null) {
        return Right(UserModel.fromJson(result.data()!));
      }

      // المستخدم جديد ومفيش document
      final newUser = UserModel(
        uid: user.uid,
        name: user.displayName ?? "",
        email: user.email ?? "",
        role: role,
      );

      await firestoreService.setDoc(
        AppConsts.usersCollection,
        user.uid,
        newUser.toJson(),
      );
      return Right(newUser);
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
