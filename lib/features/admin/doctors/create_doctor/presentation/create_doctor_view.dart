import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/utils/functions/show_error_message.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/add_doctor_photo/add_doctor_photo_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/create_doctor/cretae_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/widgets/add_photo.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/widgets/doctor_info_form.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo._imp.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateDoctorView extends StatelessWidget {
  const CreateDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AddDoctorPhotoCubit(doctorsRepo: getIt<DoctorsRepoImp>());
          },
        ),
        BlocProvider(
          create: (context) {
            return CreateDoctorCubit(doctorsRepo: getIt<DoctorsRepoImp>());
          },
        ),
      ],
      child: BlocListener<CreateDoctorCubit, CreateDoctorState>(
        listener: (context, state) {
          if (state is CreateDoctorFailure) {
            showErrorMessage(context, state.errorMessage);
          }
          if (state is CreateDoctorSucess) {
            context.pop();
          }
        },
        child: BlocConsumer<AddDoctorPhotoCubit, AddDoctorPhotoState>(
          listener: (context, state) {
            if (state is AddDoctorPhotoFailure) {
              showErrorMessage(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            String? imageUrl;
            bool isPhotoLoading = false;
            if (state is AddDoctorPhotoSucces) {
              imageUrl = state.imageUrl;
            }
            if (state is AddDoctorPhotoLoading) {
              isPhotoLoading = true;
            }
            return Scaffold(
              body: GradientBackground(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConsts.horizentalPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(title: S.of(context).createDoctor),
                        const SizedBox(height: 30),
                        AddPhoto(imageUrl: imageUrl, isLoading: isPhotoLoading),
                        const SizedBox(height: 30),
                        DoctorInfo(imageUrl: imageUrl),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
