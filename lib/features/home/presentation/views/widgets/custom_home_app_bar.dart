import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_search_field.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/presentation/controller/upload_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeAppBar extends StatelessWidget {
  final UserModel user;
  const CustomHomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadPhotoCubit, UploadPhotoState>(
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
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Find Your Doctor",
                              style: AppTextStyle.headingLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<UploadPhotoCubit>().uplaodPhoto(
                              AppConsts.usersCollection,
                              user,
                            );
                          },
                          child: state is UploadPhotoLoading
                              ? Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.greyColor.withValues(
                                      alpha: .2,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.greyColor.withValues(
                                          alpha: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : (currentUser.imageUrl == null ||
                                    currentUser.imageUrl!.isEmpty)
                              ? Container(
                                  width: 60,
                                  height: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyColor.withValues(
                                      alpha: .2,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 30,
                                    color: AppColors.greyColor,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    currentUser.imageUrl!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
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
