import 'package:doctor_hunt/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  final AuthRepo authRepo;
  ResetpasswordCubit({required this.authRepo}) : super(ResetpasswordInitial());
  Future<void> resetPassword(String email) async {
    ResetpasswordLoading();
    final result = await authRepo.resetPassword(email);
    result.fold(
      (error) {
        emit(ResetpasswordFailure(error: error.errorMsg));
      },
      (succes) {
        emit(ResetpasswordSuccess());
      },
    );
  }
}
