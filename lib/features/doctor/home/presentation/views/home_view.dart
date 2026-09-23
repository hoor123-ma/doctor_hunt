import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/doctor/home/data/repos/user_repo_imp.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/controller/upload_photo_cubit.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/categories_section.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/feature_doctors_section.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/live_doctors_section.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/popular_doctors_section.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final UserModel user;
  const HomeView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadPatientPhotoCubit>(
      create: (context) =>
          UploadPatientPhotoCubit(userRepo: getIt<UserRepoImp>()),
      child: CustomScrollView(
        slivers: [
          CustomHomeAppBar(user: user),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: AppConsts.horizentalPadding,
              ),
              child: Text(S.of(context).liveDoctors, style: context.medium18),
            ),
          ),
          const LiveDoctorsSection(),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const CategoriesSection(),
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
                  Text(S.of(context).popularDoctors, style: context.medium18),
                  const Spacer(),
                  Row(
                    children: [
                      Text(S.of(context).seeAll, style: context.regular14),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const PopularDoctorsSection(),
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
                  Text(S.of(context).featureDoctor, style: context.medium18),
                  const Spacer(),
                  Row(
                    children: [
                      Text(S.of(context).seeAll, style: context.regular14),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FeatureDoctorsSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
