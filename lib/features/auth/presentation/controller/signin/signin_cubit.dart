import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit({required this.authRepo}) : super(SigninInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (error) {
        emit(SigninFailure(errorMessage: error.errorMsg));
      },
      (user) {
        emit(SigninSuccess(user: user));
      },
    );
  }

  Future<void> signInWithGoogle(String role) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle(role);
    result.fold(
      (error) {
        if (error.isCancelled) {
          emit(SigninInitial());
          return;
        }
        emit(SigninFailure(errorMessage: error.errorMsg));
      },
      (user) {
        emit(SigninSuccess(user: user));
      },
    );
  }
}
