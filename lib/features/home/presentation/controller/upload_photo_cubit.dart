import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo.dart';
part 'upload_photo_state.dart';

class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  final UserRepo userRepo;
  UploadPhotoCubit({required this.userRepo}) : super(UploadPhotoInitial());
  Future<void> uplaodPhoto(String collectionName, UserModel user) async {
    emit(UploadPhotoLoading());
    final result = await userRepo.uplaodUserPhoto(collectionName, user);
    result.fold(
      (error) {
        emit(UploadPhotoFilure(errorMessage: error.errorMsg));
      },
      (imageUrl) {
        if (imageUrl == null) {
          emit(UploadPhotoInitial());
          return;
        }
        final updatedUser = user.copyWith(imageUrl: imageUrl);

        emit(UploadPhotoSuccess(user: updatedUser));
      },
    );
  }
}
