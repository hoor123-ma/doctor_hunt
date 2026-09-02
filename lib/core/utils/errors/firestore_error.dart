import 'package:doctor_hunt/core/utils/errors/app_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreError extends AppError {
  const FirestoreError({required super.errorMsg});

  factory FirestoreError.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const FirestoreError(
          errorMsg: 'You do not have permission to access this data.',
        );

      case 'not-found':
        return const FirestoreError(
          errorMsg: 'The requested document was not found.',
        );

      case 'unavailable':
        return const FirestoreError(
          errorMsg: 'Service is currently unavailable. Please try again later.',
        );
      case 'deadline-exceeded':
        return const FirestoreError(
          errorMsg: 'Request timed out. Please try again.',
        );

      default:
        return FirestoreError(errorMsg: e.message ?? 'Something went wrong.');
    }
  }
}
