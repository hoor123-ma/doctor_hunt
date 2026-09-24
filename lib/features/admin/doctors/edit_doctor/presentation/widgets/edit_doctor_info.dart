import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class EditDoctorInfo extends StatefulWidget {
  final TextEditingController _nameController;
  final TextEditingController _specialityController;
  final AdminDoctorModel doctor;
  const EditDoctorInfo({
    super.key,
    required this.doctor,
    required TextEditingController nameController,
    required TextEditingController specialityController,
  }) : _nameController = nameController,
       _specialityController = specialityController;

  @override
  State<EditDoctorInfo> createState() => _EditDoctorInfoState();
}

class _EditDoctorInfoState extends State<EditDoctorInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).doctorName, style: context.semiBold14GreyColor),
        const SizedBox(height: 6),
        CustomTextField(
          controller: widget._nameController,
          prefixIcon: const Icon(Icons.person_outline, color: AppColors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).doctorSpeciality,
          style: context.semiBold14GreyColor,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: widget._specialityController,
          prefixIcon: const Icon(
            Icons.medical_services_outlined,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
