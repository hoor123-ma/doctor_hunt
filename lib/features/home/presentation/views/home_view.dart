import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/utils/service_locator.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo_imp.dart';
import 'package:doctor_hunt/features/home/presentation/controller/upload_photo_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/categories_section.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/feature_doctors_section.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/live_doctors_section.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/popular_doctors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final UserModel user;
  const HomeView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadPhotoCubit>(
      create: (context) => UploadPhotoCubit(userRepo: getIt<UserRepoImp>()),
      child: CustomScrollView(
        slivers: [
          CustomHomeAppBar(user: user),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: AppConsts.horizentalPadding,
              ),
              child: Text("Live Doctors", style: AppTextStyle.largeTitle),
            ),
          ),
          LiveDoctorsSection(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          CategoriesSection(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: AppConsts.horizentalPadding,
                right: AppConsts.horizentalPadding,
              ),
              child: Row(
                children: [
                  Text("Popular Doctors", style: AppTextStyle.largeTitle),
                  Spacer(),
                  Row(
                    children: [
                      Text("See all", style: AppTextStyle.subTitle),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.greyColor,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PopularDoctorsSection(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: AppConsts.horizentalPadding,
                right: AppConsts.horizentalPadding,
              ),
              child: Row(
                children: [
                  Text("Feature Doctor", style: AppTextStyle.largeTitle),
                  Spacer(),
                  Row(
                    children: [
                      Text("See all", style: AppTextStyle.subTitle),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.greyColor,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: FeatureDoctorsSection()),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
