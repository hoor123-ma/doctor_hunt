import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoSlotsAvailableSection extends StatelessWidget {
  final String nextTime;

  const NoSlotsAvailableSection({super.key, required this.nextTime});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConsts.horizentalPadding),
      child: Column(
        children: [
          Text(l10n.noSlotsAvailable, style: AppTextStyle.subTitle),

          SizedBox(height: 20),

          CustomButton(title: l10n.nextAvailabilityOn(nextTime)),

          SizedBox(height: 15),

          Text(l10n.or, style: AppTextStyle.subTitle),

          SizedBox(height: 15),

          CustomButton(
            title: l10n.contactClinic,
            titleColor: AppColors.primaryColor,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
