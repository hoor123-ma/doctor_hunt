import 'package:doctor_hunt/core/utils/functions/show_error_message.dart';
import 'package:doctor_hunt/core/utils/functions/validations/doctor_speciality_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/name_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/create_doctor/cretae_doctor_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorInfo extends StatefulWidget {
  final String? imageUrl;
  const DoctorInfo({super.key, this.imageUrl});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final doctorNameController = TextEditingController();
  final doctorSpecialityController = TextEditingController();

  @override
  void dispose() {
    doctorNameController.dispose();
    doctorSpecialityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).doctorName),
          const SizedBox(height: 7),
          CustomTextField(
            validator: validateFullName,
            hintText: S.of(context).doctorNameHint,
            controller: doctorNameController,
          ),
          const SizedBox(height: 15),
          Text(S.of(context).doctorSpeciality),
          const SizedBox(height: 7),
          CustomTextField(
            hintText: S.of(context).specialtyHint,
            controller: doctorSpecialityController,
            validator: validateDoctorSpeciality,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: S.of(context).createDoctor,
            onTap: () {
              if (!formKey.currentState!.validate()) {
                return;
              }

              if (widget.imageUrl == null) {
                showErrorMessage(context, S.of(context).doctorPhotoMustBeAdded);
                return;
              }

              context.read<CreateDoctorCubit>().createDoctor(
                imageUrl: widget.imageUrl!,
                name: doctorNameController.text.trim(),
                speciality: doctorSpecialityController.text.trim(),
              );
            },
          ),
        ],
      ),
    );
  }
}
