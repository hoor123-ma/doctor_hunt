// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

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
    this.titleColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: borderColor == null ? null : Border.all(color: borderColor!),
        ),
        child: Center(child: Text(title, style: context.medium14WhiteColor)),
      ),
    );
  }
}
