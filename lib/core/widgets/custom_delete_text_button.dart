import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CustomDeleteTextButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomDeleteTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory, // يشيل الـ splash
        overlayColor: Colors.transparent, // يشيل الـ highlight/ripple
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.delete_outline, color: AppColors.red),
          Text(title, style: context.semiBold14.copyWith(color: AppColors.red)),
        ],
      ),
    );
  }
}
