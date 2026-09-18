import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDoctorsSection extends StatelessWidget {
  const NoDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesNoDoctorsMedicalIcon),
        SizedBox(height: 5),
        Text("No Doctors Found", style: AppTextStyle.bold16),
        SizedBox(height: 5),
        Text(
          textAlign: TextAlign.center,
          "There are currently no doctors registered on Doctor Hunt. Add your first doctor to get started.",
          style: AppTextStyle.regular12,
        ),
      ],
    );
  }
}
