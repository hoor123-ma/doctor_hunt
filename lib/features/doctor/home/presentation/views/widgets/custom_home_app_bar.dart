import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_search_field.dart';
import 'package:doctor_hunt/core/widgets/profile_photo.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/controller/upload_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeAppBar extends StatelessWidget {
  final UserModel user;
  const CustomHomeAppBar({super.key, required this.user});

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
      builder: (BuildContext context, UploadPhotoState state) {
        final currentUser = state is UploadPhotoSuccess ? state.user : user;
        return SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 40,
                    left: 20,
                    right: 20,
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi ${user.name}! ",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "Find Your Doctor",
                              style: AppTextStyle.bold25.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ProfilePhoto(
                          user: user,
                          currentUser: currentUser,
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: -30,
                left: 20,
                right: 20,
                child: CustomSearchField(hintText: "Search..... "),
              ),
            ],
          ),
        );
      },
    );
  }
}
