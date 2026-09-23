import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
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
        const SizedBox(height: 5),
        Text(S.of(context).noDoctorsFound, style: context.bold16),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.center,
          S.of(context).noDoctorsRegistered,
          style: context.regular12,
        ),
      ],
    );
  }
}
