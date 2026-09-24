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
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/activity_card.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/edit_doctor_info.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/edit_doctor_photo.dart';
import 'package:doctor_hunt/features/admin/doctors/presentation/controller/delete_doctor/delete_doctor_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditDoctorView extends StatefulWidget {
  final AdminDoctorModel doctor;
  const EditDoctorView({super.key, required this.doctor});

  @override
  State<EditDoctorView> createState() => _EditDoctorViewState();
}

class _EditDoctorViewState extends State<EditDoctorView> {
  late TextEditingController _nameController;
  late TextEditingController _specialityController;
  late String imageUrl;
  late bool isActive;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.doctor.name);
    _specialityController = TextEditingController(
      text: widget.doctor.speciality,
    );
    imageUrl = widget.doctor.imageUrl;
    isActive = widget.doctor.isActive;
    super.initState();
  }

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
                  UpdateDoctorCubit(doctorsRepo: getIt<DoctorsRepoImp>()),
            ),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<UpdateDoctorCubit, UpdateDoctorState>(
                listener: (context, state) {
                  if (state is UpdateDoctorSuccess) {
                    context.pop();
                  }

                  if (state is UpdateDoctorFailure) {
                    showErrorMessage(context, state.errorMessage);
                  }
                },
              ),
              BlocListener<AddDoctorPhotoCubit, AddDoctorPhotoState>(
                listener: (context, state) {
                  if (state is AddDoctorPhotoSucces) {
                    imageUrl = state.imageUrl;
                  }

                  if (state is AddDoctorPhotoFailure) {
                    showErrorMessage(context, state.errorMessage);
                  }
                },
              ),
              BlocListener<DeleteDoctorCubit, DeleteDoctorState>(
                listener: (context, state) {
                  if (state is DeleteDoctorSucces) {
                    context.pop();
                    return;
                  }

                  if (state is DeleteDoctorFailure) {
                    showErrorMessage(context, state.erorMessage);
                  }
                },
              ),
            ],
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
                            EditDoctorPhoto(imageUrl: imageUrl),
                            const SizedBox(height: 30),
                            EditDoctorInfo(
                              doctor: widget.doctor,
                              nameController: _nameController,
                              specialityController: _specialityController,
                            ),
                            const SizedBox(height: 15),
                            ActivationCard(
                              isActive: isActive,
                              onChanged: (value) {
                                setState(() {
                                  isActive = value;
                                });
                              },
                            ),
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
                              onTap: () {
                                context.read<UpdateDoctorCubit>().updateDoctor(
                                  widget.doctor.copyWith(
                                    name: _nameController.text,
                                    speciality: _specialityController.text,
                                    imageUrl: imageUrl,
                                    isActive: isActive,
                                  ),
                                );
                              },
                            ),
                            CustomDeleteTextButton(
                              title: S.of(context).deleteDoctor,
                              onPressed: () {
                                showDeletDoctorDialog(
                                  context,
                                  widget.doctor.id,
                                );
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

  @override
  void dispose() {
    _nameController.dispose();
    _specialityController.dispose();
    super.dispose();
  }
}
