
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/edit_doctor/presentation/widgets/custom_switch.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class AcvtivityCard extends StatelessWidget {
  final AdminDoctorModel doctor;
  const AcvtivityCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor.withValues(alpha: .1),
              ),
              child: const Icon(
                Icons.local_activity_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                Text(S.of(context).doctorStatus, style: context.semiBold14),
                Text(
                  S.of(context).active_Available,
                  style: context.regular12GreyColor,
                ),
              ],
            ),
            const Spacer(),
            CustomSwitch(doctor: doctor),
          ],
        ),
      ),
    );
  }
}