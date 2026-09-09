import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/presentation/controller/upload_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.user,
    required this.currentUser,
    required this.state,
    this.containerSize = 60,
    this.iconSize = 20,
  });

  final UserModel user;
  final UserModel currentUser;
  final UploadPhotoState state;
  final double containerSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UploadPhotoCubit>().uplaodPhoto(
          AppConsts.usersCollection,
          user,
        );
      },
      child: state is UploadPhotoLoading
          ? Container(
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withValues(alpha: .2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor.withValues(alpha: 0.2),
                  ),
                ),
              ),
            )
          : (currentUser.imageUrl == null || currentUser.imageUrl!.isEmpty)
          ? Container(
              alignment: Alignment.center,
              width: containerSize,
              height: containerSize,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withValues(alpha: .2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: iconSize,
                  color: AppColors.greyColor,
                ),
              ),
            )
          : ClipOval(
              child: Image.network(
                currentUser.imageUrl!,
                width: containerSize,
                height: containerSize,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
