part of 'upload_photo_cubit.dart';

abstract class UploadPhotoState {
  const UploadPhotoState();
}

class UploadPhotoInitial extends UploadPhotoState {}

class UploadPhotoLoading extends UploadPhotoState {}

class UploadPhotoSuccess extends UploadPhotoState {
  final UserModel user;

  UploadPhotoSuccess({required this.user});
}

class UploadPhotoFilure extends UploadPhotoState {
  final String errorMessage;

  const UploadPhotoFilure({required this.errorMessage});
}
