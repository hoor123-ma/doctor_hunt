import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/utils/service_locator.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/profile_photo.dart';
import 'package:doctor_hunt/features/admindoctors_list/presentation/custom_admin_app_bar.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo_imp.dart';
import 'package:doctor_hunt/features/home/presentation/controller/upload_photo_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsListView extends StatelessWidget {
  final UserModel user;
  const DoctorsListView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadPhotoCubit>(
      create: (context) => UploadPhotoCubit(userRepo: getIt<UserRepoImp>()),

      child: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(
            horizontal: AppConsts.horizentalPadding,
          ),
          child: Column(children: [CustomAdminAppBar(user: user)]),
        ),
      ),
    );
  }
}
