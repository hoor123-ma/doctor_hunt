import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignupCubit({required this.authRepo}) : super(SignUpInitial());
  Future<void> signUp(
    String name,
    String email,
    String password,
    String role,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(email, password, name, role);
    result.fold(
      (error) {
        emit(SignUpFailure(errorMesssage: error.errorMsg));
      },
      (user) {
        emit(SignUpSuccess(user: user));
      },
    );
  }
}
