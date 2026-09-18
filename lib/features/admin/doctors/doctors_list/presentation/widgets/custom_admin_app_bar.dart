import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/profile_photo.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/controller/upload_photo_cubit.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAdminAppBar extends StatelessWidget {
  final UserModel user;
  const CustomAdminAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadPatientPhotoCubit, UploadPhotoState>(
      listener: (context, state) {
        if (state is UploadPhotoFilure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final currentUser = state is UploadPhotoSuccess ? state.user : user;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).Doctors, style: AppTextStyle.medium18),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesButtonNotifications),
                const SizedBox(width: 5),
                ProfilePhoto(
                  user: user,
                  currentUser: currentUser,
                  state: state,
                  containerSize: 36,
                  iconSize: 14,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
