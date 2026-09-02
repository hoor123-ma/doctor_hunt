import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthError extends AppError {
  final bool isCancelled;
  const AuthError({required super.errorMsg, this.isCancelled = false});

  factory AuthError.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return const AuthError(errorMsg: 'The password provided is too weak.');

      case 'email-already-in-use':
        return const AuthError(
          errorMsg: 'An account already exists for that email.',
        );

      case 'user-not-found':
        return const AuthError(errorMsg: 'No user found for that email.');

      case 'wrong-password':
        return const AuthError(errorMsg: 'Wrong password provided.');

      case 'invalid-email':
        return const AuthError(errorMsg: 'The email address is invalid.');

      case 'invalid-credential':
        return const AuthError(errorMsg: 'Invalid email or password.');
      default:
        return AuthError(errorMsg: e.message ?? 'Something went wrong.');
    }
  }

  factory AuthError.fromGoogleSignInException(GoogleSignInException e) {
    switch (e.code) {
      case GoogleSignInExceptionCode.canceled:
        return const AuthError(errorMsg: '', isCancelled: true);

      case GoogleSignInExceptionCode.interrupted:
        return const AuthError(
          errorMsg: 'Google sign-in was interrupted. Please try again.',
        );

      case GoogleSignInExceptionCode.clientConfigurationError:
        return const AuthError(
          errorMsg: 'Google Sign-In is not configured correctly.',
        );

      case GoogleSignInExceptionCode.providerConfigurationError:
        return const AuthError(
          errorMsg: 'Google Sign-In is currently unavailable.',
        );

      case GoogleSignInExceptionCode.uiUnavailable:
        return const AuthError(errorMsg: 'Google Sign-In UI is unavailable.');

      case GoogleSignInExceptionCode.userMismatch:
        return const AuthError(
          errorMsg:
              'The selected Google account does not match the current user.',
        );

      case GoogleSignInExceptionCode.unknownError:
        return AuthError(errorMsg: e.description ?? 'Google sign-in failed.');
    }
  }
}
