import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/utils/functions/show_error_message.dart';
import 'package:doctor_hunt/core/utils/functions/validations/show_delete_doctor_dialog.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_delete_text_button.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo._imp.dart';
import 'package:doctor_hunt/features/admin/doctors/doctor_details/presentation/widgets/activity_container.dart';
import 'package:doctor_hunt/features/admin/doctors/doctor_details/presentation/widgets/doctor_details_container.dart';
import 'package:doctor_hunt/features/admin/doctors/presentation/controller/delete_doctor/delete_doctor_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminDoctorDetailsView extends StatelessWidget {
  final AdminDoctorModel doctor;
  const AdminDoctorDetailsView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contex) =>
          DeleteDoctorCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
      child: Builder(
        builder: (context) {
          return BlocListener<DeleteDoctorCubit, DeleteDoctorState>(
            listener: (context, state) {
              if (state is DeleteDoctorSucces) {
                context.pop();
                return;
              }
              if (state is DeleteDoctorFailure) {
                showErrorMessage(context, state.erorMessage);
              }
            },
            child: Scaffold(
              body: GradientBackground(
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: AppConsts.horizentalPadding,
                    ),
                    child: Column(
                      children: [
                        CustomAppBar(title: S.of(context).doctorDetails),
                        const SizedBox(height: 20),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(doctor.imageUrl),
                        ),
                        Text(doctor.name, style: context.bold18),
                        Text(
                          doctor.speciality,
                          style: context.medium14GreyColor,
                        ),
                        const SizedBox(height: 6),
                        ActivityContainer(doctor: doctor),
                        const SizedBox(height: 30),
                        DoctorDetailsContianer(doctor: doctor),
                        const SizedBox(height: 30),
                        CustomButton(
                          title: S.of(context).editDoctor,
                          onTap: () {
                            context.pushReplacement(
                              RouteNames.editDoctorRoute,
                              extra: doctor,
                            );
                          },
                        ),
                        const SizedBox(height: 4),
                        CustomDeleteTextButton(
                          title: S.of(context).deleteDoctor,
                          onPressed: () {
                            showDeletDoctorDialog(context, doctor.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
