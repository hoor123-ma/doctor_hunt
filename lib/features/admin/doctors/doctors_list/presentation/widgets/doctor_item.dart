import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final AdminDoctorModel doctor;
  const DoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(doctor.imageUrl, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: context.bold14),
                Text(doctor.speciality, style: context.regular12GreyColor),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: doctor.isActive
                        ? AppColors.primaryColor.withValues(alpha: .2)
                        : Colors.red.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: doctor.isActive
                            ? AppColors.primaryColor
                            : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        doctor.isActive
                            ? S.of(context).active
                            : S.of(context).inactive,
                        style: context.bold12.copyWith(
                          color: doctor.isActive
                              ? AppColors.primaryColor
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
