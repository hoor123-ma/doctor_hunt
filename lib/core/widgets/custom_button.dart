// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final Color titleColor;
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor,
    this.titleColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: borderColor == null ? null : Border.all(color: borderColor!),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.largeTitle.copyWith(color: titleColor),
          ),
        ),
      ),
    );
  }
}
