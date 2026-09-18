import 'package:doctor_hunt/core/utils/functions/show_error_message.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/create_doctor/cretae_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
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
  late GlobalKey formKey;
  final doctorNameController = TextEditingController();
  final doctorSpecialityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey();
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
            hintText: "e.g. Dr. Ahmed Ali",
            controller: doctorNameController,
          ),
          const SizedBox(height: 15),
          Text(S.of(context).doctorSpeciality),
          const SizedBox(height: 7),
          CustomTextField(
            hintText: "e.g. Dentist",
            controller: doctorSpecialityController,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: S.of(context).createDoctor,
            onTap: () {
              if (widget.imageUrl == null) {
                showErrorMessage(context, "Doctor's photo must be added");
              } else {
                context.read<CreateDoctorCubit>().createDoctor(
                  AdminDoctorModel(
                    imageUrl: widget.imageUrl!,
                    name: doctorNameController.text.trim(),
                    specialist: doctorSpecialityController.text.trim(),
                    isActive: true,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
