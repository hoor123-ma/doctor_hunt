import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/activity_card.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class EditDoctorInfo extends StatefulWidget {
  final AdminDoctorModel doctor;
  const EditDoctorInfo({super.key, required this.doctor});

  @override
  State<EditDoctorInfo> createState() => _EditDoctorInfoState();
}

class _EditDoctorInfoState extends State<EditDoctorInfo> {
  late TextEditingController _nameController;
  late TextEditingController _specialityController;
  @override
  void initState() {
    _nameController = TextEditingController(text: widget.doctor.name);
    _specialityController = TextEditingController(
      text: widget.doctor.speciality,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).doctorName, style: context.semiBold14GreyColor),
            const SizedBox(height: 6),
            CustomTextField(
              controller: _nameController,
              prefixIcon: const Icon(
                Icons.person_outline,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).doctorSpeciality,
              style: context.semiBold14GreyColor,
            ),
            const SizedBox(height: 6),
            CustomTextField(
              controller: _specialityController,
              prefixIcon: const Icon(
                Icons.medical_services_outlined,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 15),
            AcvtivityCard(doctor: widget.doctor),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specialityController.dispose();
    super.dispose();
  }
}
