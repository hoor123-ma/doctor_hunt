import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsContianer extends StatelessWidget {
  final AdminDoctorModel doctor;
  const DoctorDetailsContianer({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesMedicalIcon),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).speciality,
                    style: context.regular12GreyColor,
                  ),
                  Text(doctor.speciality, style: context.semiBold14),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(height: 2, color: AppColors.grey100),
          const SizedBox(height: 15),
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesStatus),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).accountStatus,
                    style: context.regular12GreyColor,
                  ),
                  Text(
                    doctor.isActive
                        ? S.of(context).active
                        : S.of(context).inactive,
                    style: context.semiBold14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
