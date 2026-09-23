
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({super.key, required this.doctor});

  final AdminDoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: doctor.isActive
            ? AppColors.primaryColor.withValues(alpha: .1)
            : AppColors.red.withValues(alpha: .1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: doctor.isActive ? AppColors.primaryColor : AppColors.red,
          ),
          const SizedBox(width: 2),
          Text(
            doctor.isActive ? S.of(context).active : S.of(context).inactive,
            style: doctor.isActive
                ? context.semiBold12PrimaryColor
                : context.semiBold12.copyWith(color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
