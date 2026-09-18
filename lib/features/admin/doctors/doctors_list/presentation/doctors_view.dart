import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/create_doctor/cretae_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo._imp.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/controller/getdoctors/get_doctors_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/active_and_total_doctors.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/custom_admin_app_bar.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/doctors_list_view.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/search_field.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/doctor/home/data/repos/user_repo_imp.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/controller/upload_photo_cubit.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsView extends StatelessWidget {
  final UserModel user;
  const DoctorsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadPatientPhotoCubit>(
          create: (context) =>
              UploadPatientPhotoCubit(userRepo: getIt<UserRepoImp>()),
        ),
        BlocProvider<GetDoctorsCubit>(
          create: (context) =>
              GetDoctorsCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
        ),
      ],
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(
            horizontal: AppConsts.horizentalPadding,
          ),
          child: Column(
            children: [
              CustomAdminAppBar(user: user),
              const SizedBox(height: 10),
              const ActiveAndTotalDoctors(),
              const SizedBox(height: 10),
              const SearchField(),
              const DoctorsListView(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
