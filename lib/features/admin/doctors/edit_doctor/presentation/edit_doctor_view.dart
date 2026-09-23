import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/utils/functions/show_error_message.dart';
import 'package:doctor_hunt/core/utils/functions/validations/show_delete_doctor_dialog.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_delete_text_button.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/add_doctor_photo/add_doctor_photo_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo._imp.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/controller/update_doctor/update_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/edit_doctor_info.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/edit_doctor_photo.dart';
import 'package:doctor_hunt/features/admin/doctors/presentation/controller/delete_doctor/delete_doctor_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditDoctorView extends StatelessWidget {
  final AdminDoctorModel doctor;
  const EditDoctorView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AddDoctorPhotoCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
            ),
            BlocProvider(
              create: (context) =>
                  DeleteDoctorCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
            ),
            BlocProvider(
              create: (context) =>
                  UpdatedoctorCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
            ),
          ],
          child: BlocListener<DeleteDoctorCubit, DeleteDoctorState>(
            listener: (context, state) {
              if (state is DeleteDoctorSucces) {
                context.pop();
                return;
              }

              if (state is DeleteDoctorFailure) {
                showErrorMessage(context, state.erorMessage);
              }
            },
            child: Builder(
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConsts.horizentalPadding,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            CustomAppBar(title: S.of(context).editDoctor),
                            const SizedBox(height: 30),
                            EditDoctorPhoto(doctor: doctor),
                            const SizedBox(height: 30),
                            EditDoctorInfo(doctor: doctor),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomButton(
                              title: S.of(context).saveChanges,
                              onTap: () {},
                            ),
                            CustomDeleteTextButton(
                              title: S.of(context).deleteDoctor,
                              onPressed: () {
                                showDeletDoctorDialog(context, doctor.id);
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
