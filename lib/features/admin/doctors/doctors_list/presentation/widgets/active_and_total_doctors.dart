import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ActiveAndTotalDoctors extends StatelessWidget {
  final int activeDoctorsNum;
  final int totalDoctorsNum;
  const ActiveAndTotalDoctors({super.key, required this.activeDoctorsNum, required this.totalDoctorsNum});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomContainer(
            title: S.of(context).activeDoctors,
            doctorsNum: activeDoctorsNum
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomContainer(
            title: S.of(context).totalDoctors,
            doctorsNum: totalDoctorsNum,
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final int doctorsNum;
  const CustomContainer({
    super.key,
    required this.title,
    required this.doctorsNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.regular11),
          const SizedBox(height: 10),
          Text(doctorsNum.toString(), style: context.bold18),
        ],
      ),
    );
  }
}
